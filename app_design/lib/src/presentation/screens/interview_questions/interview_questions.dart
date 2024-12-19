import 'package:app_design/src/presentation/controller/interview_questions_controller.dart';
import 'package:app_design/src/presentation/screens/interview_questions/widgets/question_widget.dart';
import 'package:app_design/src/presentation/screens/widgets/network_aware.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class InterviewQuestions extends StatelessWidget {
  const InterviewQuestions({super.key});

  @override
  Widget build(BuildContext context) {
    InterviewQUestionsController interviewQUestionsController =
        Get.put(InterviewQUestionsController());

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Interview Questions',
            style: GoogleFonts.raleway(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false, // Hide the back button
        ),
        body: const NetworkAware(child: QuestionWidget()));
  }
}
