import 'package:app_design/src/presentation/controller/notes_controller.dart';
import 'package:app_design/src/presentation/screens/notes/widgets/custom_listtile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Notes extends StatelessWidget {
  final NotesController notesController = Get.put(NotesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Notes',
          style: GoogleFonts.raleway(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false, // Hide the back button
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ListView.builder(
          itemCount: notesController.notesList.length,
          itemBuilder: (context, index) {
            final note = notesController.notesList[index];
            return CustomListTile(
              pdfImagePath:
                  note['image']!, // Extract the image path from the map
              topicName:
                  note['topicName']!, // Extract the topic name from the map
            );
          },
        ),
      ),
    );
  }
}
