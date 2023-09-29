import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider_try_2_animation/animations/lottie_animations.dart';
import 'package:provider_try_2_animation/animations/text_animation.dart';
import 'package:provider_try_2_animation/widgets/socials_widget.dart';

class HomePageMobile extends StatefulWidget {
  const HomePageMobile({super.key});

  @override
  State<HomePageMobile> createState() => _HomePageMobileState();
}

class _HomePageMobileState extends State<HomePageMobile> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
          height: MediaQuery.of(context).size.height,
          child: bgAnimationMobile(context)),
      Padding(
        padding:
            EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.26),
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.8,
            color: Colors.transparent,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // AspectRatio(
                  //     aspectRatio: 2.5 * 16 / 9,
                  //     child: Container(
                  //       color: Colors.transparent,
                  //     )),
                  Row(children: [
                    Text(' Hello ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize:
                                MediaQuery.of(context).size.shortestSide * 0.03,
                            fontFamily: GoogleFonts.aBeeZee().fontFamily)),
                    hiAnimation(context,
                        MediaQuery.of(context).size.shortestSide * 0.06),
                    Text(', I am',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.025,
                            fontFamily: GoogleFonts.aBeeZee().fontFamily)),
                  ]),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text('Pruthvi Patel',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize:
                                MediaQuery.of(context).size.shortestSide * 0.08,
                            fontWeight: FontWeight.bold,
                            fontFamily: GoogleFonts.aBeeZee().fontFamily)),
                  ),

                  AnimateText(
                      cursor: '|',
                      pauseDuration: const Duration(milliseconds: 600),
                      speed: const Duration(milliseconds: 50),
                      animatedTextStyle: TextStyle(
                          fontSize:
                              MediaQuery.of(context).size.shortestSide * 0.03,
                          color: Colors.white,
                          fontFamily: GoogleFonts.aBeeZee().fontFamily),
                      textToAnimate: const [
                        Text("Computer Engineering Student."),
                        Text("Flutter Developer.")
                      ]),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.width * 0.1,
                    child: Row(children: [
                      onSocialsClickedMobile(
                        context,
                        'https://github.com/PatelPruthvi',
                        'images/socials/github_icon.png',
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                      onSocialsClickedMobile(
                          context,
                          'https://linkedin.com/in/-patelpruthvi-',
                          'images/socials/linked_in.png'),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                      onSocialsClickedMobile(
                          context,
                          "https://leetcode.com/pruthvikp8613",
                          'images/socials/leetcode_icon.png'),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                      onSocialsClickedMobile(
                          context,
                          "https://twitter.com/_patelpruthvi_",
                          'images/socials/twitter_icon.png'),
                    ]),
                  ),
                ]),
          ),
        ),
      ),
    ]);
  }
}
