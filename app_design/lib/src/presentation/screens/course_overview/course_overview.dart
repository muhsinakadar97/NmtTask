import 'dart:developer';

import 'package:app_design/src/data/models/section.dart';
import 'package:app_design/src/presentation/controller/course_overview_controller.dart';
import 'package:app_design/src/presentation/controller/home_controller.dart';
import 'package:app_design/src/presentation/screens/video/video.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CourseOverview extends StatelessWidget {
  const CourseOverview({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find<HomeController>();
    CourseOverviewController courseOverviewController =
        Get.put(CourseOverviewController());

    log("Selected course => ${homeController.selectedItemName.value}");

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Course Image at the top
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
                    // Course video count
                    //         Obx(() {
                    //           String sectionCountString = (homeController
                    //                       .selectedItemName.value == "Python")
                    //               ? "${courseOverviewController.totalNoOfChaptersPython} Videos"
                    //               : (homeController.selectedItemName.value == "Flutter")
                    //                   ? "${courseOverviewController.totalNoOfChaptersFlutter} Videos"
                    //                   : (homeController.selectedItemName.value == "PHP")
                    //                       ? "${courseOverviewController.totalNoOfChaptersPhp} Videos"
                    //                       : (homeController.selectedItemName.value == "Django")
                    //                           ? "${courseOverviewController.totalNoOfChaptersDjango} Videos"
                    //                           : "0";

                    //           return Text(
                    //             sectionCountString,
                    //             style: GoogleFonts.raleway(
                    //               color: Colors.black,
                    //               fontSize: 18,
                    //             ),
                    //           );
                    // }),
                  ],
                ),
              ),
            ),
            courseOverviewController.sections.isEmpty
                ? SliverToBoxAdapter(
                    child: Center(
                      child: Text(
                        "No Sections Found",
                        style: GoogleFonts.raleway(
                            color: Colors.red, fontWeight: FontWeight.w600),
                      ),
                    ),
                  )
                : // SliverList for displaying Sections and Chapters
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, sectionIndex) {
                        Section currentSection =
                            courseOverviewController.sections[sectionIndex];
                        courseOverviewController.selectedSection =
                            currentSection;

                        // Display section details
                        return Column(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              child: Row(
                                children: [
                                  const SizedBox(width: 20),
                                  Text(
                                    'Section ${currentSection.sectionNo} - ${currentSection.sectionName}',
                                    style: GoogleFonts.raleway(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),

                            // Displaying chapters for the current section
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: currentSection.chapters.length,
                              itemBuilder: (context, chapterIndex) {
                                var currentChapter =
                                    currentSection.chapters[chapterIndex];

                                String chapterName =
                                    currentChapter.chapterName ??
                                        "Unknown Chapter";
                                String category =
                                    currentChapter.category ?? "Unknown Status";
                                String chapterNumber =
                                    currentChapter.chapterNo ??
                                        "Unknown Number";
                                String videoId = currentChapter.videoId ?? "";
                                String sectionName =
                                    currentChapter.sectionName ?? "";

                                return Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 10, right: 20, left: 20),
                                  child: GestureDetector(
                                    onTap: () {
                                      // Handle chapter click
                                      courseOverviewController
                                          .selectedChapterName
                                          .value = chapterName;
                                      courseOverviewController
                                          .selectedSectionName
                                          .value = sectionName;
                                     

                                          // variables for fetching selected section, chapterlist and selected chapter
                                          courseOverviewController.selectedSection = currentSection;
                                          courseOverviewController.selectedSectionChapterList.value = currentSection.chapters;
                                          courseOverviewController.selectedChapter = currentSection.chapters[chapterIndex];


                                      log("selectedChapterName => $chapterName");
                                      

                                      log('selectedSectionName => $sectionName');
                                      log("selectedSectionChapterList => ${courseOverviewController.selectedSectionChapterList}");
                                      log("selected chapter index from course overview => $chapterIndex");
                                      courseOverviewController
                                          .selectedChapterIndex
                                          .value = chapterIndex;
                                      courseOverviewController
                                          .colorIndex.value = chapterIndex;

                                      // Navigate to Video screen
                                      Get.to(() => Video(videoId: videoId));
                                    },
                                    child: Container(
                                      height: 60,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: Colors.blueGrey[50],
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Chapter $chapterNumber : ",
                                                  style: GoogleFonts.raleway(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  chapterName,
                                                  style: GoogleFonts.raleway(
                                                      fontSize: 16),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              category,
                                              style: GoogleFonts.raleway(
                                                fontSize: 14,
                                                color: category == "Locked"
                                                    ? Colors.red
                                                    : (category == "Premium"
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
                            ),
                            const SizedBox(height: 20),
                          ],
                        );
                      },
                      childCount: courseOverviewController.sections.length,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
