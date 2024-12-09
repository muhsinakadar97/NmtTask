import 'package:app_design/src/data/models/chapter.dart';
import 'package:app_design/src/presentation/controller/course_overview_controller.dart';
import 'package:app_design/src/presentation/controller/view_video_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class VideoList extends StatelessWidget {
  const VideoList({super.key});

  @override
  Widget build(BuildContext context) {
    ViewVideoController viewVideoCtr = Get.find<ViewVideoController>();
    CourseOverviewController courseOverviewController =
        Get.find<CourseOverviewController>();
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.only(
            bottom: viewVideoCtr.listItemHeight * viewVideoCtr.chapters.length),
        controller: courseOverviewController.scrollController,
        itemCount: viewVideoCtr.chapters.length,
        itemBuilder: (context, index) {
          Chapter chapter = viewVideoCtr.chapters[index];
          return GestureDetector(
            onTap: () {
              viewVideoCtr.updateKey();
              viewVideoCtr.onItemTapped(context, index);
            },
            child: Obx(() => Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  height: 70.0,
                  decoration: BoxDecoration(
                    color: viewVideoCtr.currentChapterName.value ==
                            chapter.chapterName
                        ? Colors.purple[50]
                        : Colors.blueGrey[50],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Chapter ${chapter.chapterNo}  :  ",
                              style: GoogleFonts.raleway(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: courseOverviewController
                                              .colorChapterName.value ==
                                          chapter.chapterName
                                      ? Colors.black
                                      : Colors.blueGrey[900]),
                            ),
                            Text(
                              chapter.chapterName,
                              style: GoogleFonts.raleway(
                                  fontSize: 16,
                                  color: courseOverviewController
                                              .colorChapterName.value ==
                                          chapter.chapterName
                                      ? Colors.black
                                      : Colors.blueGrey[900]),
                            ),
                          ],
                        ),
                        Text(
                          chapter.category,
                          style: GoogleFonts.raleway(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: chapter.category == "Locked"
                                ? Colors.red
                                : (chapter.category == "Premium"
                                    ? Colors.orange
                                    : Colors.green),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          );
        },
      ),
    );
  }
}
