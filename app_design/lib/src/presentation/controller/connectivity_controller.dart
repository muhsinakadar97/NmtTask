import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ConnectivityController extends GetxController {
  final Connectivity _connectivity = Connectivity();
  Rx<ConnectivityResult> previousConnectivityResult =
      Rx(ConnectivityResult.none);
  bool _isInitialCheckDone = false;

  @override
  void onInit() {
    super.onInit();
    _checkInitialConnection();
    _connectivity.onConnectivityChanged.listen(NetStatus);
  }

  Future<void> _checkInitialConnection() async {
    log("Checking initial connection");
    List<ConnectivityResult> connectivityResult =
        await _connectivity.checkConnectivity();
    log("Initial connection status: $connectivityResult");
    if (connectivityResult.first == ConnectivityResult.none) {
      showConnectivityToast(
          message: "No Internet connected", isConnected: false);
    }
    previousConnectivityResult.value = connectivityResult.first;
  }

  void NetStatus(List<ConnectivityResult> connectivityResult) {
    log('previousConnectivityResult => $previousConnectivityResult');
    log('currentConnectivityResult => $connectivityResult');
    // Skip the first check when app opens
    if (!_isInitialCheckDone) {
      previousConnectivityResult.value = connectivityResult.first;
      _isInitialCheckDone = true;
      return;
    }

    if (previousConnectivityResult != ConnectivityResult.none &&
        connectivityResult.first == ConnectivityResult.none) {
      log('no internet');
      showConnectivityToast(
          message: "No Internet connected", isConnected: false);
    }
    if (previousConnectivityResult == ConnectivityResult.none &&
        connectivityResult.first != ConnectivityResult.none) {
      log('internet');
      showConnectivityToast(
          message: "Internet connected. We are back online", isConnected: true);
    }

    previousConnectivityResult.value = connectivityResult.first;
  }

  void showConnectivityToast(
      {required String message, required bool isConnected}) {
    log('Toast showed with message => ${message.toUpperCase()}');
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: isConnected == false ? Colors.red : Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  void onClose() {
    super.onClose();
  }
}
