import 'package:emailjs/emailjs.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider_try_2_animation/widgets/socials_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  TextEditingController nameC = TextEditingController();
  TextEditingController mailC = TextEditingController();
  TextEditingController messageC = TextEditingController();

  final formkey = GlobalKey<FormState>();

  void _sendEmail() async {
    try {
      await EmailJS.send(
        serviceIdForContactMe,
        templateIdForContactMe,
        {
          'from_email': mailC.text.trim(),
          'message': messageC.text,
          'from_name': nameC.text
        },
        const Options(
          publicKey: publicKeyForContact,
          privateKey: pvtKeyForContact,
        ),
      );
      nameC.clear();
      mailC.clear();
      messageC.clear();
    } catch (error) {
      if (error is EmailJSResponseStatus) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('ERROR... ${error.status}: ${error.text}')));
      }
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('ERROR... ${error.toString()}')));
      print(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final aboutTextStyle = TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w700,
        letterSpacing: 2,
        fontSize: MediaQuery.of(context).size.height * 0.05,
        fontFamily: GoogleFonts.aBeeZee().fontFamily);
    final smallerTextStyle = TextStyle(
        fontSize: MediaQuery.of(context).size.height * 0.03,
        color: Colors.white,
        fontFamily: GoogleFonts.aBeeZee().fontFamily);
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.08),
          Center(child: titleText(context, "CONTACT ME")),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: "Let's ",
                style: aboutTextStyle.copyWith(color: Colors.blue.shade600)),
            TextSpan(text: "Connect!!!", style: aboutTextStyle),
          ])),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.54,
                child: Form(
                  key: formkey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        textFieldModel('Enter Your Name', nameC, 1, "Name"),
                        textFieldModel('Enter Your E-mail', mailC, 1, "E-Mail"),
                        textFieldModel(
                            'Enter Your Message', messageC, 3, "Message"),
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors.blue.shade600)),
                            onPressed: () {
                              if (formkey.currentState!.validate()) {
                                _sendEmail();
                              }
                            },
                            child: Text(
                              "Send",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.03,
                                  color: Colors.white,
                                  fontFamily: GoogleFonts.aBeeZee().fontFamily),
                            ))
                      ]),
                ),
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.025),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: VerticalDivider(
                  color: Colors.grey.shade200, width: 2, thickness: 2),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.025),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "Whether you want to get in touch, talk about a project collaboration, or just say hi, I'd love to hear from you.",
                        textAlign: TextAlign.justify,
                        style: smallerTextStyle),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    ElevatedButton.icon(
                      onPressed: () {
                        launchUrl(Uri.parse("mailto:$mailAddress"));
                      },
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.transparent)),
                      icon:
                          Icon(Icons.mail_outline, color: Colors.blue.shade600),
                      label: Text(mailAddress,
                          style: smallerTextStyle.copyWith(
                              color: Colors.blue.shade600)),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                    )
                  ]),
            ),
          ]),
          const Divider(
            color: Colors.white,
            height: 2,
          ),
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              onSocialClicked(context, 'https://github.com/PatelPruthvi',
                  'images/socials/github_icon.png'),
              SizedBox(width: MediaQuery.of(context).size.width * 0.01),
              onSocialClicked(context, 'https://linkedin.com/in/-patelpruthvi-',
                  'images/socials/linked_in.png'),
              SizedBox(width: MediaQuery.of(context).size.width * 0.01),
              onSocialClicked(context, "https://leetcode.com/pruthvikp8613",
                  'images/socials/leetcode_icon.png'),
              SizedBox(width: MediaQuery.of(context).size.width * 0.01),
              onSocialClicked(context, "https://twitter.com/_patelpruthvi_",
                  'images/socials/twitter_icon.png'),
            ]),
          ),
          Text("Coded with 💙 | Pruthvi Patel", style: smallerTextStyle),
        ],
      ),
    ));
  }
}
