import 'dart:developer';

import 'package:app_design/src/data/models/chapter.dart';
import 'package:app_design/src/presentation/controller/course_overview_controller.dart';
import 'package:app_design/src/presentation/controller/next_video_controller.dart';
import 'package:app_design/src/presentation/controller/video_controller.dart';
import 'package:app_design/src/presentation/screens/video/video.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NextVideo extends StatelessWidget {
  const NextVideo({super.key});

  @override
  Widget build(BuildContext context) {
    final CourseOverviewController courseOverviewController =
        Get.put(CourseOverviewController());
    final NextVideoController nextVideoController =
        Get.put(NextVideoController());
    final VideoController videoController = Get.put(VideoController());

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
          SizedBox(
            height: 400,
            child: ListView.builder(
                        controller: nextVideoController.scrollController,
                        itemCount:
              courseOverviewController.selectedSectionChapterList.length,
                        itemBuilder: (context, index) {
            Chapter chapter =
                courseOverviewController.selectedSectionChapterList[index];
            
            return Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: GestureDetector(
                  onTap: () {
                    nextVideoController.selectedChapter = chapter;
                    log("nextVideoController.selectedChapter => ${nextVideoController.selectedChapter}");
                    log("courseOverviewController.selectedChapterName.value => ${courseOverviewController.selectedChapterName.value}");
                    log("chapter.chapterName => ${chapter.chapterName}");
                    courseOverviewController.selectedChapterName.value = chapter.chapterName;
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return Video(
                        videoId: nextVideoController.selectedChapter.videoId,
                      );
                    }));
                    // Get.offAll(Video(videoId: nextVideoController.selectedChapter.videoId));
                    // nextVideoController.onItemTapped(nextVideoController.selectedChapter.videoId);
                    // nextVideoController.selectedChapterName.value =
                    //     chapter.chapterName;
                    // log("Selected chapter => ${chapter.chapterName}");
                    // log("nextVideoController.selectedChapterName.value => ${nextVideoController.selectedChapterName.value}");
                    // videoController.loadVideo(chapter.videoId);
                  },
                  child: Obx(
                    () => Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: courseOverviewController.selectedChapterName.value ==
                                chapter.chapterName
                            ? Colors.blueGrey[200] // Color for selected tile
                            : Colors
                                .blueGrey[50], // Color for unselected tile
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20,),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Chapter ${chapter.chapterNo} : ",
                                  style: GoogleFonts.raleway(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
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
                  )),
            );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}
