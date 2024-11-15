import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotesController extends GetxController {
  final List<Map<String, String>> notesList = const [
    {"image": "assets/images/pdf.png", "topicName": "Introduction to Python"},
    {"image": "assets/images/pdf.png", "topicName": "Advantages of Python"},
    {"image": "assets/images/pdf.png", "topicName": "Datatypes in Python"},
    {"image": "assets/images/pdf.png", "topicName": "OOPS in Python"},
    {"image": "assets/images/pdf.png", "topicName": "File Handling in Python"},
  ];
 Future<bool> onWillPop(BuildContext context) async {
    return false;
  }
}