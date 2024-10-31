import 'dart:developer';

import 'package:app_design/src/presentation/screens/home/home.dart';
import 'package:app_design/src/presentation/screens/notes/notes.dart';
import 'package:app_design/src/presentation/screens/doubts/doubts.dart';
import 'package:app_design/src/presentation/screens/settings/settings.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  onInit() {
    super.onInit();

  }
  RxList courseList = [
    {
      'courseName': "Python",
      'logo': 'assets/images/python_logo.jpg',
      'rate': '2500/-'
    },
    {
      'courseName': "Flutter",
      'logo': 'assets/images/flutter_logo.png',
      'rate': '2700/-'
    },
    {'courseName': "PHP", 'logo': 'assets/images/php.png', 'rate': '2000/-'},
    {
      'courseName': "Django",
      'logo': 'assets/images/django_logo.jpg',
      'rate': '2900/-'
    }
  ].obs;

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
  
  onItemTapped(int index) {
    log("Selected index = $index");
  }
}
