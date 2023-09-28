import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider_try_2_animation/widgets/socials_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    final aboutTextStyle = TextStyle(
        color: Colors.white,
        fontSize: MediaQuery.of(context).size.height * 0.03,
        fontFamily: GoogleFonts.aBeeZee().fontFamily);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        color: Colors.black,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          Center(child: titleText(context, 'ABOUT ME')),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Row(children: [
            SizedBox(width: MediaQuery.of(context).size.width * 0.025),
            Container(
              height: MediaQuery.of(context).size.width * 0.15,
              width: MediaQuery.of(context).size.width * 0.15,
              decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.width * 0.075)),
                  image: const DecorationImage(
                      image: AssetImage('images/socials/dp.png'),
                      fit: BoxFit.cover)),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.025),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "🎓 I'm currently in my final year pursuing a B.Tech degree at CHARUSAT University, with a focus on Computer Engineering.📚 ",
                      style: aboutTextStyle,
                      textAlign: TextAlign.justify,
                    ),
                    const Text(""),
                    Text(
                        "💻 As a Flutter developer, I have a deep passion for crafting versatile, cross-platform applications that turn ideas into reality. My toolkit includes state management packages like BLoC, and I rely on Firebase for robust backend solutions. 🔧",
                        style: aboutTextStyle,
                        textAlign: TextAlign.justify),
                    const Text(""),
                    Text(
                        "🧠 I'm an aspiring competitive coder, diving into platforms like LeetCode to sharpen my problem-solving skills. 💡When I'm not coding, I'm off exploring new destinations, fueling my wanderlust. ",
                        style: aboutTextStyle,
                        textAlign: TextAlign.justify),
                    const Text(""),
                    Text(
                        "🗺️ I also find joy in the excitement of mobile gaming and being part of the volleyball team. 🏐",
                        style: aboutTextStyle,
                        textAlign: TextAlign.justify),
                    const Text(""),
                    Text(
                        "🌟 I firmly believe in balance, both in work and play, and I'm eager to embark on new technological adventures. Let's connect and explore the endless possibilities together! 🚀",
                        style: aboutTextStyle,
                        textAlign: TextAlign.justify),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    ElevatedButton(
                      onPressed: () {
                        launchUrl(Uri.parse(resumeLink));
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              const MaterialStatePropertyAll(Colors.black),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.blue.shade600),
                                  borderRadius: BorderRadius.circular(10)))),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.12,
                        height: MediaQuery.of(context).size.height * 0.05,
                        child: Row(
                          children: [
                            Expanded(
                                child: Text('Resume',
                                    style: TextStyle(
                                        color: Colors.blue.shade600,
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                        fontFamily:
                                            GoogleFonts.aBeeZee().fontFamily))),
                            Icon(Icons.download_outlined,
                                color: Colors.blue.shade600)
                          ],
                        ),
                      ),
                    )
                  ]),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.05)
          ]),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
        ]),
      ),
    );
  }
}
