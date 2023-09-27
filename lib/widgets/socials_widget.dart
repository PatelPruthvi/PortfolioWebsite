import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

Widget onSocialClicked(
    BuildContext context, String socialUrl, String assetPath) {
  return ElevatedButton(
      style: const ButtonStyle(
          elevation: MaterialStatePropertyAll(0),
          backgroundColor: MaterialStatePropertyAll(Colors.transparent)),
      onPressed: () async {
        await launchUrl(Uri.tryParse(socialUrl)!);
      },
      child: Image.asset(
        assetPath,
        height: MediaQuery.of(context).size.height * 0.05,
        width: MediaQuery.of(context).size.height * 0.05,
        fit: BoxFit.contain,
      ));
}

void navigateToGithub(BuildContext context, String url) async {
  var uri = Uri.parse(url);
  try {
    await launchUrl(uri);
  } on Exception catch (e) {
    print(e.toString());
  }
}

Widget titleText(BuildContext context, String title) {
  return Text(
    title,
    style: TextStyle(
        color: Colors.white,
        fontSize: MediaQuery.of(context).size.width * 0.07,
        letterSpacing: 5,
        fontWeight: FontWeight.w900,
        fontFamily: GoogleFonts.aBeeZee().fontFamily),
  );
}
