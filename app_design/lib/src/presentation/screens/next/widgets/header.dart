import 'package:app_design/src/presentation/controller/course_overview_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NextVideoHeader extends StatelessWidget {
  const NextVideoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    CourseOverviewController courseOverviewController =
        Get.find<CourseOverviewController>();
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 20),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          courseOverviewController.selectedSection.sectionName,
          style: GoogleFonts.raleway(fontWeight: FontWeight.bold, fontSize: 22),
        ),
      ),
    );
  }
}
