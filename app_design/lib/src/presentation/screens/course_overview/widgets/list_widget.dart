import 'package:app_design/src/data/models/section.dart';
import 'package:app_design/src/presentation/controller/course_overview_controller.dart';
import 'package:app_design/src/presentation/screens/video/video.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ListWidget extends StatelessWidget {
  const ListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    CourseOverviewController courseOverviewController =
        Get.find<CourseOverviewController>();
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, sectionIndex) {
          Section currentSection =
              courseOverviewController.sections[sectionIndex];
          courseOverviewController.selectedSection = currentSection;

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
                        courseOverviewController.setSection(
                          section: currentSection,
                          selectedChapterIndex: chapterIndex,
                        );
                        courseOverviewController.selectedChapter =
                            currentSection.chapters[chapterIndex];
                        Get.to(ViewVideo(
                          videoIdForLoading:
                              currentSection.chapters[chapterIndex].videoId,
                          currentChapterName:
                              currentSection.chapters[chapterIndex].chapterName,
                        ));
                      },
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey[50],
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
                                    "Chapter ${currentSection.chapters[chapterIndex].chapterNo} : ",
                                    style: GoogleFonts.raleway(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    currentSection
                                        .chapters[chapterIndex].chapterName,
                                    style: GoogleFonts.raleway(fontSize: 16),
                                  ),
                                ],
                              ),
                              Text(
                                currentSection.chapters[chapterIndex].category,
                                style: GoogleFonts.raleway(
                                  fontSize: 14,
                                  color: currentSection.chapters[chapterIndex]
                                              .category ==
                                          "Locked"
                                      ? Colors.red
                                      : (currentSection.chapters[chapterIndex]
                                                  .category ==
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
