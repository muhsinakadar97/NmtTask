import 'package:app_design/src/app.dart';
import 'package:app_design/src/data/data_sources/remote_datasource.dart';
import 'package:app_design/src/data/models/user_model.dart';
import 'package:app_design/src/data/repositories/item_repo_impl/item_repo_impl.dart';
import 'package:app_design/src/presentation/controller/item_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  await Hive.initFlutter();
  await Hive.openBox('userBox');
  Hive.registerAdapter(UserModelAdapter());
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  final remoteDataSource = ItemRemoteDataSource();
  final repository = ItemRepositoryImpl(remoteDataSource);
  Get.put(ItemController(repository));

  runApp(const MyApp()
      // DevicePreview(
      // enabled: !kReleaseMode, // Enable only in debug mode
      // builder: (context) => const MyApp(), // Your app widget
      // ),
      );
}
