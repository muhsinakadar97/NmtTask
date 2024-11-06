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
                              : (homeController.selectedItemName.value == "PHP")
                                  ? "${courseOverviewController.sectionListPhp.length} Videos"
                                  : (homeController.selectedItemName.value ==
                                          "Django")
                                      ? "${courseOverviewController.sectionListDjango.length} Videos"
                                      : "0";

                      return Text(
                        sectionCountString,
                        style: GoogleFonts.raleway(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
            courseOverviewController.sections.isEmpty
                ? SliverToBoxAdapter(
                    child: Center(
                      child: Text(
                        "No Sections Found",
                        style: GoogleFonts.raleway(color: Colors.red, fontWeight: FontWeight.w600),
                      ),
                    ),
                  )
                : SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        String selectedItem =
                            homeController.selectedItemName.value;
                        var sections = selectedItem == "Python"
                            ? courseOverviewController.sectionListPython
                            : selectedItem == "Flutter"
                                ? courseOverviewController.sectionListFlutter
                                : selectedItem == "PHP"
                                    ? courseOverviewController.sectionListPhp
                                    : selectedItem == "Django"
                                        ? courseOverviewController
                                            .sectionListDjango
                                        : [];

                        return Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              child: Row(
                                children: [
                                  SizedBox(width: 20),
                                  Text(
                                    "Section ${sections[index]['sectionNo']} -",
                                    style: GoogleFonts.raleway(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Text(
                                    sections[index]['sectionName'],
                                    style: GoogleFonts.raleway(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Obx(() {
                              final chapters = sections[index]['chapters'];
                              courseOverviewController.selectedSectionName
                                  .value = sections[index]['sectionName'];

                              return ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: chapters.length,
                                itemBuilder: (context, chapterIndex) {
                                  String chapterName = chapters[chapterIndex]
                                          ['chapterName'] ??
                                      "Unknown Chapter";
                                  String category = chapters[chapterIndex]
                                          ['category'] ??
                                      "Unknown Status";
                                  String chapterNumber =
                                      chapters[chapterIndex]['chapterNo'];

                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 10, right: 20, left: 20),
                                    child: GestureDetector(
                                      onTap: () {
                                        String selectedChapterName =
                                            chapterName;
                                        courseOverviewController
                                            .selectedSectionChapterList
                                            .value = chapters;
                                        log("selectedChapterName => $selectedChapterName");
                                        courseOverviewController.selectedChapterName.value = selectedChapterName;

                                        courseOverviewController
                                            .selectedChapterName
                                            .value = selectedChapterName;

                                        Get.to(
                                          () => Video(
                                              videoId: chapters[chapterIndex]
                                                  ['video_id']!),
                                          arguments: {
                                            'courseName': homeController
                                                .selectedItemName.value,
                                            'chapterName': selectedChapterName,
                                            'sectionName':
                                                courseOverviewController
                                                    .selectedSectionName.value,
                                          },
                                        );
                                      },
                                      child: Container(
                                        height: 60,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          color: Colors.blueGrey[50],
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                                    "Chapter ${chapterNumber}  :   ",
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
                              );
                            }),
                            SizedBox(height: 20),
                          ],
                        );
                      },
                      childCount: courseOverviewController.getSectionListLength(
                          homeController.selectedItemName.value),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
