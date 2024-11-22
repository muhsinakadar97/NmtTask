import 'package:app_design/src/data/models/chapter.dart';
import 'package:app_design/src/data/models/section.dart';
import 'package:app_design/src/presentation/controller/course_overview_controller.dart';
import 'package:app_design/src/presentation/controller/video_controller.dart';
import 'package:app_design/src/presentation/screens/video/video.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NextVideoController extends GetxController {
  final VideoController videoController = Get.put(VideoController());
  final CourseOverviewController courseOverviewController = Get.put(CourseOverviewController());

  RxInt selectedChapterIndex = (0).obs;
  RxString selectedVideoId = "".obs;
  RxString selectedChapterName = "".obs;

  late Chapter selectedChapter;

  RxBool isVideoPlaying = false.obs; // State to toggle between video and chapter list view

  RxList<Chapter> chapters = RxList([]);

  // Global ScrollController
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    fetchChaptersForSections(courseOverviewController.selectedSection);
  }

  void onItemTapped(BuildContext context, int index) {
    selectedChapter = chapters[index];
    selectedChapterIndex.value = index;

    selectedVideoId.value = selectedChapter.videoId;
    selectedChapterName.value = selectedChapter.chapterName;

    // Toggle state to show the video player
    isVideoPlaying.value = true;
    closeVideoPlayer();

   Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => Video(videoIdForLoading: selectedChapter.videoId),
  ),
);


    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(
    //     builder: (BuildContext context) => Video(videoIdForLoading: selectedChapter.videoId),
    //   ),
    // );
    scrollToSelectedIndex(selectedChapterIndex.value);
  }

  void fetchChaptersForSections(Section section) {
    chapters.assignAll(section.chapters);
  }

  void closeVideoPlayer() {
    // Set video playing state to false when you want to return to the list view
    isVideoPlaying.value = false;
  }

  /// Scroll to the selected chapter index
  void scrollToSelectedIndex(int index) {
    if (scrollController.hasClients && selectedChapterIndex.value < chapters.length) {
      scrollController.animateTo(
        selectedChapterIndex.value * 70.0, // Assuming each chapter item height is ~70. Adjust as needed.
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
}
