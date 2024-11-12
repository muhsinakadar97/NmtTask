import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextDemoController extends GetxController {
  var text = ''.obs;

  TextEditingController textController = TextEditingController();


  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }
}
