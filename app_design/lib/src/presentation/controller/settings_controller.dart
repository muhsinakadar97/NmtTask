import 'package:app_design/src/presentation/screens/home/home.dart';
import 'package:app_design/src/presentation/screens/notes/notes.dart';
import 'package:app_design/src/presentation/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  Future<bool> onWillPop(BuildContext context) async {
    return false;
  }
}
