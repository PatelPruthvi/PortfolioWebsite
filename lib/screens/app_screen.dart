import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider_try_2_animation/screens/about_screen.dart';
import 'package:provider_try_2_animation/screens/contact_screen.dart';
import 'package:provider_try_2_animation/screens/home_screen_widget.dart';
import 'package:provider_try_2_animation/screens/project_screen.dart';
import 'package:provider_try_2_animation/screens/skills_screen.dart';
import 'package:provider_try_2_animation/widgets/appbar_widget.dart';
import 'package:scroll_to_id/scroll_to_id.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    ScrollToId scrollToId = ScrollToId(scrollController: scrollController);
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: InteractiveScrollViewer(
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
            ),
            Container(
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
                )),
          ],
        ));
  }
}
 // final ctrl = AutoScrollController(
    //     viewportBoundaryGetter: () =>
    //         Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
    //     axis: Axis.vertical,
    //     suggestedRowHeight: double.maxFinite);
// SingleChildScrollView(
            //   controller: ctrl,
            //   scrollDirection: Axis.vertical,
            //   child: Column(
            //     children: [
            //       AutoScrollTag(
            //           key: ValueKey(0),
            //           controller: ctrl,
            //           index: 0,
            //           child: HomePage()),
            //       AutoScrollTag(
            //           key: ValueKey(1),
            //           controller: ctrl,
            //           index: 1,
            //           child: AboutPage()),
            //       AutoScrollTag(
            //           key: ValueKey(2),
            //           controller: ctrl,
            //           index: 2,
            //           child: SkillsPage()),
            //       AutoScrollTag(
            //           key: ValueKey(3),
            //           controller: ctrl,
            //           index: 3,
            //           child: ProjectsPage()),
            //       AutoScrollTag(
            //           key: ValueKey(4),
            //           controller: ctrl,
            //           index: 4,
            //           child: ContactPage()),
            //     ],
            //   ),
            // ),
           // stickyAppBar(context, scrollToId)