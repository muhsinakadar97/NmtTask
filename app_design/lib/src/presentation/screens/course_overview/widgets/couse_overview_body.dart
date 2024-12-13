import 'package:app_design/src/presentation/controller/course_overview_controller.dart';
import 'package:app_design/src/presentation/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'chapter_list.dart';

class CouseOverviewBody extends StatelessWidget {
  const CouseOverviewBody({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find<HomeController>();
    CourseOverviewController courseOverviewController =
        Get.find<CourseOverviewController>();
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Image.asset(homeController.selectedImage.value),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(20.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  // Course title text
                  Text(
                    homeController.selectedItemName.value,
                    style: GoogleFonts.raleway(
                      color: Colors.blueGrey[900],
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (courseOverviewController.sections.isEmpty)
            SliverToBoxAdapter(
              child: Center(
                child: Text(
                  "No Sections Found",
                  style: GoogleFonts.raleway(
                      color: Colors.red, fontWeight: FontWeight.w600),
                ),
              ),
            )
          else
            const ChapterList()
        ],
      ),
    );
  }
}
