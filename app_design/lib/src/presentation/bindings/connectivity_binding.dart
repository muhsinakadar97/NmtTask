import 'package:app_design/src/presentation/controller/connectivity_controller.dart';
import 'package:get/get.dart';

class ConnectivityBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ConnectivityController>(ConnectivityController(),permanent: true);
  }
}
