import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider_try_2_animation/animations/lottie_animations.dart';
import 'package:provider_try_2_animation/animations/text_animation.dart';
import 'package:provider_try_2_animation/screens/about_screen.dart';
import 'package:provider_try_2_animation/screens/project_screen.dart';
import 'package:provider_try_2_animation/screens/skills_screen.dart';
import 'package:provider_try_2_animation/widgets/appbar_widget.dart';
import 'package:provider_try_2_animation/widgets/socials_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Stack(children: [
                    bgAnimation(context),
                    Container(
                      color: Colors.transparent,
                      child: Center(
                          child: SizedBox(
                        // height: MediaQuery.of(context).size.height * 0.8,
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.3,
                              left: MediaQuery.of(context).size.width * 0.2),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: Row(children: [
                                    Text(' Hello ',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.02,
                                            fontFamily: GoogleFonts.aBeeZee()
                                                .fontFamily)),
                                    hiAnimation(context),
                                    Text(', I am',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.02,
                                            fontFamily: GoogleFonts.aBeeZee()
                                                .fontFamily)),
                                  ]),
                                ),
                                Text('Pruthvi Patel',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.08,
                                        fontWeight: FontWeight.bold,
                                        fontFamily:
                                            GoogleFonts.aBeeZee().fontFamily)),
                                SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    child: AnimateText(
                                        cursor: '|',
                                        pauseDuration:
                                            const Duration(milliseconds: 600),
                                        speed: const Duration(milliseconds: 50),
                                        animatedTextStyle: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.03,
                                            color: Colors.white,
                                            fontFamily: GoogleFonts.aBeeZee()
                                                .fontFamily),
                                        textToAnimate: const [
                                          Text("Computer Engineering Student."),
                                          Text("Flutter Developer.")
                                        ])),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.07),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: Row(children: [
                                    onSocialClicked(
                                        context,
                                        'https://github.com/PatelPruthvi',
                                        'images/socials/github_icon.png'),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.01),
                                    onSocialClicked(
                                        context,
                                        'https://linkedin.com/in/-patelpruthvi-',
                                        'images/socials/linked_in.png'),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.01),
                                    onSocialClicked(
                                        context,
                                        "https://leetcode.com/pruthvikp8613",
                                        'images/socials/leetcode_icon.png'),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.01),
                                    onSocialClicked(
                                        context,
                                        "https://twitter.com/_patelpruthvi_",
                                        'images/socials/twitter_icon.png'),
                                  ]),
                                ),
                              ]),
                        ),
                      )),
                    ),
                  ]),
                  const AboutPage(),
                  const SkillsPage(),
                  const ProjectsPage()
                ],
              ),
            ),
            stickyAppBar(context)
          ],
        ));
  }
}
