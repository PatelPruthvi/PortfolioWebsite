import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider_try_2_animation/data/reference_data.dart';
import 'package:provider_try_2_animation/widgets/socials_widget.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  bool hovered = false;
  @override
  Widget build(BuildContext context) {
    final aboutTextStyle = TextStyle(
        color: Colors.white,
        fontSize: MediaQuery.of(context).size.height * 0.03,
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
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade800,
                        borderRadius: BorderRadius.circular(20),
                        border:
                            Border.all(color: Colors.grey.shade200, width: 2)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.01),
                        Expanded(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.35,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(projectImagesPath[index]),
                                    fit: BoxFit.contain)),
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.01),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.4,
                          child: VerticalDivider(
                            thickness: 2,
                            color: Colors.grey.shade200,
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.01),
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
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.04,
                                          fontFamily:
                                              GoogleFonts.aBeeZee().fontFamily),
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
                                TextButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.blue.shade600)),
                                    onPressed: () {
                                      navigateToGithub(
                                          context, projectLinks[index]);
                                    },
                                    child: Text(
                                      "Source Code",
                                      style: aboutTextStyle,
                                    ))
                              ]),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.01)
                      ],
                    )),
              )
          ]),
        ]),
      ),
    );
  }
}
