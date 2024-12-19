import 'package:app_design/src/presentation/controller/settings_controller.dart';
import 'package:app_design/src/presentation/screens/widgets/network_aware.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController settingsController = Get.put(SettingsController());
    return WillPopScope(
      onWillPop: () => settingsController.onWillPop(context),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
          automaticallyImplyLeading: false,
        ),
        body: const NetworkAware(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("Settings")],
            ),
          ),
        ),
      ),
    );
  }
}
