import "dart:developer";
import "dart:io";

import "package:app_design/src/data/models/course.dart";
import "package:app_design/src/presentation/screens/course_overview/course_overview.dart";
import "package:app_design/src/presentation/screens/doubts/doubts.dart";
import "package:app_design/src/presentation/screens/home/home.dart";
import "package:app_design/src/presentation/screens/notes/notes.dart";
import "package:app_design/src/presentation/screens/settings/settings.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:google_fonts/google_fonts.dart";

class HomeController extends GetxController {
  RxList<Course> courses = RxList([]);
  @override
  onInit() {
    super.onInit();
    fetchCourses();
  }

  List<Map<String, dynamic>> courseList = [
    {
      "courseName": "Python",
      "logo": "assets/images/python_logo.jpg",
      "rate": "2500/-"
    },
    {
      "courseName": "Flutter",
      "logo": "assets/images/flutter_logo.png",
      "rate": "2700/-"
    },
    {"courseName": "PHP", "logo": "assets/images/php.png", "rate": "2000/-"},
    {
      "courseName": "Django",
      "logo": "assets/images/django_logo.png",
      "rate": "2900/-"
    }
  ];

  Future fetchCourses() async {
    courses.value = (courseList as List<dynamic>).map((e) {
      return Course.fromJson(e);
    }).toList();
  }

  RxString selectedItemName = "".obs;
  RxString selectedImage = "".obs;
  RxInt currentIndex = 0.obs;

  int selectedIndex = 0;

  final pages = [
    const Home(),
     Notes(),
     Doubts(),
    const Settings(),
  ];

  void onCourseTapped(int index) {
    Course course = courses[index];
    log("Selected Item => ${course.courseName}");
    selectedItemName.value = course.courseName;
    selectedImage.value = course.logo;
    currentIndex.value = index;
    Get.to(const CourseOverview());
  }

  Future<bool> onWillPop(BuildContext context) async {
    
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: Colors.blueGrey[50],
            title: Text(
              "Are you sure?",
              style: GoogleFonts.raleway(fontWeight: FontWeight.bold),
            ),
            content: Text(
              "Do you want to exit the app?",
              style: GoogleFonts.raleway(fontWeight: FontWeight.bold),
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text("No",
                      style: TextStyle(color: Colors.blueGrey))),
              TextButton(
                onPressed: () => exit(0),
                child:
                    const Text("Yes", style: TextStyle(color: Colors.blueGrey)),
              ),
            ],
          ),
        )) ??
        false;

      
  }
}
