// ignore_for_file: use_build_context_synchronously

import 'package:emailjs/emailjs.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider_try_2_animation/widgets/socials_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreenMobile extends StatefulWidget {
  const ContactScreenMobile({super.key});

  @override
  State<ContactScreenMobile> createState() => _ContactScreenMobileState();
}

class _ContactScreenMobileState extends State<ContactScreenMobile> {
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
      if (kDebugMode) {
        print(error.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final aboutTextStyle = TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w700,
        letterSpacing: 2,
        fontSize: MediaQuery.of(context).size.width * 0.05,
        fontFamily: GoogleFonts.aBeeZee().fontFamily);
    final smallerTextStyle = TextStyle(
        fontSize: MediaQuery.of(context).size.height * 0.02,
        color: Colors.white,
        fontFamily: GoogleFonts.aBeeZee().fontFamily);
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                Center(child: titleText(context, "CONTACT ME")),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "Let's ",
                      style:
                          aboutTextStyle.copyWith(color: Colors.blue.shade600)),
                  TextSpan(text: "Connect!!!", style: aboutTextStyle),
                ])),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.54,
                  child: Form(
                    key: formkey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          textFieldModel('Enter Your Name', nameC, 1, "Name",
                              smallerTextStyle),
                          textFieldModel('Enter Your E-mail', mailC, 1,
                              "E-Mail", smallerTextStyle),
                          textFieldModel('Enter Your Message', messageC, 3,
                              "Message", smallerTextStyle),
                          ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Colors.blue.shade600)),
                              onPressed: () {
                                if (formkey.currentState!.validate()) {
                                  _sendEmail();
                                }
                              },
                              child: Text("Send", style: smallerTextStyle))
                        ]),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.width * 0.025),
                const Divider(color: Colors.white, thickness: 2),
                SizedBox(height: MediaQuery.of(context).size.width * 0.025),
                Text(
                    "Whether you want to get in touch, talk about a project collaboration, or just say hi, I'd love to hear from you.",
                    textAlign: TextAlign.justify,
                    style: smallerTextStyle),
                SizedBox(height: MediaQuery.of(context).size.width * 0.025),
                ElevatedButton.icon(
                  onPressed: () {
                    launchUrl(Uri.parse("mailto:$mailAddress"));
                  },
                  style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.transparent)),
                  icon: Icon(Icons.mail_outline, color: Colors.blue.shade600),
                  label: Text(mailAddress,
                      style: smallerTextStyle.copyWith(
                          color: Colors.blue.shade600)),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                const Divider(
                  color: Colors.white,
                  height: 2,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  onSocialClicked(
                      context,
                      'https://github.com/PatelPruthvi',
                      'images/socials/github_icon.png',
                      MediaQuery.of(context).size.height * 0.01),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                  onSocialClicked(
                      context,
                      'https://linkedin.com/in/-patelpruthvi-',
                      'images/socials/linked_in.png',
                      MediaQuery.of(context).size.height * 0.01),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                  onSocialClicked(
                      context,
                      "https://leetcode.com/pruthvikp8613",
                      'images/socials/leetcode_icon.png',
                      MediaQuery.of(context).size.height * 0.01),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                  onSocialClicked(
                      context,
                      "https://twitter.com/_patelpruthvi_",
                      'images/socials/twitter_icon.png',
                      MediaQuery.of(context).size.height * 0.01),
                ]),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Text("Coded with 💙 | Pruthvi Patel", style: smallerTextStyle),
              ]),
            )));
  }
}
