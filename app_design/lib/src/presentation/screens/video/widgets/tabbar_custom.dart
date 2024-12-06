import 'dart:developer';

import 'package:app_design/src/presentation/controller/view_video_controller.dart';
import 'package:app_design/src/presentation/screens/doubts/doubts.dart';
import 'package:app_design/src/presentation/screens/expert_videos/expert_videos.dart';
import 'package:app_design/src/presentation/screens/faq/faq.dart';
import 'package:app_design/src/presentation/screens/interview_questions/interview_questions.dart';
import 'package:app_design/src/presentation/screens/next/next_video.dart';
import 'package:app_design/src/presentation/screens/notes/notes.dart';
import 'package:app_design/src/presentation/screens/practice_questions/practice_questions.dart';
import 'package:app_design/src/presentation/screens/quiz/quiz.dart';
import 'package:app_design/src/presentation/screens/video/widgets/tab_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabbarCustom extends StatelessWidget {
  const TabbarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    ViewVideoController viewVideoController = Get.find<ViewVideoController>();

    return Column(
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
                itemCount: viewVideoController.tabItems.length,
                itemBuilder: (context, index) {
                  return Obx(() => GestureDetector(
                        onTap: () {
                          viewVideoController.selectedIndex.value = index;
                          viewVideoController.isTapped.value = true;
                          // Set the PageView to the selected index
                          viewVideoController.pageController.animateToPage(
                            index,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                          log("selected index => ${viewVideoController.selectedIndex.value}");
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          curve:
                              viewVideoController.selectedIndex.value == index
                                  ? Curves.easeInOutSine
                                  : Curves.linear,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          height:
                              viewVideoController.selectedIndex.value == index
                                  ? 40
                                  : 30,
                          width:
                              viewVideoController.selectedIndex.value == index
                                  ? 120
                                  : 100,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color:
                                    viewVideoController.selectedIndex.value ==
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
                                        viewVideoController
                                            .selectedIndex.value,
                                    icon: viewVideoController.tabItems[index]
                                        ['icon'],
                                    title: viewVideoController.tabItems[index]
                                        ['title'],
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
        Flexible(
          child: PageView(
            controller: viewVideoController.pageController,
            onPageChanged: (index) {
              viewVideoController.selectedIndex.value =
                  index; // Update selected tab index
            },
            children: [
              const NextVideo(),
              Notes(),
              const ExpertVideos(),
              Doubts(),
              const Faq(),
              PracticeQuestions(),
              const Quiz(),
              const InterviewQuestions(),
            ],
          ),
        ),
      ],
    );
  }
}
