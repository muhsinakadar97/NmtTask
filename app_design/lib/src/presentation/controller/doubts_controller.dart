import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DoubtsController extends GetxController {
  var doubtText = ''.obs; // Observable text
  TextEditingController doubtTextController = TextEditingController();
  FocusNode focusNode = FocusNode();
  RxBool isDoubtEmpty = true.obs;

  void submitDoubt(BuildContext context) {
    doubtText.value = doubtTextController.text;
    log("Your Doubt => ${doubtText.value}");
    isDoubtEmpty.value = false;
    showBottomSheet(context); // Call the method to show the bottom sheet
  }

  // Method to show the bottom sheet
  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 80,
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Text("Your doubt has been submitted. We will check it soon.", style: GoogleFonts.raleway(fontWeight: FontWeight.bold, color: Colors.blueGrey[900]),),
          ),
        );
      },
    );
  }

Future<bool> onWillPop(BuildContext context) async {
    return false;
  }

  @override
  void onClose() {
    // Dispose of controllers
    doubtTextController.dispose();
    focusNode.dispose();
    super.onClose();
  }
}
