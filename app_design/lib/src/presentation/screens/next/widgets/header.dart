import 'package:app_design/src/presentation/controller/view_video_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NextVideoHeader extends StatelessWidget {
  const NextVideoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    ViewVideoController viewVideoCtr = Get.find<ViewVideoController>();
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 20),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          viewVideoCtr.currentSectionName.value,
          style: GoogleFonts.raleway(fontWeight: FontWeight.bold, fontSize: 22),
        ),
      ),
    );
  }
}
