import 'package:app_design/src/presentation/bindings/connectivity_binding.dart';
import 'package:app_design/src/presentation/screens/home/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialBinding: ConnectivityBinding(),
        // builder:
        //     DevicePreview.appBuilder, // Add this line to apply the preview mode

        home: const BottomNav());
  }
}
