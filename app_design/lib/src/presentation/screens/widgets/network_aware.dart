import 'package:flutter/material.dart';

class NetworkAware extends StatelessWidget {
  final Widget child;

  const NetworkAware({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return child;
  }
}





// import 'package:app_design/src/presentation/controller/connectivity_controller.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class NetworkAware extends StatelessWidget {
//   final Widget child;

//   const NetworkAware({super.key, required this.child});

//   @override
//   Widget build(BuildContext context) {
//     final ctr = Get.find<ConnectivityController>();

//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           Obx(
//             () => AnimatedContainer(
//               height:
//                   (ctr.connectivity.value == ConnectivityResult.none) ? 0 : 50,
//               color: ctr.connectivity.value == ConnectivityResult.none
//                   ? Colors.red
//                   : Colors.green,
//               duration: const Duration(milliseconds: 400),
//               child: Center(
//                 child: ctr.connectivity.value == ConnectivityResult.none
//                     ? const Text(
//                         'No Internet Connection',
//                         style: TextStyle(color: Colors.white),
//                       )
//                     : const Text(
//                         'Connected. we are back online',
//                         style: TextStyle(color: Colors.white),
//                       ),
//               ),
//             ),
//           ),
//           child
//         ],
//       ),
//     );
//   }
// }
