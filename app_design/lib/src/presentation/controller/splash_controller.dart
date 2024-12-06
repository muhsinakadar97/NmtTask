import 'dart:async';
import 'dart:developer';
import 'package:app_design/src/presentation/screens/home/widgets/bottom_nav.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  RxList<ConnectivityResult> connectionStatus = [ConnectivityResult.none].obs;
  final Connectivity connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> connectivitySubscription;

  @override
  void onInit() {
    initConnectivity();

    connectivitySubscription =
        connectivity.onConnectivityChanged.listen(updateConnectionStatus);
    Future.delayed(
      const Duration(seconds: 3),
      () => Get.to(const BottomNav()),
    );

    super.onInit();
  }

  // method to check network connectivity

  Future<void> initConnectivity() async {
    late List<ConnectivityResult> result;
    try {
      result = await connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      log('Couldn\'t check connectivity status', error: e);
      return;
    }

    return updateConnectionStatus(result);
  }

  // method to update status of connection. ie, none || wifi || mobile

  Future<void> updateConnectionStatus(List<ConnectivityResult> result) async {
    connectionStatus.value = result;
    log('Connectivity changed: $connectionStatus');
    update();
  }

  @override
  void dispose() {
    connectivitySubscription.cancel();
    super.dispose();
  }
}
