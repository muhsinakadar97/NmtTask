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
              margin: const EdgeInsets.symmetric(horizontal: 12),
              height: 70,
              decoration: BoxDecoration(
                  color: Colors.blueGrey[900],
                  borderRadius: const BorderRadius.all(Radius.circular(12))),
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
                    selectedPage =  Notes();
                    break;
                  case 2:
                    selectedPage = const ExpertVideos();
                    break;
                  case 3:
                    selectedPage =  Doubts();
                    break;
                  case 4:
                    selectedPage = const Faq();
                    break;
                  case 5:
                    selectedPage =  PracticeQuestions();
                    break;
                  case 6:
                    selectedPage = const Quiz();
                    break;
                  case 7:
                    selectedPage = const InterviewQuestions();
                    break;
                  default:
                    selectedPage = Container(); // Fallback
                }

                return SizedBox(
                  width: double.infinity,
                  child: selectedPage,
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
