import 'dart:developer';

import 'package:app_design/src/presentation/controller/course_overview_controller.dart';
import 'package:app_design/src/presentation/controller/video_controller.dart';
import 'package:app_design/src/presentation/screens/course_overview/course_overview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NextVideoController extends GetxController {
  final ScrollController scrollController = ScrollController();
  VideoController videoController = Get.put(VideoController());
  RxList sectionListPython = [
    {
      'sectionNo': "1",
      "sectionName": "Introduction to Python",
      "chapters": [
        {
          "sectionName": "Introduction to Python",
          'chapterName': "Features of Python",
          "category": "Free",
          'video_id': 'v30luplckWk'
        },
        {
          "sectionName": "Introduction to Python",
          'chapterName': "History of Python",
          "category": "Premium",
          'video_id': 'NcDnmpvQ-Fk'
        },
        {
          "sectionName": "Introduction to Python",
          'chapterName': "Applications of Python",
          "category": "Locked",
          'video_id': 'vbi-2DlDkUw'
        },
      ]
    },
    {
      'sectionNo': "2",
      "sectionName": "Installation of Python",
      "chapters": [
        {
          "sectionName": "Installation of Python",
          'chapterName': "Installation on Windows",
          "category": "Free",
          'video_id': 'vbi-2DlDkUw'
        },
        {
          "sectionName": "Installation of Python",
          'chapterName': "Installation in MacOS",
          "category": "Locked",
          'video_id': 'vbi-2DlDkUw'
        },
      ]
    },
    {
      'sectionNo': "3",
      "sectionName": "Variables and Datatypes",
      "chapters": [
        {
          "sectionName": "Variables and Datatypes",
          'chapterName': "Numbers",
          "category": "Free",
          'video_id': 'vbi-2DlDkUw'
        },
        {
          "sectionName": "Variables and Datatypes",
          'chapterName': "Boolean",
          "category": "Free",
          'video_id': 'vbi-2DlDkUw'
        },
        {
          "sectionName": "Variables and Datatypes",
          'chapterName': "Strings",
          "category": "Free",
          'video_id': 'vbi-2DlDkUw'
        },
        {
          "sectionName": "Variables and Datatypes",
          'chapterName': "List",
          "category": "Locked",
          'video_id': 'vbi-2DlDkUw'
        },
        {
          "sectionName": "Variables and Datatypes",
          'chapterName': "Tuple",
          "category": "Locked",
          'video_id': 'vbi-2DlDkUw'
        },
        {
          "sectionName": "Variables and Datatypes",
          'chapterName': "Dictionary",
          "category": "Premium",
          'video_id': 'vbi-2DlDkUw'
        },
        {
          "sectionName": "Variables and Datatypes",
          'chapterName': "Set",
          "category": "Premium",
          'video_id': 'vbi-2DlDkUw'
        },
      ],
    },
    {
      'sectionNo': "4",
      "sectionName": "Keywords and Literals",
      "chapters": [
        {
          "sectionName": "Keywords and Literals",
          'chapterName': "Keywords in Python",
          "category": "Free",
          'video_id': 'v30luplckWk'
        },
        {
          "sectionName": "Keywords and Literals",
          'chapterName': "Literals in Python",
          "category": "Free",
          'video_id': 'v30luplckWk'
        },
      ]
    },
    {
      'sectionNo': "5",
      "sectionName": "Operators and Comments",
      "chapters": [
        {
          "sectionName": "Operators and Comments",
          'chapterName': "Arithmetic operators",
          "category": "Free",
          'video_id': 'v30luplckWk'
        },
        {
          "sectionName": "Operators and Comments",
          'chapterName': "Comparison operators",
          "category": "Free",
          'video_id': 'v30luplckWk'
        },
        {
          "sectionName": "Operators and Comments",
          'chapterName': "Assignment operators",
          "category": "Locked",
          'video_id': 'v30luplckWk'
        },
        {
          "sectionName": "Operators and Comments",
          'chapterName': "Logical operators",
          "category": "Locked",
          'video_id': 'NcDnmpvQ-Fk'
        },
        {
          "sectionName": "Operators and Comments",
          'chapterName': "Bitwise operators",
          "category": "Locked",
          'video_id': 'NcDnmpvQ-Fk'
        },
        {
          "sectionName": "Operators and Comments",
          'chapterName': "Membership operators",
          "category": "Premium",
          'video_id': 'NcDnmpvQ-Fk'
        },
        {
          "sectionName": "Operators and Comments",
          'chapterName': "Identity operators",
          "category": "Premium",
          'video_id': 'NcDnmpvQ-Fk'
        },
      ]
    },
  ].obs;
  RxList sectionListFlutter = [
    {
      'sectionNo': "1",
      "sectionName": "Introduction to Flutter",
      "chapters": [
        {
          "sectionName": "Introduction to Flutter",
          'chapterName': "Features of Flutter",
          "category": "Free",
          'video_id': 'NcDnmpvQ-Fk'
        },
        {
          "sectionName": "Introduction to Flutter",
          'chapterName': "History of Flutter",
          "category": "Locked",
          'video_id': 'NcDnmpvQ-Fk'
        },
        {
          "sectionName": "Introduction to Flutter",
          'chapterName': "Applications of Flutter",
          "category": "Premium",
          'video_id': 'v30luplckWk'
        },
      ]
    },
    {
      'sectionNo': "2",
      "sectionName": "Installation of Flutter",
      "chapters": [
        {
          "sectionName": "Installation of Flutter",
          'chapterName': "Installation on Windows",
          "category": "Free",
          'video_id': 'v30luplckWk'
        },
        {
          "sectionName": "Installation of Flutter",
          'chapterName': "Installation in MacOS",
          "category": "Free",
          'video_id': 'v30luplckWk'
        },
      ]
    },
    {
      'sectionNo': "3",
      "sectionName": "Variables and Datatypes",
      "chapters": [
        {
          "sectionName": "Variables and Datatypes",
          'chapterName': "Numbers",
          "category": "Free",
          'video_id': 'v30luplckWk'
        },
        {
          "sectionName": "Variables and Datatypes",
          'chapterName': "Boolean",
          "category": "Free",
          'video_id': 'v30luplckWk'
        },
        {
          "sectionName": "Variables and Datatypes",
          'chapterName': "Strings",
          "category": "Locked",
          'video_id': 'v30luplckWk'
        },
        {
          "sectionName": "Variables and Datatypes",
          'chapterName': "List",
          "category": "Locked",
          'video_id': 'v30luplckWk'
        },
        {
          "sectionName": "Variables and Datatypes",
          'chapterName': "Tuple",
          "category": "Locked",
          'video_id': 'v30luplckWk'
        },
        {
          "sectionName": "Variables and Datatypes",
          'chapterName': "Dictionary",
          "category": "Premium",
          'video_id': 'v30luplckWk'
        },
        {
          "sectionName": "Variables and Datatypes",
          'chapterName': "Set",
          "category": "Premium",
          'video_id': 'v30luplckWk'
        },
      ]
    },
    {
      'sectionNo': "4",
      "sectionName": "Keywords and Literals",
      'chapters': [
        {
          "sectionName": "Keywords and Literals",
          'chapterName': "Keywords in Flutter",
          "category": "Free",
          'video_id': 'v30luplckWk'
        },
        {
          "sectionName": "Keywords and Literals",
          'chapterName': "Literals in Flutter",
          "category": "Locked",
          'video_id': 'v30luplckWk'
        },
      ]
    },
    {
      'sectionNo': "5",
      "sectionName": "Operators and Comments",
      "chapters": [
        {
          "sectionName": "Operators and Comments",
          'chapterName': "Arithmetic operators",
          "category": "Free",
          'video_id': 'v30luplckWk'
        },
        {
          "sectionName": "Operators and Comments",
          'chapterName': "Comparison operators",
          "category": "Free",
          'video_id': 'v30luplckWk'
        },
        {
          "sectionName": "Operators and Comments",
          'chapterName': "Assignment Operators",
          "category": "Free",
          'video_id': 'v30luplckWk'
        },
        {
          "sectionName": "Operators and Comments",
          'chapterName': "Logical Operators",
          "category": "Locked",
          'video_id': 'v30luplckWk'
        },
        {
          "sectionName": "Operators and Comments",
          'chapterName': "Bitwise Operators",
          "category": "Locked",
          'video_id': 'v30luplckWk'
        },
        {
          "sectionName": "Operators and Comments",
          'chapterName': "Membership Operators",
          "category": "Locked",
          'video_id': 'v30luplckWk'
        },
        {
          "sectionName": "Operators and Comments",
          'chapterName': "Identity Operators",
          "category": "Premium",
          'video_id': 'v30luplckWk'
        },
        {
          "sectionName": "Operators and Comments",
          'chapterName': "Arithmetic Operators",
          "category": "Premium",
          'video_id': 'v30luplckWk'
        },
      ]
    },
  ].obs;
  RxList sectionListPhp = [
    {
      'sectionNo': "1",
      "sectionName": "Introduction to PHP",
      "chapters": [
        {
          "sectionName": "Introduction to PHP",
          'chapterName': "Features of PHP",
          "category": "Free",
          'video_id': 'v30luplckWk'
        },
        {
          "sectionName": "Introduction to PHP",
          'chapterName': "History of PHP",
          "category": "Premium",
          'video_id': 'v30luplckWk'
        },
        {
          "sectionName": "Introduction to PHP",
          'chapterName': "Applications of PHP",
          "category": "Locked",
          'video_id': 'v30luplckWk'
        },
      ]
    },
    {
      'sectionNo': "2",
      "sectionName": "Operators and Comments",
      "chapters": [
        {
          "sectionName": "Operators and Comments",
          'chapterName': "Arithmetic operators",
          "category": "Free",
          'video_id': 'v30luplckWk'
        },
        {
          "sectionName": "Operators and Comments",
          'chapterName': "Comparison operators",
          "category": "Free",
          'video_id': 'v30luplckWk'
        },
        {
          "sectionName": "Operators and Comments",
          'chapterName': "Assignment Operators",
          "category": "Free",
          'video_id': 'v30luplckWk'
        },
        {
          "sectionName": "Operators and Comments",
          'chapterName': "Logical Operators",
          "category": "Locked",
          'video_id': 'v30luplckWk'
        },
        {
          "sectionName": "Operators and Comments",
          'chapterName': "Bitwise Operators",
          "category": "Locked",
          'video_id': 'v30luplckWk'
        },
        {
          "sectionName": "Operators and Comments",
          'chapterName': "Membership Operators",
          "category": "Locked",
          'video_id': 'v30luplckWk'
        },
        {
          "sectionName": "Operators and Comments",
          'chapterName': "Identity Operators",
          "category": "Premium",
          'video_id': 'v30luplckWk'
        },
        {
          "sectionName": "Operators and Comments",
          'chapterName': "Arithmetic Operators",
          "category": "Premium",
          'video_id': 'v30luplckWk'
        },
      ]
    },
  ].obs;

  RxInt selectedChapterIndex = (-1).obs;
  RxString selectedVideoId = "".obs;

 @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Automatically scroll to the desired chapter on load
      if (selectedChapterIndex.value >= 0) {
        scrollToSelectedIndex(selectedChapterIndex.value);
      }
    });
  }

  void scrollToSelectedIndex(int index) {
    double offset = (index * 65.0).clamp(
        0.0,
        scrollController.position.maxScrollExtent); // Adjust height as needed

    scrollController.jumpTo(offset); // Use jumpTo for immediate scrolling
  }

  void onItemTapped(int index) {
    selectedChapterIndex.value = index;

    // Calculate the offset to scroll to the selected item
    double offset = (index * 65.0).clamp(
        0.0,
        scrollController.position.maxScrollExtent); // 65.0 is the height of each item

    scrollController.animateTo(
      offset,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );

    videoController.loadVideo(sectionListPython[selectedChapterIndex.value]['chapters'][index]['video_id']);

   

    log("Selected Item Name => ${sectionListPython[selectedChapterIndex.value]['chapters'][index]['chapterName']}");
    log("Selected Item Video Id => ${sectionListPython[selectedChapterIndex.value]['chapters'][index]['video_id']}");
  }
}

