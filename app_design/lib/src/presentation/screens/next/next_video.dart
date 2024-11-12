import 'dart:developer';
import 'package:app_design/src/data/models/chapter.dart';
import 'package:app_design/src/presentation/controller/video_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_design/src/presentation/controller/course_overview_controller.dart';
import 'package:app_design/src/presentation/controller/next_video_controller.dart';

class NextVideo extends StatelessWidget {
  const NextVideo({super.key});

  @override
  Widget build(BuildContext context) {
    // Get controllers at the beginning of the widget tree
    final CourseOverviewController courseOverviewController = Get.put(CourseOverviewController());
    final NextVideoController nextVideoController = Get.put(NextVideoController());
    VideoController videoController = Get.put(VideoController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Obx(() => Text(
          courseOverviewController.selectedSectionName.value,
          style: GoogleFonts.raleway(fontWeight: FontWeight.bold),
        )),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return ListView.builder(
                controller: nextVideoController.scrollController,
                itemCount: courseOverviewController.selectedSectionChapterList.length,
                itemBuilder: (context, index) {
                  Chapter chapter = courseOverviewController.selectedSectionChapterList[index];

                  return Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    child: GestureDetector(
                      onTap: () {
                        nextVideoController.selectedChapterIndex.value = index;
                      nextVideoController.onItemTapped(index, nextVideoController.chapters);
                      log("Selected index => ${nextVideoController.selectedChapterIndex.value}");
                      
                      videoController.loadVideo(chapter.videoId);
                      },
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: nextVideoController.selectedChapterIndex.value == index
                              ? Colors.blueGrey[200]  // Color for selected tile
                              : Colors.blueGrey[50], // Color for unselected tile
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Chapter ${chapter.chapterNo} : ",
                                    style: GoogleFonts.raleway(fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    chapter.chapterName,
                                    style: GoogleFonts.raleway(fontSize: 16),
                                  ),
                                ],
                              ),
                              Text(
                                chapter.category,
                                style: GoogleFonts.raleway(
                                  fontSize: 14,
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
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
