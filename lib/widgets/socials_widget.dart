import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

const String serviceIdForContactMe = 'service_cjp6w3d';
const String templateIdForContactMe = 'template_k5cuubd';
const String publicKeyForContact = 'FreNCnKw2jdF8hImx';
const String pvtKeyForContact = 'W8GJ73a-y9gzeSGPS4W83';
const String mailAddress = 'pruthvikp8613@gmail.com';
const String resumePortfolioLink = 'https://patelpruthvi.github.io';
const String resumeLink =
    'https://drive.google.com/file/d/1OYp5kOfOVByx1NUHg-GUWnIIDraPVCRt/view?usp=sharing';
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

TextFormField textFieldModel(String hintText, TextEditingController controller,
    int maxLines, String fieldName) {
  return TextFormField(
    validator: (value) {
      if (value == null || value.isEmpty) {
        return "$fieldName can not be empy";
      } else if (fieldName == "E-Mail" &&
          (!value.contains("@") || !value.contains("."))) {
        return "Invalid format for E-Mail";
      }
    },
    controller: controller,
    maxLines: maxLines,
    style: TextStyle(
        color: Colors.white, fontFamily: GoogleFonts.aBeeZee().fontFamily),
    decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
            color: Colors.white, fontFamily: GoogleFonts.aBeeZee().fontFamily),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade200)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade200)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade200))),
  );
}
