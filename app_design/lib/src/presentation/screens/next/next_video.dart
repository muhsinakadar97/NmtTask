import 'package:app_design/src/data/models/chapter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_design/src/presentation/controller/course_overview_controller.dart';
import 'package:app_design/src/presentation/controller/next_video_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class NextVideo extends StatelessWidget {
  const NextVideo({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the controllers
    final CourseOverviewController courseOverviewController =
        Get.put(CourseOverviewController());
    final NextVideoController nextVideoController =
        Get.put(NextVideoController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          courseOverviewController.selectedSectionName.value,
          style: GoogleFonts.raleway(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount:
                  courseOverviewController.selectedSectionChapterList.length,
              itemBuilder: (context, index) {
                Chapter chapter =
                    courseOverviewController.selectedSectionChapterList[index];

                return GestureDetector(
                  onTap: () {
                    // Handle chapter selection
                    nextVideoController.selectedChapterIndex.value = index;
                    courseOverviewController.selectedChapterName.value =
                        chapter.chapterName; // Access using dot notation
                    nextVideoController.onItemTapped(
                        index, nextVideoController.chapters);
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: nextVideoController.selectedChapterIndex.value == index? Colors.blueGrey[100] : Colors.blueGrey[50],
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
                  ),
                  // child: Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  //   child: Container(
                  //     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  //     decoration: BoxDecoration(
                  //       color: Colors.blueGrey[50],
                  //       borderRadius: BorderRadius.circular(8),
                  //     ),
                  //     child: Row(
                  //       children: [
                  //         Text(
                  //           "Chapter ${chapter.chapterNo} : ", // Access chapterNo with dot notation
                  //           style: TextStyle(
                  //             fontWeight: FontWeight.bold,
                  //             fontSize: 16,
                  //             color: Colors.black,
                  //           ),
                  //         ),
                  //         Text(
                  //           chapter.chapterName, // Access chapterName with dot notation
                  //           style: TextStyle(
                  //             fontSize: 16,
                  //             color: Colors.black,
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
