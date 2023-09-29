import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider_try_2_animation/data/reference_data.dart';
import 'package:provider_try_2_animation/widgets/socials_widget.dart';

class SkillsPage extends StatefulWidget {
  const SkillsPage({super.key});

  @override
  State<SkillsPage> createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> {
  List<bool> hovered = List.filled(images.length, false);
  @override
  Widget build(BuildContext context) {
    final aboutTextStyle = TextStyle(
        color: Colors.white,
        fontSize: MediaQuery.of(context).size.height * 0.03,
        fontFamily: GoogleFonts.aBeeZee().fontFamily);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        // height: MediaQuery.of(context).size.height,
        color: Colors.black,
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Center(child: titleText(context, "SKILLS")),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Row(children: [
              SizedBox(width: MediaQuery.of(context).size.width * 0.05),
              Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Text(
                      "📱 Mobile App Development: Proficient in 🚀 Flutter,  Dart, and Firebase for cross-platform mobile app development with 2 years of experience.",
                      style: aboutTextStyle,
                      textAlign: TextAlign.justify,
                    ),
                    const Text(""),
                    Text(
                        "📊 State Management: Experienced with BLoC and currently learning 🔄 Provider for effective state management in Flutter applications.",
                        style: aboutTextStyle,
                        textAlign: TextAlign.justify),
                    const Text(""),
                    Text(
                        "📱 Android Development: Familiar with ☕ Java and 📝 Android Studio for native Android app development.",
                        style: aboutTextStyle,
                        textAlign: TextAlign.justify),
                    const Text(""),
                    Text(
                        " 💻 Programming Languages: Proficient in 🖥️ C++, 🐍 Python, and Dart, with the ability to adapt to various programming languages and technologies.",
                        style: aboutTextStyle,
                        textAlign: TextAlign.justify),
                    const Text(""),
                    Text(
                        " 🔗 Version Control: Knowledgeable in 🗂️ Git and 🌐 GitHub for collaborative coding and code versioning.",
                        style: aboutTextStyle,
                        textAlign: TextAlign.justify)
                  ])),
              SizedBox(width: MediaQuery.of(context).size.width * 0.05),
            ]),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MouseRegion(
                          onEnter: (event) {
                            setState(() {
                              hovered[index] = true;
                            });
                          },
                          onExit: (event) {
                            setState(() {
                              hovered[index] = false;
                            });
                          },
                          child: Container(
                              height: MediaQuery.of(context).size.height * 0.3,
                              width: MediaQuery.of(context).size.height * 0.3,
                              decoration: BoxDecoration(
                                  color: hovered[index] == false
                                      ? Colors.grey.shade800
                                      : Colors.blue.shade600,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    images[index],
                                    height: MediaQuery.of(context).size.height *
                                        0.15,
                                    fit: BoxFit.cover,
                                  ),
                                  Text(techs[index], style: aboutTextStyle)
                                ],
                              )),
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
