import 'package:app_design/src/core/config/theme/colors.dart';
import 'package:app_design/src/data/models/chapter.dart';
import 'package:app_design/src/presentation/controller/course_overview_controller.dart';
import 'package:app_design/src/presentation/controller/view_video_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class VideoList extends StatelessWidget {
  const VideoList({super.key});

  @override
  Widget build(BuildContext context) {
    ViewVideoController viewVideoCtr = Get.find<ViewVideoController>();
    CourseOverviewController courseOverviewController =
        Get.find<CourseOverviewController>();
    // return Expanded(
    //   child: ListView.builder(
    //     itemCount: viewVideoCtr.chapters.length,
    //     padding: EdgeInsets.only(
    //         bottom: viewVideoCtr.listItemHeight * viewVideoCtr.chapters.length),
    //     itemBuilder: (context, index) {
    //       Chapter chapter = viewVideoCtr.chapters[index];

    //       return Padding(
    //         padding: const EdgeInsets.only(
    //           left: 20,
    //           right: 20,
    //           top: 10,
    //         ),
    //         child: GestureDetector(
    //           onTap: () {
    //             viewVideoCtr.updateKey();
    //             viewVideoCtr.onItemTapped(context, index);
    //           },
    //           child: Container(
    //               height: 60,
    //               padding: const EdgeInsets.only(left: 10, right: 8),
    //               width: MediaQuery.of(context).size.width,
    //               decoration: BoxDecoration(
    //                 color: Colors.blueGrey[50],
    //                 borderRadius: BorderRadius.circular(6),
    //               ),
    //               child: Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     Expanded(
    //                       flex: 7,
    //                       child: LayoutBuilder(
    //                         builder: (context, constraints) {
    //                           return Row(
    //                             children: [
    //                               SizedBox(
    //                                 width: constraints.minWidth / 9,
    //                                 height: constraints.maxHeight,
    //                                 child: Center(
    //                                   child: Text(
    //                                     '${chapter.chapterNo}.',
    //                                     style: GoogleFonts.raleway(
    //                                         fontSize: 16,
    //                                         fontWeight: FontWeight.bold),
    //                                   ),
    //                                 ),
    //                               ),
    //                               SizedBox(
    //                                 width: constraints.maxWidth -
    //                                     (constraints.minWidth / 9),
    //                                 height: constraints.maxHeight,
    //                                 child: Center(
    //                                   child: Row(
    //                                     children: [
    //                                       const SizedBox(width: 4),
    //                                       Expanded(
    //                                         child: Text(
    //                                           chapter.chapterName,
    //                                           maxLines: 2,
    //                                           textAlign: TextAlign.start,
    //                                           overflow: TextOverflow.ellipsis,
    //                                           style: GoogleFonts.raleway(
    //                                               fontSize: 16),
    //                                         ),
    //                                       ),
    //                                     ],
    //                                   ),
    //                                 ),
    //                               ),
    //                             ],
    //                           );
    //                         },
    //                       ),
    //                     ),
    //                     Flexible(
    //                         flex: 2,
    //                         child: Center(
    //                           child: Text(
    //                             chapter.category,
    //                             style: GoogleFonts.raleway(
    //                               fontSize: 13,
    //                               fontWeight: FontWeight.bold,
    //                               color: chapter.category == "Locked"
    //                                   ? Colors.red
    //                                   : (chapter.category == "Premium"
    //                                       ? Colors.orange
    //                                       : Colors.green),
    //                             ),
    //                           ),
    //                         )),
    //                   ])),
    //         ),
    //       );
    //     },
    //   ),
    // );
    return Expanded(
      child: Obx(
        () => ListView.builder(
          padding: EdgeInsets.only(
              bottom:
                  viewVideoCtr.listItemHeight * viewVideoCtr.chapters.length),
          controller: courseOverviewController.scrollController,
          itemCount: viewVideoCtr.chapters.length,
          itemBuilder: (context, index) {
            Chapter chapter = viewVideoCtr.chapters[index];
            return GestureDetector(
                onTap: () {
                  viewVideoCtr.updateKey();
                  viewVideoCtr.onItemTapped(context, index);
                },
                child: Obx(
                  () => Container(
                      height: 60,
                      padding: const EdgeInsets.only(left: 10, right: 8),
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: viewVideoCtr.currentChapterName.value ==
                                chapter.chapterName
                            ? AppColors.buttonColor.withOpacity(0.2)
                            : Colors.blueGrey[50],
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
                                            '${chapter.chapterNo}.',
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
                                                  chapter.chapterName,
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
                                    chapter.category,
                                    style: GoogleFonts.raleway(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: chapter.category == "Locked"
                                          ? Colors.red
                                          : (chapter.category == "Premium"
                                              ? Colors.orange
                                              : Colors.green),
                                    ),
                                  ),
                                )),
                          ])),
                )
                // Container(
                //   margin: const EdgeInsets.symmetric(
                //     horizontal: 10,
                //     vertical: 5,
                //   ),
                //   height: 70.0,
                //   decoration: BoxDecoration(
                //     color: viewVideoCtr.currentChapterName.value ==
                //             chapter.chapterName
                //         ? Colors.purple[50]
                //         : Colors.blueGrey[50],
                //     borderRadius: BorderRadius.circular(10),
                //   ),
                //   child: Padding(
                //     padding: const EdgeInsets.symmetric(horizontal: 10),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Row(
                //           children: [
                //             Text(
                //               "Chapter ${chapter.chapterNo}  :  ",
                //               style: GoogleFonts.raleway(
                //                   fontSize: 15,
                //                   fontWeight: FontWeight.bold,
                //                   color: courseOverviewController
                //                               .colorChapterName.value ==
                //                           chapter.chapterName
                //                       ? Colors.black
                //                       : Colors.blueGrey[900]),
                //             ),
                //             Text(
                //               chapter.chapterName,
                //               style: GoogleFonts.raleway(
                //                   fontSize: 16,
                //                   color: courseOverviewController
                //                               .colorChapterName.value ==
                //                           chapter.chapterName
                //                       ? Colors.black
                //                       : Colors.blueGrey[900]),
                //             ),
                //           ],
                //         ),
                //         Text(
                //           chapter.category,
                //           style: GoogleFonts.raleway(
                //             fontSize: 13,
                //             fontWeight: FontWeight.bold,
                //             color: chapter.category == "Locked"
                //                 ? Colors.red
                //                 : (chapter.category == "Premium"
                //                     ? Colors.orange
                //                     : Colors.green),
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
    );
  }
}
