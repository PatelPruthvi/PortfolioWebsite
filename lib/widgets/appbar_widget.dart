// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
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
          appbarItem(context, "About", "b", scrollToId),
          appbarItem(context, "Skills", "c", scrollToId),
          appbarItem(context, "Projects", "d", scrollToId),
          appbarItem(context, "Contact", "e", scrollToId),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.05,
          )
        ],
      ));
}

Widget appbarItem(BuildContext context, String text, String navigateId,
    ScrollToId scrollToId) {
  return TextButton(
      onPressed: () {
        scrollToId.animateTo(navigateId,
            duration: Duration(seconds: 1), curve: Curves.linear);
      },
      child: Text(
        text,
        style: TextStyle(
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.width * 0.015,
            fontFamily: GoogleFonts.aBeeZee().fontFamily),
      ));
}
