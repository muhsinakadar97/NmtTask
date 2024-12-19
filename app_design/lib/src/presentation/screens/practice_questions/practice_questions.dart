import 'package:app_design/src/presentation/controller/practice_questions_controller.dart';
import 'package:app_design/src/presentation/screens/notes/widgets/custom_listtile.dart';
import 'package:app_design/src/presentation/screens/widgets/network_aware.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PracticeQuestions extends StatelessWidget {
  final PracticeQuestionsController notesController = Get.put(PracticeQuestionsController());

   PracticeQuestions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(
          'Practice Questions',
          style: GoogleFonts.raleway(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false, // Hide the back button
      ),
      body: NetworkAware(
        child: ListView.builder(
          itemCount: notesController.notesList.length,
          itemBuilder: (context, index) {
            final note = notesController.notesList[index];
            return CustomListTile(
              pdfImagePath: note['image']!, // Extract the image path from the map
              topicName: note['topicName']!,
              
            );
          },
        ),
      ),
    );
  }
}