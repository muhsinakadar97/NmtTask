import 'dart:developer';

import 'package:app_design/src/presentation/controller/course_overview_controller.dart';
import 'package:app_design/src/presentation/controller/home_controller.dart';
import 'package:app_design/src/presentation/screens/video/video.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CourseOverview extends StatelessWidget {
  CourseOverview({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find<HomeController>();
    CourseOverviewController courseOverviewController =
        Get.put(CourseOverviewController());

    log("Selected course => ${homeController.selectedItemName.value}");

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(homeController.selectedImage.value),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      homeController.selectedItemName.value,
                      style: GoogleFonts.raleway(
                        color: Colors.blueGrey[900],
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Obx(() {
                      String sectionCountString = (homeController
                                  .selectedItemName.value ==
                              "Python")
                          ? "${courseOverviewController.sectionListPython.length} Videos"
                          : (homeController.selectedItemName.value == "Flutter")
                              ? "${courseOverviewController.sectionListFlutter.length} Videos"
                              : (homeController.selectedItemName.value ==
                                      "Flutter")
                                  ? "${courseOverviewController.sectionListPhp.length} Videos"
                                  : "0 Videos";

                      return Text(
                        sectionCountString,
                        style: GoogleFonts.raleway(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      );
                    }),
                    Padding(
                      padding: const EdgeInsets.only(top: 0, right: 0),
                      child: Container(
                        height: 470,
                        child: ListView.builder(
                          itemCount: (homeController.selectedItemName.value ==
                                  "Python")
                              ? courseOverviewController
                                  .sectionListPython.length
                              : (homeController.selectedItemName.value ==
                                      "Flutter")
                                  ? courseOverviewController
                                      .sectionListFlutter.length
                                  : (homeController.selectedItemName.value ==
                                          "PHP")
                                      ? courseOverviewController
                                          .sectionListPhp.length
                                      : 0,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 50,
                                  child: Row(
                                    children: [
                                      Text(
                                        homeController.selectedItemName.value ==
                                                "Python"
                                            ? "Section ${courseOverviewController.sectionListPython[index]['sectionNo']} -"
                                            : homeController.selectedItemName
                                                        .value ==
                                                    "Flutter"
                                                ? "Section ${courseOverviewController.sectionListFlutter[index]['sectionNo']} -"
                                                : "Section ${courseOverviewController.sectionListPhp[index]['sectionNo']} -",
                                        style: GoogleFonts.raleway(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(width: 20),
                                      Text(
                                        homeController.selectedItemName.value ==
                                                "Python"
                                            ? courseOverviewController
                                                    .sectionListPython[index]
                                                ['sectionName']
                                            : homeController.selectedItemName
                                                        .value ==
                                                    "Flutter"
                                                ? courseOverviewController
                                                        .sectionListFlutter[
                                                    index]['sectionName']
                                                : courseOverviewController
                                                        .sectionListPhp[index]
                                                    ['sectionName'],
                                        style: GoogleFonts.raleway(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                                Obx(() {
                                  final chapters = homeController
                                              .selectedItemName.value ==
                                          "Python"
                                      ? courseOverviewController
                                          .sectionListPython[index]['chapters']
                                      : homeController.selectedItemName.value ==
                                              "Flutter"
                                          ? courseOverviewController
                                                  .sectionListFlutter[index]
                                              ['chapters']
                                          : courseOverviewController
                                                  .sectionListPhp[index]
                                              ['chapters'];
                                  courseOverviewController.selectedSectionName.value = homeController
                                              .selectedItemName.value ==
                                          "Python"
                                      ? courseOverviewController
                                          .sectionListPython[index]['sectionName']
                                      : homeController.selectedItemName.value ==
                                              "Flutter"
                                          ? courseOverviewController
                                                  .sectionListFlutter[index]
                                              ['sectionName']
                                          : courseOverviewController
                                                  .sectionListPhp[index]
                                              ['sectionName'];

                                  return ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: chapters.length,
                                    itemBuilder: (context, chapterIndex) {
                                      String chapterName =
                                          chapters[chapterIndex]
                                                  ['chapterName'] ??
                                              "Unknown Chapter";
                                      String category = chapters[chapterIndex]
                                              ['category'] ??
                                          "Unknown Status";

                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 10, right: 20),
                                        child: GestureDetector(
                                          onTap: () {
                                            String selectedChapterName =
                                                chapters[chapterIndex]
                                                    ['chapterName'];
                                            courseOverviewController.selectedSectionName.value = chapters[chapterIndex]['sectionName'];
                                            courseOverviewController.selectedSectionChapterList.value = chapters;
                                            
                                            log("selectedChapterName => $selectedChapterName");
                                            log("Selected Section => ${courseOverviewController.selectedSectionName.value}");
                                            log("courseOverviewController.selectedSectionChapterList.value => ${courseOverviewController.selectedSectionChapterList.value}");
                                            // String selectedChapterVideoUrl = chapters[chapterIndex]['video_url'];
                                            // log("selectedChapterVideoUrl => $selectedChapterVideoUrl");

                                            courseOverviewController
                                                .selectedChapterName
                                                .value = selectedChapterName;

                                            Get.to(
                                                () => Video(
                                                    videoId:
                                                        chapters[chapterIndex]
                                                            ['video_id']!),
                                                arguments: {
                                                  'courseName': homeController
                                                      .selectedItemName.value,
                                                  'chapterName':
                                                      selectedChapterName,
                                                  'sectionName' : courseOverviewController.selectedSectionName.value,
                                                  // 'sectionName': courseOverviewController.selectedSectionName.value,
                                                  
                                                  // 'video_url' : selectedChapterVideoUrl,
                                                });
                                                // log("courseOverviewController.selectedSectionName.value => ${courseOverviewController.selectedSectionName.value}");
                                          },
                                          child: Container(
                                            height: 60,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                              color: Colors.blueGrey[50],
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20),
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "${chapterIndex + 1}. $chapterName",
                                                      style:
                                                          GoogleFonts.raleway(
                                                              fontSize: 16),
                                                    ),
                                                    Text(
                                                      category,
                                                      style:
                                                          GoogleFonts.raleway(
                                                        fontSize: 14,
                                                        color: category ==
                                                                "Locked"
                                                            ? Colors.red
                                                            : (category ==
                                                                    "Premium"
                                                                ? Colors.orange
                                                                : Colors.green),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:app_design/src/presentation/controller/course_overview_controller.dart';
// import 'package:app_design/src/presentation/screens/video/video.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CourseOverview extends StatelessWidget {
  

//   @override
//   Widget build(BuildContext context) {
//     CourseOverviewController courseOverviewController = Get.put(CourseOverviewController());
//     return Scaffold(
//       appBar: AppBar(title: Text('Course Overview')),
//       body: Obx(() {
//         return ListView.builder(
//           itemCount: courseOverviewController.sectionListPython.length, // Or based on the selected course
//           itemBuilder: (context, sectionIndex) {
//             var section = courseOverviewController.sectionListPython[sectionIndex];
//             return ExpansionTile(
//               title: Text(section['sectionName']),
//               children: List.generate(section['chapters'].length, (chapterIndex) {
//                 var chapter = section['chapters'][chapterIndex];
//                 return ListTile(
//                   title: Text(chapter['chapterName']),
//                   onTap: () {
//                     if (chapter['category'] != 'Locked') {
//                       // Navigate to the Video screen with the video ID
//                       Get.to(() => Video(videoId: chapter['video_id']));
//                     } else {
//                       // Show locked content message
//                       Get.snackbar('Locked', 'This chapter is locked. Please upgrade.');
//                     }
//                   },
//                 );
//               }),
//             );
//           },
//         );
//       }),
//     );
//   }
// }