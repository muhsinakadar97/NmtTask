import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ConnectivityController extends GetxController {
  final Connectivity _connectivity = Connectivity();
  Rx<ConnectivityResult> connectivity = Rx(ConnectivityResult.mobile);
  RxBool connectionStatus = RxBool(false);
  final showMessage = false.obs;

  // Timer reference to cancel if necessary
  Timer? _timer;

  List<ConnectivityResult> currentConnectionResult = [];

  @override
  void onInit() {
    super.onInit();
    _checkInitialConnection();
    _connectivity.onConnectivityChanged.listen(NetStatus);
  }

  Future<void> _checkInitialConnection() async {
    log("Checking initial connection");
    currentConnectionResult = await _connectivity.checkConnectivity();
    log("Initial connection status: $currentConnectionResult");
    // NetStatus(currentConnectionResult);
  }

  void NetStatus(List<ConnectivityResult> result) {
    log('result => $result');
    currentConnectionResult = result;

    log("Network status changed: $result");
    if (result.first == ConnectivityResult.none &&
        result.first != ConnectivityResult.none) {
      connectivity.value = result.first;
      showMessage.value = true;
      showConnectivityToast(result.first);
    } else {
      connectivity.value = result.first;
      showConnectivityToast(result.first);
    }
  }

  void showConnectivityToast(ConnectivityResult result) {
    String message;
    if (result == ConnectivityResult.none) {
      message = 'No Internet Connection!!';
    } else {
      message = 'We are back online...';
    }

    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor:
          result == ConnectivityResult.none ? Colors.red : Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
