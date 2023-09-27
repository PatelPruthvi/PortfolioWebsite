// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget stickyAppBar(BuildContext context) {
  return Container(
      color: Colors.black,
      height: MediaQuery.of(context).size.height * 0.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
              child: Text(
            "   Pruthvi",
            style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width * 0.02,
                fontFamily: GoogleFonts.aBeeZee().fontFamily),
          )),
          appbarItem(context, "Home"),
          appbarItem(context, "About"),
          appbarItem(context, "Skills"),
          appbarItem(context, "Projects"),
          appbarItem(context, "Contact"),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.05,
          )
        ],
      ));
}

Widget appbarItem(BuildContext context, String text) {
  bool entered = false;
  return MouseRegion(
    onEnter: (event) {
      entered = true;
    },
    onExit: (event) {
      entered = false;
    },
    child: AnimatedButton(
        onPressed: () {},
        shadowDegree: ShadowDegree.light,
        height: MediaQuery.of(context).size.height * 0.08,
        width: MediaQuery.of(context).size.width * 0.07,
        color: Colors.transparent,
        child: Text(
          text,
          style: TextStyle(
              color: entered == true ? Colors.blue.shade600 : Colors.white,
              fontSize: MediaQuery.of(context).size.width * 0.015,
              fontFamily: GoogleFonts.aBeeZee().fontFamily),
        )),
  );
}
