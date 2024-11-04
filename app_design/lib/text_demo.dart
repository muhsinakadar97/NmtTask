import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'text_demo_controller.dart';

class TextDemo extends StatelessWidget {
  const TextDemo({super.key});

  @override
  Widget build(BuildContext context) {
    TextDemoController textDemoController = Get.put(TextDemoController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Text Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: textDemoController.textController,
              onChanged: (text) {
                textDemoController.text.value = text;
              },
            ),
            Obx(() => Text(
              textDemoController.text.value, // Use the observable variable
              style: TextStyle(color: Colors.black),
            )),
            ElevatedButton(
              onPressed: () {
                log("Text => ${textDemoController.text.value}"); // Log the observable value
              },
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
