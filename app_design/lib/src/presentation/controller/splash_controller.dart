import 'dart:async';
import 'dart:developer';

import 'package:app_design/src/presentation/screens/home/widgets/bottom_nav.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SplashController extends GetxController {
  Rx<ConnectivityResult> connectionStatus = ConnectivityResult.none.obs;
  final Connectivity connectivity = Connectivity();
  late StreamSubscription connectivitySubscription;

  @override
  void onInit() {
    super.onInit();

    initHive();
    initConnectivity();

    connectivitySubscription = connectivity.onConnectivityChanged.listen(
      (result) {
        updateConnectionStatus(result.first);
      },
    );
  }

  Future<void> initConnectivity() async {
    try {
      final result = await connectivity.checkConnectivity();
      updateConnectionStatus(result.first);
    } on PlatformException catch (e) {
      log('Couldn\'t check connectivity status', error: e);
    }
  }

  Future<void> initHive() async {
    await Hive.initFlutter();
    final box = await Hive.openBox('appConnectionState');
    bool hasLaunchedBefore = box.get('hasLaunchedBefore', defaultValue: false);
    log("hasLaunchedBefore => $hasLaunchedBefore");

    if (hasLaunchedBefore) {
      navigateToHome();
    } else {
      saveLaunchStatus();
    }
  }

  Future saveLaunchStatus() async {
    final box = await Hive.openBox('appConnectionState');
    await box.put('hasLaunchedBefore', true);
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 3),
      () => Get.offAll(() => const BottomNav()),
    );
  }

  void updateConnectionStatus(ConnectivityResult result) {
    connectionStatus.value = result;
    log('Connectivity changed: $result');

    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      // Navigate to home after a short delay if there is internet connection
      Future.delayed(
        const Duration(seconds: 3),
        () => Get.offAll(() => const BottomNav()),
      );
    }
  }

  @override
  void dispose() {
    connectivitySubscription.cancel();
    super.dispose();
  }
}





// import 'dart:async';
// import 'dart:developer';

// import 'package:app_design/src/presentation/screens/home/widgets/bottom_nav.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';

// class SplashController extends GetxController {
//   RxList<ConnectivityResult> connectionStatus = [ConnectivityResult.none].obs;
//   final Connectivity connectivity = Connectivity();
//   late StreamSubscription<List<ConnectivityResult>> connectivitySubscription;

//   @override
//   void onInit() {
//     initConnectivity();

//     connectivitySubscription =
//         connectivity.onConnectivityChanged.listen(updateConnectionStatus);

//     if (connectionStatus != [ConnectivityResult.none]) {
//       Future.delayed(
//         const Duration(seconds: 3),
//         () => Get.to(const BottomNav()),
//       );
//     }

//     super.onInit();
//   }

//   // method to check network connectivity

//   Future<void> initConnectivity() async {
//     late List<ConnectivityResult> result;
//     try {
//       result = await connectivity.checkConnectivity();
//     } on PlatformException catch (e) {
//       log('Couldn\'t check connectivity status', error: e);
//       return;
//     }

//     return updateConnectionStatus(result);
//   }

//   // method to update status of connection. ie, none || wifi || mobile

//   Future<void> updateConnectionStatus(List<ConnectivityResult> result) async {
//     connectionStatus.value = result;
//     log('Connectivity changed: $connectionStatus');
//     update();
//   }

//   @override
//   void dispose() {
//     connectivitySubscription.cancel();
//     super.dispose();
//   }
// }
