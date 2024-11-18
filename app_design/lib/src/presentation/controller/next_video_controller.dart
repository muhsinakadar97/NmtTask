import 'dart:developer';

import 'package:app_design/src/data/models/chapter.dart';
import 'package:app_design/src/data/models/section.dart';
import 'package:app_design/src/presentation/controller/course_overview_controller.dart';
import 'package:app_design/src/presentation/controller/video_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NextVideoController extends GetxController {
  final VideoController videoController = Get.put(VideoController());
  final CourseOverviewController courseOverviewController =
      Get.put(CourseOverviewController());

  // Rx variables to manage chapter selection and video loading
  RxInt selectedChapterIndex = (0).obs; // Starts with no selection
  RxString selectedVideoId = "".obs;
  RxString selectedChapterName = "".obs;

  RxString selectedTileName = "".obs;

  late Chapter selectedChapter;

  // Scroll controller for the chapter list
  final ScrollController scrollController = ScrollController();

  // List of chapters for the current section
  RxList<Chapter> chapters = RxList([]); // Make sure it's observable

  @override
  void onInit() {
    super.onInit();
    // Load chapters for the selected section
    fetchChaptersForSections(courseOverviewController.selectedSection);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Automatically scroll to the desired chapter on load
      if (selectedChapterIndex.value >= 0) {
        scrollToSelectedIndex(selectedChapterIndex.value);
      }
    });
  }

  void scrollToSelectedIndex(int index) {
    double offset = (index * 65.0).clamp(0.0,
        scrollController.position.maxScrollExtent); // Adjust height as needed

    scrollController.jumpTo(offset); // Use jumpTo for immediate scrolling
  }

  void onItemTapped(int index) {
    selectedChapterIndex.value = index;

    // Calculate the offset to scroll to the selected item
    double offset = (index * 65.0).clamp(
        0.0,
        scrollController
            .position.maxScrollExtent); // 65.0 is the height of each item

    scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );

    videoController.loadVideo(selectedChapter.videoId);
    log("selectedChapter.videoId =>  ${selectedChapter.videoId}");
  }

  void changeVideo({required int index}) {
    selectedChapterIndex.value = index;
    log('selectedChapterIndex : $selectedChapterIndex');
  }

  // Fetch chapters for a section
  void fetchChaptersForSections(Section section) {
    chapters.assignAll(
        section.chapters); // Use assignAll to properly update the RxList
    log("Chapters for section => ${section.toString()}");
  }

  // // To handle selected list item
  // void onItemTapped(int index, List<Chapter> chapterList) {
  //   selectedChapterIndex.value = index; // Update the index when an item is tapped
  //   selectedChapterName.value = chapterList[selectedChapterIndex.value].chapterName;
  //   log("Tapped index => ${selectedChapterIndex.value}");
  //   log("Selected Video ID => ${chapterList[selectedChapterIndex.value].videoId}");

  //   videoController.loadVideo(chapterList[selectedChapterIndex.value].videoId);
  // }
}
