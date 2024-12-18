import 'dart:developer';

import 'package:app_design/src/presentation/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    SplashController splashController = Get.find<SplashController>();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("LoginPage"),
            ElevatedButton(
                onPressed: () {
                  log("button pressed");
                  splashController.saveUsertoHive();
                },
                child: const Text("Save User to Hive"))
          ],
        ),
      ),
    );
  }
}
