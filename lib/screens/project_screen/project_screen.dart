import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider_try_2_animation/data/reference_data.dart';
import 'package:provider_try_2_animation/widgets/responsive_layout.dart';
import 'package:provider_try_2_animation/widgets/socials_widget.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  @override
  Widget build(BuildContext context) {
    final aboutTextStyle = TextStyle(
        color: Colors.white,
        fontSize: MediaQuery.of(context).size.height * 0.03,
        fontFamily: GoogleFonts.aBeeZee().fontFamily);
    final mobileFontsStyle = TextStyle(
        color: Colors.white,
        fontSize: MediaQuery.of(context).size.width * 0.03,
        fontFamily: GoogleFonts.aBeeZee().fontFamily);
    return SingleChildScrollView(
      child: Container(
        color: Colors.black,
        child: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.16,
          ),
          Center(child: titleText(context, "PROJECTS")),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
          ),
          Column(children: [
            for (int index = 0; index < projectDesc.length; index++)
              Responsivelayout(
                mobileBody: ProjectTileMobile(
                    index: index, aboutTextStyle: mobileFontsStyle),
                desktopBody: ProjectListTile(
                    index: index, aboutTextStyle: aboutTextStyle),
              )
          ]),
        ]),
      ),
    );
  }
}

class ProjectTileMobile extends StatelessWidget {
  final int index;
  final TextStyle aboutTextStyle;
  const ProjectTileMobile(
      {super.key, required this.index, required this.aboutTextStyle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 60),
      child: AspectRatio(
        aspectRatio: 0.4 * 16 / 9,
        child: Container(
            // height: MediaQuery.of(context).size.height * 0.8,
            decoration: BoxDecoration(
                color: Colors.grey.shade800,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.shade200, width: 2)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Expanded(
                  child: Row(
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                      for (int idx = 0;
                          idx < projectImagesPath[index].length;
                          idx++)
                        Expanded(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.35,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        projectImagesPath[index][idx]),
                                    fit: BoxFit.contain)),
                          ),
                        ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                const Divider(
                  thickness: 2,
                  color: Colors.white,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              projectTitles[index],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.04,
                                  fontFamily: GoogleFonts.aBeeZee().fontFamily),
                            ),
                            const Text(""),
                            Text(
                              projectTech[index],
                              style: aboutTextStyle,
                            ),
                            const Text(""),
                            Text(
                              projectDesc[index],
                              textAlign: TextAlign.center,
                              style: aboutTextStyle,
                            ),
                          ],
                        ),
                        projectLinks[index] != ''
                            ? TextButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        Colors.blue.shade600)),
                                onPressed: () {
                                  navigateToGithub(
                                      context, projectLinks[index]);
                                },
                                child: Text(
                                  "Source Code",
                                  style: aboutTextStyle,
                                ))
                            : TextButton(
                                onPressed: () {
                                  navigateToGithub(context, taskPlannerLink);
                                },
                                child:
                                    Text("Google Play", style: aboutTextStyle))
                      ]),
                ),
              ],
            )),
      ),
    );
  }
}

class ProjectListTile extends StatelessWidget {
  const ProjectListTile({
    super.key,
    required this.index,
    required this.aboutTextStyle,
  });

  final int index;
  final TextStyle aboutTextStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey.shade200, width: 2)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(width: MediaQuery.of(context).size.width * 0.01),
              Expanded(
                child: Row(
                  children: [
                    for (int idx = 0;
                        idx < projectImagesPath[index].length;
                        idx++)
                      Expanded(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.35,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage(projectImagesPath[index][idx]),
                                  fit: BoxFit.contain)),
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.01),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: VerticalDivider(
                  thickness: 2,
                  color: Colors.grey.shade200,
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.01),
              Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            projectTitles[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.04,
                                fontFamily: GoogleFonts.aBeeZee().fontFamily),
                          ),
                          const Text(""),
                          Text(
                            projectTech[index],
                            style: aboutTextStyle,
                          ),
                          const Text(""),
                          Text(
                            projectDesc[index],
                            textAlign: TextAlign.center,
                            style: aboutTextStyle,
                          ),
                        ],
                      ),
                      projectLinks[index] != ''
                          ? TextButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Colors.blue.shade600)),
                              onPressed: () {
                                navigateToGithub(context, projectLinks[index]);
                              },
                              child: Text(
                                "Source Code",
                                style: aboutTextStyle,
                              ))
                          : TextButton(
                              style: const ButtonStyle(
                                side: WidgetStatePropertyAll(
                                    BorderSide(width: 2, color: Colors.white)),
                              ),
                              onPressed: () {
                                navigateToGithub(context, taskPlannerLink);
                              },
                              child: Text("Google Play", style: aboutTextStyle))
                    ]),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.01)
            ],
          )),
    );
  }
}
