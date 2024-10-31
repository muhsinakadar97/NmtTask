import 'dart:developer';

import 'package:app_design/src/presentation/controller/tabbar_custom_controller.dart';
import 'package:app_design/src/presentation/screens/doubts/doubts.dart';
import 'package:app_design/src/presentation/screens/expert_videos/expert_videos.dart';
import 'package:app_design/src/presentation/screens/faq/faq.dart';
import 'package:app_design/src/presentation/screens/interview_questions/interview_questions.dart';
import 'package:app_design/src/presentation/screens/next/next_video.dart';
import 'package:app_design/src/presentation/screens/notes/notes.dart';
import 'package:app_design/src/presentation/screens/practice_questions/practice_questions.dart';
import 'package:app_design/src/presentation/screens/quiz/quiz.dart';
import 'package:app_design/src/presentation/widgets/tab_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabbarCustom extends StatelessWidget {
  const TabbarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    final TabbarSecondController tabbarCustomController =
        Get.put(TabbarSecondController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              margin: EdgeInsets.symmetric(horizontal: 12),
              height: 70,
              decoration: BoxDecoration(
                  color: Colors.blueGrey[900],
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: tabbarCustomController.tabItems.length,
                    itemBuilder: (context, index) {
                      // bool isSelected =
                      //     tabbarCustomController.isSelectedList[index];
                      return Obx(() => GestureDetector(
                            onTap: () {
                              tabbarCustomController.onItemTap(index);
                              tabbarCustomController.selectedIndex.value =
                                  index;
                              tabbarCustomController.isTapped.value = true;
                              log("selected index => ${tabbarCustomController.selectedIndex.value}");
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 250),
                              curve:
                                  tabbarCustomController.selectedIndex.value ==
                                          index
                                      ? Curves.easeInOutSine
                                      : Curves.linear,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              height:
                                  tabbarCustomController.selectedIndex.value ==
                                          index
                                      ? 40
                                      : 30,
                              width:
                                  tabbarCustomController.selectedIndex.value ==
                                          index
                                      ? 120
                                      : 100,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: tabbarCustomController
                                                .selectedIndex.value ==
                                            index
                                        ? Colors.blueGrey[300]
                                        : Colors.white,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TabWidget(
                                        index: index,
                                        isSelected: index ==
                                            tabbarCustomController
                                                .selectedIndex.value,
                                        icon: tabbarCustomController
                                            .tabItems[index]['icon'],
                                        title: tabbarCustomController
                                            .tabItems[index]['title'],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ));
                    },
                  );
                },
              ),
            ),
            Expanded(
              child: Obx(() {
                Widget selectedPage;

                switch (tabbarCustomController.selectedIndex.value) {
                  case 0:
                    selectedPage = NextVideo();
                  case 1:
                    selectedPage = Notes();
                    break;
                  case 2:
                    selectedPage = ExpertVideos();
                    break;
                  case 3:
                    selectedPage = Doubts();
                    break;
                  case 4:
                    selectedPage = Faq();
                    break;
                  case 5:
                    selectedPage = PracticeQuestions();
                    break;
                  case 6:
                    selectedPage = Quiz();
                    break;
                  case 7:
                    selectedPage = InterviewQuestions();
                    break;
                  default:
                    selectedPage = Container(); // Fallback
                }

                return Container(
                  width: double.infinity,
                  child: selectedPage,
                );
              }),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 16, right: 16, top: 18),
            //   child: Container(
            //     padding: EdgeInsets.only(left: 12),
            //     clipBehavior: Clip.hardEdge,
            //     height: 70,
            //     width: MediaQuery.of(context).size.width,
            //     decoration: const BoxDecoration(
            //       gradient: LinearGradient(
            //         colors: [
            //           Color.fromRGBO(92, 107, 192, 1),
            //           Color.fromRGBO(40, 53, 147, 1)
            //         ],
            //         begin: Alignment.bottomLeft,
            //         end: Alignment.bottomRight,
            //       ),
            //       borderRadius: BorderRadius.all(Radius.circular(12)),
            //     ),
            //     child: LayoutBuilder(
            //       builder: (context, constraints) {
            //         return ListView.builder(
            //           scrollDirection: Axis.horizontal,
            //           itemCount: tabbarCustomController.tabItems.length,
            //           itemBuilder: (context, index) {
            //             bool isSelected =
            //                 tabbarCustomController.isSelectedList[index];
            //             return Obx(() => AnimatedContainer(
            //                   duration: const Duration(milliseconds: 250),
            //                   curve:
            //                       tabbarCustomController.selectedIndex.value ==
            //                               index
            //                           ? Curves.easeInOutSine
            //                           : Curves.linear,
            //                   decoration: BoxDecoration(
            //                     borderRadius: BorderRadius.circular(30),
            //                   ),
            //                   height:
            //                       tabbarCustomController.selectedIndex.value ==
            //                               index
            //                           ? 40
            //                           : 30,
            //                   width:
            //                       tabbarCustomController.selectedIndex.value ==
            //                               index
            //                           ? 120
            //                           : 100,
            //                   child: Container(
            //                     margin: EdgeInsets.only(
            //                         left: 0, right: 20, top: 12, bottom: 12),
            //                     decoration: BoxDecoration(
            //                       borderRadius: BorderRadius.circular(10),
            //                       color: tabbarCustomController
            //                                   .selectedIndex.value ==
            //                               index
            //                           ? Colors.black
            //                           : Colors.white,
            //                     ),
            //                     child: Column(
            //                       mainAxisAlignment: MainAxisAlignment.center,
            //                       children: [
            //                         GestureDetector(
            //                           onTap: () {
            //                             tabbarCustomController.onItemTap(index);
            //                             tabbarCustomController
            //                                 .selectedIndex.value = index;
            //                             tabbarCustomController.isTapped.value =
            //                                 true;
            //                             log("selected index => ${tabbarCustomController.selectedIndex.value}");
            //                           },
            //                           child: TabWidget(
            //                             index: index,
            //                             isSelected: index ==
            //                                 tabbarCustomController
            //                                     .selectedIndex.value,
            //                             icon: tabbarCustomController
            //                                 .tabItems[index]['icon'],
            //                             title: tabbarCustomController
            //                                 .tabItems[index]['title'],
            //                           ),
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                 ));
            //           },
            //         );
            //       },
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
