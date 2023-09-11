import 'package:cv/Data/mycv_data.dart';
import 'package:cv/screens/home/homescreen.dart';
import 'package:cv/screens/home/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class EditPage extends StatefulWidget {
  final MyData myData;

  const EditPage({super.key, required this.myData});

  @override
  EditPageState createState() => EditPageState();
}

class EditPageState extends State<EditPage> {
  var fullNameController = TextEditingController();
  var slackUsernameController = TextEditingController();
  var githubHandleController = TextEditingController();
  var educationController = TextEditingController();
  var experienceController = TextEditingController();
  var skillsController = TextEditingController();
  var projectsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fullNameController.text = widget.myData.fullName;
    slackUsernameController.text = widget.myData.slackUsername;
    githubHandleController.text = widget.myData.githubHandle;
    educationController.text = widget.myData.education;
    experienceController.text = widget.myData.experience;
    skillsController.text = widget.myData.skills;
    projectsController.text = widget.myData.projects;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.myData.fullName),
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: fullNameController,
                decoration: const InputDecoration(labelText: "Full Name"),
              ),
              TextField(
                controller: slackUsernameController,
                decoration: const InputDecoration(labelText: "Slack Username"),
              ),
              TextField(
                controller: githubHandleController,
                decoration: const InputDecoration(labelText: "GitHub Handle"),
              ),
              TextField(
                controller: educationController,
                decoration: const InputDecoration(labelText: "Education"),
              ),
              TextField(
                controller: skillsController,
                minLines: 1,
                maxLines: 7,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(labelText: "Skills"),
              ),
              TextField(
                controller: experienceController,
                minLines: 1,
                maxLines: 7,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(labelText: "experience"),
              ),
              TextField(
                controller: projectsController,
                minLines: 1,
                maxLines: 7,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(labelText: "Project 1"),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                name: "Update CV",
                onTap: () {
                  final updatedData = MyData();
                  updatedData.fullName = fullNameController.text;
                  updatedData.slackUsername = slackUsernameController.text;
                  updatedData.githubHandle = githubHandleController.text;
                  updatedData.education = educationController.text;
                  updatedData.skills = skillsController.text;
                  updatedData.experience = experienceController.text;
                  updatedData.projects = projectsController.text;

                  Navigator.pop(context, updatedData);
                },
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     final updatedData = MyData();
              //     updatedData.fullName = fullNameController.text;
              //     updatedData.slackUsername = slackUsernameController.text;
              //     updatedData.githubHandle = githubHandleController.text;
              //     updatedData.education = educationController.text;
              //     updatedData.skills = skillsController.text;
              //     updatedData.experience = experienceController.text;
              //     updatedData.projects = projectsController.text;

              //     Navigator.pop(context, updatedData);
              //   },
              //   child: const Text("Save"),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
