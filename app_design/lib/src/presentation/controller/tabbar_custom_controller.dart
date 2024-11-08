import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabbarSecondController extends GetxController {
  final PageController pageController = PageController();
  RxInt selectedIndex = 0.obs;
  RxBool isTapped = false.obs;

  RxList<bool> isSelectedList = List.generate(10, (index) => false).obs;

  // void onTabSelected(int index) {
  //   selectedIndex.value = index;
  //   pageController.animateToPage(
  //     index,
  //     duration: Duration(milliseconds: 300),
  //     curve: Curves.easeInOut,
  //   );
  // }

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

  void onItemTap(int index) {
      log("Item Tapped => $index");
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
