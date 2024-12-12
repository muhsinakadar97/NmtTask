import 'dart:developer';

import 'package:app_design/src/data/models/chapter.dart';
import 'package:app_design/src/data/models/section.dart';
import 'package:app_design/src/presentation/controller/course_overview_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewVideoController extends GetxController {
  // ScrollController scrollController = ScrollController();
  // Rx<UniqueKey> videoWidgetKey = Rx(UniqueKey());
  // CourseOverviewController courseOverviewController =
  //     Get.find<CourseOverviewController>();
  double listItemHeight = 250.0;
  // RxBool isFullscreen = false.obs;

  ScrollController scrollController = ScrollController();
  Rx<UniqueKey> videoWidgetKey = Rx(UniqueKey()); // Retain UniqueKey
  CourseOverviewController courseOverviewController =
      Get.find<CourseOverviewController>();
  RxBool isFullscreen = false.obs;
  RxString name = "Dictionary".obs;
  @override
  void onInit() {
    super.onInit();
    fetchChaptersForSections(courseOverviewController.selectedSection);
  }

  // method to update the value of the key
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
  RxString currentSectionName = "".obs;

  RxList<Chapter> chapterList = RxList([]);

  // fetch section wise chapters
  void fetchChaptersForSections(Section section) {
    chapters.assignAll(section.chapters);
    log("chapters from nextvideo => $chapters");
  }

  // when select a chapter
  void onItemTapped(BuildContext context, int index) {
    Chapter selectedChapter = chapters[index];
    selectedChapterIndex.value = index;
    courseOverviewController.colorChapterName.value =
        selectedChapter.chapterName;

    // log("Selected Chapter => ${selectedChapter.chapterName}");
    courseOverviewController.colorChapterName.value =
        selectedChapter.chapterName;

    courseOverviewController.selectedChapter = selectedChapter;

    isVideoPlaying.value = true; // Set video to playing state

    currentVideoId.value = selectedChapter.videoId;
    currentChapterName.value = selectedChapter.chapterName;
    log("currentChapterName.value from next video => ${currentChapterName.value}");

    // Scroll to the selected chapter
    scrollToSelectedIndex(
      index,
    );
    log("courseOverviewController.selectedSection.chapters => ${courseOverviewController.selectedSection.chapters}");
  }

  // set video id
  void setCurrentVideoId({required String videoId}) {
    currentVideoId.value = videoId;
  }

  // set chapter name
  void setCurrentChapterName({required String chapterName}) {
    currentChapterName.value = chapterName;
  }

// set section name
  void setCurrentSectionName({required String sectionName}) {
    currentSectionName.value = sectionName;
  }

// set chapter list
  void setCurrentChapterList({required List<Chapter> chapters}) {
    chapterList.value = chapters;
  }

//scroll the list to selected index
  void scrollToSelectedIndex(int index) {
    double itemHeight = 70.0;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (courseOverviewController.scrollController.hasClients) {
        double targetOffset = index * itemHeight;

        // Debugging logs
        log("Scrolling to index: $index");
        log("Target offset: $targetOffset");

        // Ensure the targetOffset does not exceed the scrollable area
        double maxOffset =
            courseOverviewController.scrollController.position.maxScrollExtent;
        targetOffset = targetOffset.clamp(0.0, maxOffset);

        // Debugging log to check max scroll extent
        log("Max scroll extent: $maxOffset");

        // Animate to the target offset
        courseOverviewController.scrollController.animateTo(
          targetOffset,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

// method to toggle fullscreen
  void toggleFullscreen(bool value) {
    isFullscreen.value = value;
    log("Fullscreen state changed: $value");
  }

  @override
  void dispose() {
    scrollController.dispose();
    pageController.dispose();
    super.dispose();
  }
}
