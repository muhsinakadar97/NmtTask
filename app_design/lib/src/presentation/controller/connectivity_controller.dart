import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
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

      // Start a timer to hide the indicator after 3 seconds
      _timer?.cancel(); // Cancel any existing timers
      _timer = Timer(const Duration(seconds: 3), () {
        showMessage.value = false;
      });
    } else {
      connectivity.value = result.first;
    }
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
