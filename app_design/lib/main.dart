import 'package:app_design/src/presentation/screens/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final ScrollController globalScrollController =
    ScrollController(); // Global ScrollController

void main() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  runApp(const MyApp()
      // DevicePreview(
      // enabled: !kReleaseMode, // Enable only in debug mode
      // builder: (context) => const MyApp(), // Your app widget
      // ),
      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // builder:
      //     DevicePreview.appBuilder, // Add this line to apply the preview mode
      home: Splash(),
    );
  }
}
