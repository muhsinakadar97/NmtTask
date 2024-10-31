import 'package:get/get.dart';

class CourseOverviewController extends GetxController {
  RxList sectionListPython = [
    {
      'sectionNo': "1",
      "sectionName": "Introduction to Python",
      "chapters": [
        {
          'sectionNo': "1",
          'chapterNo': '1',
          "sectionName": "Introduction to Python",
          'chapterName': "Features of Python",
          "category": "Free",
          'video_id': 'v30luplckWk'
        },
        {
          'sectionNo': "1",
          'chapterNo': '2',
          "sectionName": "Introduction to Python",
          'chapterName': "History of Python",
          "category": "Premium",
          'video_id': 'NcDnmpvQ-Fk'
        },
        {
          'sectionNo': "1",
          'chapterNo': '3',
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
          'sectionNo': "2",
          'chapterNo': '4',
          "sectionName": "Installation of Python",
          'chapterName': "Installation on Windows",
          "category": "Free",
          'video_id': 'vbi-2DlDkUw'
        },
        {
          'sectionNo': "2",
          'chapterNo': '5',
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
          'sectionNo': "3",
          'chapterNo': '6',
          "sectionName": "Variables and Datatypes",
          'chapterName': "Numbers",
          "category": "Free",
          'video_id': 'vbi-2DlDkUw'
        },
        {
          'sectionNo': "3",
          'chapterNo': '7',
          "sectionName": "Variables and Datatypes",
          'chapterName': "Boolean",
          "category": "Free",
          'video_id': 'vbi-2DlDkUw'
        },
        {
          'sectionNo': "3",
          'chapterNo': '8',
          "sectionName": "Variables and Datatypes",
          'chapterName': "Strings",
          "category": "Free",
          'video_id': 'vbi-2DlDkUw'
        },
        {
          'sectionNo': "3",
          'chapterNo': '9',
          "sectionName": "Variables and Datatypes",
          'chapterName': "List",
          "category": "Locked",
          'video_id': 'vbi-2DlDkUw'
        },
        {
          'sectionNo': "3",
          'chapterNo': '10',
          "sectionName": "Variables and Datatypes",
          'chapterName': "Tuple",
          "category": "Locked",
          'video_id': 'vbi-2DlDkUw'
        },
        {
          'sectionNo': "3",
          'chapterNo': '11',
          "sectionName": "Variables and Datatypes",
          'chapterName': "Dictionary",
          "category": "Premium",
          'video_id': 'vbi-2DlDkUw'
        },
        {
          'sectionNo': "3",
          'chapterNo': '12',
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
          'sectionNo': "4",
          'chapterNo': '13',
          "sectionName": "Keywords and Literals",
          'chapterName': "Keywords in Python",
          "category": "Free",
          'video_id': 'v30luplckWk'
        },
        {
          'sectionNo': "4",
          'chapterNo': '14',
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
          'sectionNo': "5",
          'chapterNo': '15',
          "sectionName": "Operators and Comments",
          'chapterName': "Arithmetic operators",
          "category": "Free",
          'video_id': 'v30luplckWk'
        },
        {
          'sectionNo': "5",
          'chapterNo': '16',
          "sectionName": "Operators and Comments",
          'chapterName': "Comparison operators",
          "category": "Free",
          'video_id': 'v30luplckWk'
        },
        {
          'sectionNo': "5",
          'chapterNo': '17',
          "sectionName": "Operators and Comments",
          'chapterName': "Assignment operators",
          "category": "Locked",
          'video_id': 'v30luplckWk'
        },
        {
          'sectionNo': "5",
          'chapterNo': '18',
          "sectionName": "Operators and Comments",
          'chapterName': "Logical operators",
          "category": "Locked",
          'video_id': 'NcDnmpvQ-Fk'
        },
        {
          'sectionNo': "5",
          'chapterNo': '19',
          "sectionName": "Operators and Comments",
          'chapterName': "Bitwise operators",
          "category": "Locked",
          'video_id': 'NcDnmpvQ-Fk'
        },
        {
          'sectionNo': "5",
          'chapterNo': '20',
          "sectionName": "Operators and Comments",
          'chapterName': "Membership operators",
          "category": "Premium",
          'video_id': 'NcDnmpvQ-Fk'
        },
        {
          'sectionNo': "5",
          'chapterNo': '21',
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
          'sectionNo': "1",
          'chapterNo': '1',
          "sectionName": "Introduction to Flutter",
          'chapterName': "Features of Flutter",
          "category": "Free",
          'video_id': 'NcDnmpvQ-Fk'
        },
        {
          'sectionNo': "1",
          'chapterNo': '2',
          "sectionName": "Introduction to Flutter",
          'chapterName': "History of Flutter",
          "category": "Locked",
          'video_id': 'NcDnmpvQ-Fk'
        },
        {
          'sectionNo': "1",
          'chapterNo': '3',
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
          'sectionNo': "2",
          'chapterNo': '4',
          "sectionName": "Installation of Flutter",
          'chapterName': "Installation on Windows",
          "category": "Free",
          'video_id': 'v30luplckWk'
        },
        {
          'sectionNo': "2",
          'chapterNo': '5',
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
          'sectionNo': "3",
          'chapterNo': '6',
          "sectionName": "Variables and Datatypes",
          'chapterName': "Numbers",
          "category": "Free",
          'video_id': 'v30luplckWk'
        },
        {
          'sectionNo': "3",
          'chapterNo': '7',
          "sectionName": "Variables and Datatypes",
          'chapterName': "Boolean",
          "category": "Free",
          'video_id': 'v30luplckWk'
        },
        {
          'sectionNo': "3",
          'chapterNo': '8',
          "sectionName": "Variables and Datatypes",
          'chapterName': "Strings",
          "category": "Locked",
          'video_id': 'v30luplckWk'
        },
        {
          'sectionNo': "3",
          'chapterNo': '9',
          "sectionName": "Variables and Datatypes",
          'chapterName': "List",
          "category": "Locked",
          'video_id': 'v30luplckWk'
        },
        {
          'sectionNo': "3",
          'chapterNo': '10',
          "sectionName": "Variables and Datatypes",
          'chapterName': "Tuple",
          "category": "Locked",
          'video_id': 'v30luplckWk'
        },
        {
          'sectionNo': "3",
          'chapterNo': '11',
          "sectionName": "Variables and Datatypes",
          'chapterName': "Dictionary",
          "category": "Premium",
          'video_id': 'v30luplckWk'
        },
        {
          'sectionNo': "3",
          'chapterNo': '12',
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
          'sectionNo': "4",
          'chapterNo': '13',
          "sectionName": "Keywords and Literals",
          'chapterName': "Keywords in Flutter",
          "category": "Free",
          'video_id': 'v30luplckWk'
        },
        {
          'sectionNo': "4",
          'chapterNo': '14',
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
          'sectionNo': "5",
          'chapterNo': '15',
          "sectionName": "Operators and Comments",
          'chapterName': "Arithmetic operators",
          "category": "Free",
          'video_id': 'v30luplckWk'
        },
        {
          'sectionNo': "5",
          'chapterNo': '16',
          "sectionName": "Operators and Comments",
          'chapterName': "Comparison operators",
          "category": "Free",
          'video_id': 'v30luplckWk'
        },
        {
          'sectionNo': "5",
          'chapterNo': '17',
          "sectionName": "Operators and Comments",
          'chapterName': "Assignment Operators",
          "category": "Free",
          'video_id': 'v30luplckWk'
        },
        {
          'sectionNo': "5",
          'chapterNo': '18',
          "sectionName": "Operators and Comments",
          'chapterName': "Logical Operators",
          "category": "Locked",
          'video_id': 'v30luplckWk'
        },
        {
          'sectionNo': "5",
          'chapterNo': '19',
          "sectionName": "Operators and Comments",
          'chapterName': "Bitwise Operators",
          "category": "Locked",
          'video_id': 'v30luplckWk'
        },
        {
          'sectionNo': "5",
          'chapterNo': '20',
          "sectionName": "Operators and Comments",
          'chapterName': "Membership Operators",
          "category": "Locked",
          'video_id': 'v30luplckWk'
        },
        {
          'sectionNo': "5",
          'chapterNo': '21',
          "sectionName": "Operators and Comments",
          'chapterName': "Identity Operators",
          "category": "Premium",
          'video_id': 'v30luplckWk'
        },
        {
          'sectionNo': "5",
          'chapterNo': '22',
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
          'sectionNo': "1",
          'chapterNo': '1',
          "sectionName": "Introduction to PHP",
          'chapterName': "Features of PHP",
          "category": "Free",
          'video_id': 'v30luplckWk'
        },
        {
          'sectionNo': "1",
          'chapterNo': '2',
          "sectionName": "Introduction to PHP",
          'chapterName': "History of PHP",
          "category": "Premium",
          'video_id': 'v30luplckWk'
        },
        {
          'sectionNo': "1",
          'chapterNo': '3',
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
          'sectionNo': "2",
          'chapterNo': '4',
          "sectionName": "Operators and Comments",
          'chapterName': "Arithmetic operators",
          "category": "Free",
          'video_id': 'v30luplckWk'
        },
        {
          'sectionNo': "2",
          'chapterNo': '5',
          "sectionName": "Operators and Comments",
          'chapterName': "Comparison operators",
          "category": "Free",
          'video_id': 'v30luplckWk'
        },
        {
          'sectionNo': "2",
          'chapterNo': '6',
          "sectionName": "Operators and Comments",
          'chapterName': "Assignment Operators",
          "category": "Free",
          'video_id': 'v30luplckWk'
        },
        {
          'sectionNo': "2",
          'chapterNo': '7',
          "sectionName": "Operators and Comments",
          'chapterName': "Logical Operators",
          "category": "Locked",
          'video_id': 'v30luplckWk'
        },
        {
          'sectionNo': "2",
          'chapterNo': '8',
          "sectionName": "Operators and Comments",
          'chapterName': "Bitwise Operators",
          "category": "Locked",
          'video_id': 'v30luplckWk'
        },
        {
          'sectionNo': "2",
          'chapterNo': '9',
          "sectionName": "Operators and Comments",
          'chapterName': "Membership Operators",
          "category": "Locked",
          'video_id': 'v30luplckWk'
        },
        {
          'sectionNo': "2",
          'chapterNo': '10',
          "sectionName": "Operators and Comments",
          'chapterName': "Identity Operators",
          "category": "Premium",
          'video_id': 'v30luplckWk'
        },
        {
          'sectionNo': "2",
          'chapterNo': '11',
          "sectionName": "Operators and Comments",
          'chapterName': "Arithmetic Operators",
          "category": "Premium",
          'video_id': 'v30luplckWk'
        },
      ]
    },
  ].obs;
  RxString selectedChapterName = "".obs;
  RxString selectedChapterVideoUrl = "".obs;
  RxString selectedSectionName = ''.obs;
  RxList selectedSectionChapterList = [].obs;
}


