// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scroll_to_id/scroll_to_id.dart';

Widget stickyAppBar(BuildContext context, ScrollToId scrollToId) {
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
          appbarItem(context, "Home", "a", scrollToId),
          SizedBox(width: MediaQuery.of(context).size.width * 0.05),
          appbarItem(context, "About", "b", scrollToId),
          SizedBox(width: MediaQuery.of(context).size.width * 0.05),
          appbarItem(context, "Skills", "c", scrollToId),
          SizedBox(width: MediaQuery.of(context).size.width * 0.05),
          appbarItem(context, "Projects", "d", scrollToId),
          SizedBox(width: MediaQuery.of(context).size.width * 0.05),
          appbarItem(context, "Contact", "e", scrollToId),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.1,
          )
        ],
      ));
}

Widget appbarItem(BuildContext context, String text, String navigateId,
    ScrollToId scrollToId) {
  return AnimatedButton.strip(
      animatedOn: AnimatedOn.onHover,
      text: text,
      stripTransitionType: StripTransitionType.BOTTOM_TO_TOP,
      stripSize: 3,
      stripColor: Colors.white,
      textStyle: TextStyle(
          fontSize: MediaQuery.of(context).size.width * 0.015,
          fontFamily: GoogleFonts.aBeeZee().fontFamily,
          color: Colors.white),
      width: MediaQuery.of(context).size.width * 0.1,
      height: MediaQuery.of(context).size.height * 0.05,
      selectedTextColor: Colors.black,
      backgroundColor: Colors.transparent,
      onPress: () {
        scrollToId.animateTo(navigateId,
            duration: const Duration(seconds: 1), curve: Curves.ease);
      });
  // AnimatedButton(
  //     onPressed: () {},
  //     child: Text(
  //       text,
  //       style: TextStyle(
  //           color: Colors.white,
  //           fontSize: MediaQuery.of(context).size.width * 0.015,
  //           fontFamily: GoogleFonts.aBeeZee().fontFamily),
  //     ));
}
