import 'dart:developer';

import 'package:app_design/src/data/models/section.dart';
import 'package:app_design/src/presentation/controller/course_overview_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ChapterList extends StatelessWidget {
  const ChapterList({super.key});

  @override
  Widget build(BuildContext context) {
    CourseOverviewController courseOverviewController =
        Get.find<CourseOverviewController>();
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, sectionIndex) {
          Section currentSection =
              courseOverviewController.sections[sectionIndex];

          // log('currentSection : $currentSection');
          courseOverviewController.selectedSection = currentSection;
          // log('courseOverviewController.selectedSection : ${courseOverviewController.selectedSection}');

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
                  return Padding(
                    padding:
                        const EdgeInsets.only(bottom: 10, right: 20, left: 20),
                    child: GestureDetector(
                      onTap: () {
                        log("Hello Good morning");
                        courseOverviewController.onChapterSelected(
                          currentSection,
                          chapterIndex,
                        );
                      },
                      child: Container(
                        height: 60,
                        padding: const EdgeInsets.only(left: 10, right: 8),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey[50],
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 7,
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  return Row(
                                    children: [
                                      SizedBox(
                                        width: constraints.minWidth / 9,
                                        height: constraints.maxHeight,
                                        child: Center(
                                          child: Text(
                                            '${currentSection.chapters[chapterIndex].chapterNo}.',
                                            style: GoogleFonts.raleway(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: constraints.maxWidth -
                                            (constraints.minWidth / 9),
                                        height: constraints.maxHeight,
                                        child: Center(
                                          child: Row(
                                            children: [
                                              const SizedBox(width: 4),
                                              Expanded(
                                                child: Text(
                                                  currentSection
                                                      .chapters[chapterIndex]
                                                      .chapterName,
                                                  maxLines: 2,
                                                  textAlign: TextAlign.start,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.raleway(
                                                      fontSize: 16),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            Flexible(
                                flex: 2,
                                child: Center(
                                  child: Text(
                                    currentSection
                                        .chapters[chapterIndex].category,
                                    style: GoogleFonts.raleway(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: currentSection
                                                  .chapters[chapterIndex]
                                                  .category ==
                                              "Locked"
                                          ? Colors.red
                                          : (currentSection
                                                      .chapters[chapterIndex]
                                                      .category ==
                                                  "Premium"
                                              ? Colors.orange
                                              : Colors.green),
                                    ),
                                  ),
                                )),
                            // Row(
                            //   children: [
                            //     Text(
                            //       "Chapter ${currentSection.chapters[chapterIndex].chapterNo} : ",
                            //       style: GoogleFonts.raleway(
                            //           fontSize: 16,
                            //           fontWeight: FontWeight.bold),
                            //     ),
                            //     Text(
                            //       currentSection
                            //           .chapters[chapterIndex].chapterName,
                            //       maxLines: 2,
                            //       style: GoogleFonts.raleway(fontSize: 16),
                            //     ),
                            //   ],
                            // ),
                            // Text(
                            //   currentSection.chapters[chapterIndex].category,
                            //   style: GoogleFonts.raleway(
                            //     fontSize: 13,
                            //     fontWeight: FontWeight.bold,
                            //     color: currentSection
                            //                 .chapters[chapterIndex].category ==
                            //             "Locked"
                            //         ? Colors.red
                            //         : (currentSection.chapters[chapterIndex]
                            //                     .category ==
                            //                 "Premium"
                            //             ? Colors.orange
                            //             : Colors.green),
                            //   ),
                            // ),
                          ],
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
    );
  }
}
