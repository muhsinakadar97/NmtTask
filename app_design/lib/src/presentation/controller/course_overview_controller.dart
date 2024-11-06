import 'dart:developer';

import 'package:app_design/src/data/models/chapter.dart';
import 'package:app_design/src/data/models/section.dart';
import 'package:app_design/src/presentation/controller/home_controller.dart';
import 'package:get/get.dart';

class CourseOverviewController extends GetxController {
  HomeController homeController = Get.put(HomeController());
  RxList<Section> sections = RxList([]);

  @override
  void onInit() {
    super.onInit();
    fetchSections();
  }

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
  RxList sectionListDjango = [].obs;
  // RxList sectionListDjango = [
  //  {
  //   'sectionNo': "1",
  //   "sectionName": "Introduction to Django",
  //   "chapters": [
  //     {
  //       'sectionNo': "1",
  //       'chapterNo': '1',
  //       "sectionName": "MVC and MVT",
  //       'chapterName': "MVC Architecture",
  //       "category": "Free",
  //       'video_id': 'v30luplckWk'
  //     },
  //       {
  //         'sectionNo': "1",
  //         'chapterNo': '2',
  //         "sectionName": "MVC and MVT",
  //         'chapterName': "Pros and cons of MVC",
  //         "category": "Free",
  //         'video_id': 'v30luplckWk'
  //       },
  //       {
  //         'sectionNo': "1",
  //         'chapterNo': '3',
  //         "sectionName": "MVC and MVT",
  //         'chapterName': "MVT Architecture",
  //         "category": "Locked",
  //         'video_id': 'v30luplckWk'
  //       },
  //     ]
  //   },
  //   {
  //     'sectionNo': "2",
  //     "sectionName": "Introduction to Templates",
  //     "chapters": [
  //       {
  //         'sectionNo': "1",
  //         'chapterNo': '1',
  //         "sectionName": "Introduction to Templates",
  //         'chapterName': "Templates - Introduction",
  //         "category": "Free",
  //         'video_id': 'v30luplckWk'
  //       },
  //       {
  //         'sectionNo': "1",
  //         'chapterNo': '2',
  //         "sectionName": "Introduction to Templates",
  //         'chapterName': "Setting templates",
  //         "category": "Free",
  //         'video_id': 'v30luplckWk'
  //       },
  //       {
  //         'sectionNo': "1",
  //         'chapterNo': '3',
  //         "sectionName": "Introduction to Templates",
  //         'chapterName': "Template Inheritance",
  //         "category": "Locked",
  //         'video_id': 'v30luplckWk'
  //       },
  //     ]
  //   },
  // ].obs;
  RxString selectedChapterName = "".obs;
  RxString selectedChapterVideoUrl = "".obs;
  RxString selectedSectionName = ''.obs;
  RxList selectedSectionChapterList = [].obs;
  RxBool isSectionEmpty = false.obs;

  void fetchSections() {
    // Check the selected course name and assign the appropriate section list
    switch (homeController.selectedItemName.value) {
      case 'Python':
        sections.value = sectionListPython.map((sectionMap) {
          return Section.fromMap(sectionMap as Map<String, dynamic>);
        }).toList();
        break;
      case 'Flutter':
        sections.value = sectionListFlutter.map((sectionMap) {
          return Section.fromMap(sectionMap as Map<String, dynamic>);
        }).toList();
        break;
      case 'PHP':
        sections.value = sectionListPhp.map((sectionMap) {
          return Section.fromMap(sectionMap as Map<String, dynamic>);
        }).toList();
        break;
      case 'Django':
        sections.value = sectionListDjango.map((sectionMap) {
          return Section.fromMap(sectionMap as Map<String, dynamic>);
        }).toList();
        break;
      default:
        sections.value =
            []; // If no valid course is selected, clear the sections
        break;
    }
    var sectionNames =
        sections.map((section) => section.sectionName).toList();
    
    log("Section Names: $sectionNames");
  }

  List<Chapter> getSelectedSectionChapterList() {
    var selectedSection = sections.firstWhere(
      (section) => section.sectionName == selectedSectionName.value,
      orElse: () => Section(sectionNo: '', sectionName: '', chapters: []),
    );
    return selectedSection.chapters;
  }

  int getSectionListLength(String courseName) {
    if (courseName == "Python") {
      return sectionListPython.length;
    } else if (courseName == "Flutter") {
      return sectionListFlutter.length;
    } else if (courseName == "PHP") {
      return sectionListPhp.length;
    } else if (courseName == "Django") {
      return sectionListDjango.length;
    }
    return 0; // Default case if courseName is unknown
  }

   void fetchChapters() {
    // Check the selected course name and assign the appropriate section list
    switch (homeController.selectedItemName.value) {
      case 'Python':
        sections.value = sectionListPython.map((sectionMap) {
          return Section.fromMap(sectionMap as Map<String, dynamic>);
        }).toList();
        break;
      case 'Flutter':
        sections.value = sectionListFlutter.map((sectionMap) {
          return Section.fromMap(sectionMap as Map<String, dynamic>);
        }).toList();
        break;
      case 'PHP':
        sections.value = sectionListPhp.map((sectionMap) {
          return Section.fromMap(sectionMap as Map<String, dynamic>);
        }).toList();
        break;
      case 'Django':
        sections.value = sectionListDjango.map((sectionMap) {
          return Section.fromMap(sectionMap as Map<String, dynamic>);
        }).toList();
        break;
      default:
        sections.value =
            []; // If no valid course is selected, clear the sections
        break;
    }
    var sectionNames =
        sections.map((section) => section.sectionName).toList();
    
    log("Section Names: $sectionNames");
  }


//   // Helper method to get section count based on course name
//   int getSectionListLength(String courseName) {
//     switch (courseName) {
//       case "Python":
//         return sectionListPython.length;
//       case "Flutter":
//         return sectionListFlutter.length;
//       case "PHP":
//         return sectionListPhp.length;
//       case "Django":
//         return sectionListDjango.length;
//       default:
//         return 0;
//     }
//   }
// }
}
