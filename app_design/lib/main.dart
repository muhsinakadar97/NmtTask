import 'package:app_design/player_with_widget.dart';
import 'package:app_design/src/presentation/screens/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final ScrollController globalScrollController =
    ScrollController(); // Global ScrollController

void main() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp( 
      debugShowCheckedModeBanner: false,
      // home: PlayerWithWidget(),
      home: Splash(),
    );
  }
}
