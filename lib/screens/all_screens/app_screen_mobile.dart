import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider_try_2_animation/screens/about_screen/about_screen_mobile.dart';
import 'package:provider_try_2_animation/screens/contact_screen/contact_screen_mobile.dart';
import 'package:provider_try_2_animation/screens/home_screen/home_screen_mobile.dart';
import 'package:provider_try_2_animation/screens/project_screen/project_screen.dart';
import 'package:provider_try_2_animation/screens/skills_screen/skills_screen.dart';
import 'package:scroll_to_id/scroll_to_id.dart';

class HomeScreenMobile extends StatefulWidget {
  const HomeScreenMobile({super.key});

  @override
  State<HomeScreenMobile> createState() => _HomeScreenMobileState();
}

class _HomeScreenMobileState extends State<HomeScreenMobile> {
  ScrollToId? scrollToId;
  final scrollController = ScrollController();
  @override
  void initState() {
    scrollToId = ScrollToId(scrollController: scrollController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final drawerItemTextStyle = TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: MediaQuery.of(context).size.width * 0.05,
        fontFamily: GoogleFonts.aBeeZee().fontFamily);
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  scrollToId?.animateTo('a',
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeIn);
                },
                child: Text("Home", style: drawerItemTextStyle)),
            const Divider(color: Colors.white),
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  scrollToId?.animateTo('b',
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeIn);
                },
                child: Text("About", style: drawerItemTextStyle)),
            const Divider(color: Colors.white),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                scrollToId?.animateTo('c',
                    duration: const Duration(seconds: 1), curve: Curves.easeIn);
              },
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "S",
                      style: drawerItemTextStyle.copyWith(
                          color: Colors.blue.shade600)),
                  TextSpan(text: "kills", style: drawerItemTextStyle)
                ]),
              ),
            ),
            const Divider(color: Colors.white),
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  scrollToId?.animateTo('d',
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeIn);
                },
                child: Text("Projects", style: drawerItemTextStyle)),
            const Divider(color: Colors.white),
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  scrollToId?.animateTo('e',
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeIn);
                },
                child: Text("Contact", style: drawerItemTextStyle)),
            const Divider(color: Colors.white),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: false,
        title: GestureDetector(
          onTap: () {
            scrollToId?.animateTo('a',
                duration: const Duration(seconds: 1), curve: Curves.easeIn);
          },
          child: Text(
            "   Pruthvi",
            style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width * 0.04,
                fontFamily: GoogleFonts.aBeeZee().fontFamily),
          ),
        ),
      ),
      body: InteractiveScrollViewer(
        scrollToId: scrollToId,
        scrollDirection: Axis.vertical,
        children: [
          ScrollContent(id: 'a', child: const HomePageMobile()),
          ScrollContent(id: 'b', child: const AboutScreenMobile()),
          ScrollContent(id: 'c', child: const SkillsPage()),
          ScrollContent(id: 'd', child: const ProjectsPage()),
          ScrollContent(id: 'e', child: const ContactScreenMobile()),
        ],
      ),
    );
  }
}
