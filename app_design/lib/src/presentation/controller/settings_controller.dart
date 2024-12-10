import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  // back press
  Future<bool> onWillPop(BuildContext context) async {
    return false;
  }
}
