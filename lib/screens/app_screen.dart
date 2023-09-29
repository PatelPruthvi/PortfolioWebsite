import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider_try_2_animation/screens/about_screen.dart';
import 'package:provider_try_2_animation/screens/contact_screen.dart';
import 'package:provider_try_2_animation/screens/home_screen_widget.dart';
import 'package:provider_try_2_animation/screens/project_screen.dart';
import 'package:provider_try_2_animation/screens/skills_screen.dart';
import 'package:provider_try_2_animation/widgets/appbar_widget.dart';
import 'package:scroll_to_id/scroll_to_id.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollToId? scrollToId;
  final scrollController = ScrollController();

  @override
  void initState() {
    scrollToId = ScrollToId(scrollController: scrollController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            InteractiveScrollViewer(
              scrollToId: scrollToId,
              scrollDirection: Axis.vertical,
              children: [
                ScrollContent(id: 'a', child: const HomePage()),
                ScrollContent(id: 'b', child: const AboutPage()),
                ScrollContent(id: 'c', child: const SkillsPage()),
                ScrollContent(id: 'd', child: const ProjectsPage()),
                ScrollContent(id: 'e', child: const ContactPage()),
              ],
            ),
            Container(
                color: Colors.black,
                height: MediaQuery.of(context).size.height * 0.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Text(
                          "   Pruthvi",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.02,
                              fontFamily: GoogleFonts.aBeeZee().fontFamily),
                        )),
                    appbarItem(context, "Home", "a", scrollToId!),
                    // SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                    appbarItem(context, "About", "b", scrollToId!),
                    // SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                    appbarItem(context, "Skills", "c", scrollToId!),
                    // SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                    // appbarItem(context, "Projects", "d", scrollToId!),
                    // SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                    appbarItem(context, "Contact", "e", scrollToId!),
                    // SizedBox(
                    // width: MediaQuery.of(context).size.width * 0.05,
                    // )
                  ],
                )),
          ],
        ));
  }
}
