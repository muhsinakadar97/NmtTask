import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListDemoController extends GetxController {
  RxList<Map<String, String>> chapters = [
    {'chapterNo': '1', 'chapterName': 'Introduction',},
    {'chapterNo': '2', 'chapterName': 'Features',},
    {'chapterNo': '3', 'chapterName': 'Applications',},
    {'chapterNo': '4', 'chapterName': 'Datatypes',},
    {'chapterNo': '5', 'chapterName': 'Operators',},
    {'chapterNo': '6', 'chapterName': 'Control Statements',},
    {'chapterNo': '7', 'chapterName': 'Loops',},
    {'chapterNo': '8', 'chapterName': 'Decision Making Statements',},
    {'chapterNo': '9', 'chapterName': 'Oops 1',},
    {'chapterNo': '10', 'chapterName': 'Oops 2',},
    {'chapterNo': '11', 'chapterName': 'Oops 3',},
    {'chapterNo': '12', 'chapterName': 'Oops 4',},
    {'chapterNo': '13', 'chapterName': 'Oops 5',},
    {'chapterNo': '14', 'chapterName': 'Exception Handling',},
    {'chapterNo': '15', 'chapterName': 'Pickling & Unpickling',},
    {'chapterNo': '16', 'chapterName': 'File Handling',},
  ].obs;

  final List<String> items = List<String>.generate(100, (i) => "Item $i");
  
  final ScrollController scrollController = ScrollController();
  RxInt selectedIndex = 0.obs;

  RxString selectedItemName = "".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    log("Controller initialized");
  }

  void onItemTapped(int index) {
    selectedIndex.value = index;
    selectedItemName.value = chapters[index]['chapterName']!;
    log("Selected Item => ${chapters[selectedIndex.value]['chapterName']}");
    scrollController.animateTo(
      index * 56.0,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
