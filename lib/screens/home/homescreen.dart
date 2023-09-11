// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cv/screens/home/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import 'package:cv/Data/mycv_data.dart';
import 'package:cv/extensions/gap_extention.dart';
import 'package:cv/screens/edit/editpage.dart';
import 'package:cv/screens/home/widgets/custom_main_text.dart';

class HomePage extends StatefulWidget {
  final MyData myData;

  const HomePage({super.key, required this.myData});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text("My Personal CV"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  alignment: Alignment.centerRight,
                  image: AssetImage("images/PANO.jpg"),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      CustomMainText(
                        text: widget.myData.fullName,
                        size: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "images/slack.png",
                            height: 20,
                            width: 20,
                          ),
                          CustomMainText(
                            text: "  ${widget.myData.slackUsername}",
                            fontWeight: FontWeight.bold,
                            size: 16,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "images/github.png",
                            height: 20,
                            width: 20,
                          ),
                          CustomMainText(
                            text: '  ${widget.myData.githubHandle}',
                            fontWeight: FontWeight.bold,
                            size: 16,
                          ),
                        ],
                      ),
                      const CustomMainText(
                        text: 'Education:',
                        fontWeight: FontWeight.bold,
                        size: 16,
                      ),
                      CustomMainText(text: widget.myData.education),
                      const CustomMainText(
                        text: 'Skills',
                        fontWeight: FontWeight.bold,
                        size: 16,
                      ),
                      CustomMainText(text: widget.myData.skills),
                      const CustomMainText(
                        text: 'Experience',
                        fontWeight: FontWeight.bold,
                        size: 16,
                      ),
                      CustomMainText(text: widget.myData.experience),
                      const CustomMainText(
                        text: 'Projects',
                        fontWeight: FontWeight.bold,
                        size: 16,
                      ),
                      CustomMainText(text: widget.myData.projects),
                    ].separate(10),
                  ),
                  const Spacer(),
                  Center(
                    child: Expanded(
                      child: CustomButton(
                        name: "Edit CV",
                        onTap: () async {
                          final updatedCVData = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  EditPage(myData: widget.myData),
                            ),
                          );
                          if (updatedCVData != null) {
                            setState(() {
                              widget.myData.fullName = updatedCVData.fullName;
                              widget.myData.slackUsername =
                                  updatedCVData.slackUsername;
                              widget.myData.githubHandle =
                                  updatedCVData.githubHandle;
                              widget.myData.education = updatedCVData.education;

                              widget.myData.skills = updatedCVData.skills;
                              widget.myData.experience =
                                  updatedCVData.experience;
                              widget.myData.projects = updatedCVData.projects;
                            });
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
