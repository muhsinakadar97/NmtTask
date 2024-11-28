import 'dart:developer';

import 'package:app_design/src/data/models/chapter.dart';
import 'package:app_design/src/data/models/section.dart';
import 'package:app_design/src/presentation/controller/course_overview_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewVideoController extends GetxController {
  ScrollController scrollController = ScrollController();
  Rx<UniqueKey> videoWidgetKey = Rx(UniqueKey());
  CourseOverviewController courseOverviewController =
      Get.find<CourseOverviewController>();
  double listItemHeight = 250.0;
  @override
  void onInit() {
    super.onInit();
    fetchChaptersForSections(courseOverviewController.selectedSection);
  }

  void updateKey() {
    videoWidgetKey.value = UniqueKey();
  }

  // TABBAR

  final PageController pageController = PageController();
  RxInt selectedIndex = 0.obs;
  RxBool isTapped = false.obs;

  RxList<bool> isSelectedList = List.generate(10, (index) => false).obs;
  final List<Map<String, dynamic>> tabItems = [
    {'icon': Icons.video_stable_rounded, 'title': 'Videos'},
    {'icon': Icons.note, 'title': 'Notes'},
    {'icon': Icons.book, 'title': 'Expert\nVideos'},
    {'icon': Icons.video_library, 'title': 'Doubts'},
    {'icon': Icons.image, 'title': 'FAQ'},
    {'icon': Icons.music_note, 'title': 'Practice\nQuestions'},
    {'icon': Icons.star, 'title': 'Quiz'},
    {'icon': Icons.settings, 'title': 'Interview\nQuestions'},
  ];

  // NEXT VIDEO

  RxInt selectedChapterIndex = 0.obs;
  RxString selectedVideoId = "".obs;
  RxBool isVideoPlaying = false.obs;

  RxList<Chapter> chapters = RxList([]);

  RxString currentVideoId = "".obs;
  RxString currentChapterName = "".obs;

  void fetchChaptersForSections(Section section) {
    chapters.assignAll(section.chapters);
    log("chapters from nextvideo => $chapters");
  }

  void onItemTapped(BuildContext context, int index) {
    Chapter selectedChapter = chapters[index];
    selectedChapterIndex.value = index;
    courseOverviewController.colorChapterName.value =
        selectedChapter.chapterName;

    courseOverviewController.selectedChapter = selectedChapter;

    isVideoPlaying.value = true; // Set video to playing state

    currentVideoId.value = selectedChapter.videoId;
    currentChapterName.value = selectedChapter.chapterName;

    // Scroll to the selected chapter
    scrollToSelectedIndex(index);
  }

  void setCurrentVideoId({required String videoId}) {
    currentVideoId.value = videoId;
  }

  void setCurrentChapterName({required String chapterName}) {
    currentChapterName.value = chapterName;
  }

  void scrollToSelectedIndex(int index) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (courseOverviewController.scrollController.hasClients) {
        double listItemHeight = 80.0;
        double targetOffset = index * listItemHeight;

        courseOverviewController.scrollController.animateTo(
          targetOffset,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    pageController.dispose();
    super.dispose();
  }
}
