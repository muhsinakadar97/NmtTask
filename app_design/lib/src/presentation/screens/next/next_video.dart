import 'package:app_design/src/data/models/chapter.dart';
import 'package:app_design/src/presentation/controller/course_overview_controller.dart';
import 'package:app_design/src/presentation/controller/next_video_controller.dart';
import 'package:app_design/src/presentation/screens/video/video.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NextVideo extends StatelessWidget {
  const NextVideo({super.key});

  @override
  Widget build(BuildContext context) {
    final NextVideoController nextVideoController = Get.put(NextVideoController());
    final CourseOverviewController courseOverviewController = Get.find<CourseOverviewController>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Obx(() => Text(
              courseOverviewController.selectedSectionName.value,
              style: const TextStyle(fontWeight: FontWeight.bold),
            )),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: Obx(() {
        if (nextVideoController.isVideoPlaying.value) {
          // If a video is selected, show the video player
          return Video(videoIdForLoading: nextVideoController.selectedVideoId.value);
        } else {
          // If no video is playing, show the chapter list
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: nextVideoController.scrollController, // Attach ScrollController
                  padding: const EdgeInsets.only(bottom: 350),
                  itemCount: nextVideoController.chapters.length,
                  itemBuilder: (context, index) {
                    Chapter chapter = nextVideoController.chapters[index];

                    return Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                      child: GestureDetector(
                        onTap: () {
                          nextVideoController.onItemTapped(context, index);
                        },
                        child: Obx(() => Container(
                              height: 60,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: courseOverviewController.selectedChapterName.value == chapter.chapterName
                                    ? Colors.blueGrey[200]
                                    : Colors.blueGrey[50],
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
                                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          chapter.chapterName,
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      chapter.category,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: chapter.category == "Locked"
                                            ? Colors.red
                                            : (chapter.category == "Premium" ? Colors.orange : Colors.green),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }
      }),
    );
  }
}
