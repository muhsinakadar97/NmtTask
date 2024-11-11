import 'dart:developer';
import 'package:app_design/src/data/models/chapter.dart';
import 'package:app_design/src/data/models/section.dart';
import 'package:app_design/src/presentation/controller/course_overview_controller.dart';
import 'package:app_design/src/presentation/controller/video_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NextVideoController extends GetxController {
  final VideoController videoController = Get.put(VideoController());
  final CourseOverviewController courseOverviewController = Get.put(CourseOverviewController());

  // Rx variables to manage chapter selection and video loading
  RxInt selectedChapterIndex = (-1).obs;
  RxString selectedVideoId = "".obs;
  RxString selectedChapterName = "".obs;

  // Scroll controller for the chapter list
  final ScrollController scrollController = ScrollController();

  // List of chapters for the current section
  RxList<Chapter> chapters = RxList([]);

  @override
  void onInit() {
    super.onInit();
    // Load chapters for the selected section
    fetchChaptersForSections(courseOverviewController.selectedSection);
  }

  // Fetch chapters for a section
  void fetchChaptersForSections(Section section) {
    chapters.value = section.chapters.map((chapter) => chapter).toList();
    log("Chapters for section => ${section.toString()}");
  }

  void onItemTapped(int index, List<Chapter> chapterList) {
  selectedChapterIndex.value = index;
  // selectedChapterName.value = chapterList[index].chapterName;
  // selectedVideoId.value = chapterList[index].videoId;

  // log(chapterList.toString());

  // videoController.loadVideo(selectedVideoId.value);

  // Scroll to the selected chapter so it appears at the top of the list
  // double offset = (index * 65.0).clamp(0.0, scrollController.position.maxScrollExtent);
  // scrollController.animateTo(
  //   offset,
  //   duration: const Duration(milliseconds: 300),
  //   curve: Curves.easeInOut,
  // );
}

}
