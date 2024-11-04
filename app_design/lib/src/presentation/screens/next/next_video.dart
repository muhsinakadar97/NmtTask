import 'dart:developer';

import 'package:app_design/src/presentation/controller/next_video_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/course_overview_controller.dart';

class NextVideo extends StatelessWidget {
  const NextVideo({super.key});

  @override
  Widget build(BuildContext context) {
    final CourseOverviewController courseOverviewController =
        Get.put(CourseOverviewController());
    final NextVideoController nextVideoController =
        Get.put(NextVideoController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          courseOverviewController.selectedSectionName.value,
          style: GoogleFonts.raleway(fontWeight: FontWeight.bold),
        ),
        actions: [
          Row(
            children: [
              TextButton(
                onPressed: () {
                  log("Returns to full playlist");
                  Get.back();
                },
                child: Container(
                  height: 20,
                  width: 105,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[50],
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Center(
                    child: Text(
                      "View full playlist",
                      style: GoogleFonts.raleway(
                          color: Colors.green[800], fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              )
            ],
          )
        ],
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(bottom: 270),
              controller: nextVideoController.scrollController,
              itemCount:
                  courseOverviewController.selectedSectionChapterList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  child: GestureDetector(
                    onTap: () {
                      // log("${courseOverviewController.selectedSectionChapterList[index]['chapterName']} clicked");
                      nextVideoController.selectedChapterIndex.value = index;
                      courseOverviewController.selectedChapterName.value =
                          courseOverviewController
                                  .selectedSectionChapterList[index]
                              ['chapterName'];
                      nextVideoController.onItemTapped(index);
                    },
                    child: Obx(() {
                      bool isSelected =
                          nextVideoController.selectedChapterIndex.value ==
                              index;
                      return Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Colors.blueGrey[100]
                              : Colors.blueGrey[50],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 20),
                            Text(
                              "Chapter ${index + 1}  :",
                              style: GoogleFonts.raleway(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 20),
                            Text(
                              courseOverviewController
                                      .selectedSectionChapterList[index]
                                  ['chapterName'],
                              style: GoogleFonts.raleway(fontSize: 15),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:app_design/src/presentation/controller/next_video_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';

// class NextVideo extends StatelessWidget {
//   const NextVideo({super.key});

//   @override
//   Widget build(BuildContext context) {
//     NextVideoController nextVideoController = Get.put(NextVideoController());
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: const Text("Next"),
//       // ),
      // body: Column(
      //   children: [
      //     SizedBox(height: 10,),
      //     Align(
      //       alignment: Alignment.topLeft,
      //       child: Row(
      //         children: [
      //           SizedBox(width: 20,),
      //           Text("Module Name"),
      //         ],
      //       )),
      //     SizedBox(height: 10,),
      //     Expanded(
      //       child: ListView.builder(
      //         padding: EdgeInsets.only(bottom: 450),
      //         shrinkWrap: true,
      //         controller: nextVideoController.scrollController,
      //         itemCount: nextVideoController.chapters.length,
      //         itemBuilder: (context, index) {
      //           return Obx(() => ListTile(
      //                 // tileColor: nextVideoController.selectedIndex.value == index
      //                 //     ? Colors.blueGrey[200]
      //                 //     : Colors.blueGrey[50],
      //                 title: Padding(
      //                   padding: const EdgeInsets.only(top: 0, left: 10),
      //                   child: Container(
      //                     height: 60,
      //                     width: MediaQuery.of(context).size.width,
      //                     decoration: BoxDecoration(
      //                       color: nextVideoController.selectedIndex.value == index? Colors.blueGrey[300] : Colors.blueGrey[100],
      //                       borderRadius: BorderRadius.circular(10)
      //                     ),
      //                     child: Row(
      //                       children: [
      //                         SizedBox(width: 20,),
      //                         Text(
      //                           nextVideoController.chapters[index]['chapterNo']
      //                               .toString(),
      //                           style:
      //                               GoogleFonts.raleway(fontWeight: FontWeight.bold),
      //                         ),
      //                         SizedBox(
      //                           width: 20,
      //                         ),
      //                         Text(
      //                           nextVideoController.chapters[index]['chapterName']
      //                               .toString(),
      //                           style:
      //                               GoogleFonts.raleway(fontWeight: FontWeight.bold),
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                 ),
      //                 onTap: () {
      //                   nextVideoController.onItemTapped(index);
      //                 },
      //               ));
      //         },
      //       ),
      //     ),
      //   ],
      // ),
//     );
//   }
// }
