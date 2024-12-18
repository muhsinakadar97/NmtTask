import 'package:app_design/src/core/config/theme/colors.dart';
import 'package:app_design/src/presentation/controller/connectivity_controller.dart';
import 'package:app_design/src/presentation/controller/splash_controller.dart';
import 'package:app_design/src/presentation/screens/widgets/network_aware.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    final SplashController splashController = Get.put(SplashController());
    ConnectivityController connectivityController =
        Get.find<ConnectivityController>();

    return Scaffold(
      backgroundColor: AppColors.buttonColor,
      body: NetworkAware(
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              double imageSize = constraints.maxWidth * 0.4;

              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(80),
                      child: SizedBox(
                        height: imageSize,
                        width: imageSize,
                        child: Image.asset(
                          'assets/images/app_logo.jpeg',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Obx(() {
                      final status =
                          connectivityController.connectionStatus.value;

                      if (status == ConnectivityResult.mobile ||
                          status == ConnectivityResult.wifi) {
                        return const Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: CircularProgressIndicator(color: Colors.white),
                        );
                      } else if (status == ConnectivityResult.none) {
                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              SizedBox(
                                width: constraints.maxWidth * 0.8,
                                child: Text(
                                  'You are not connected to the internet. Verify your internet connection before trying again!',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: constraints.maxWidth * 0.045,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(height: 20),
                              const CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ],
                          ),
                        );
                      }

                      return const Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: CircularProgressIndicator(color: Colors.white),
                      );
                    }),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}


// import 'package:app_design/src/core/config/theme/colors.dart';
// import 'package:app_design/src/presentation/controller/splash_controller.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';

// class Splash extends StatelessWidget {
//   const Splash({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final SplashController splashController = Get.put(SplashController());

//     return Scaffold(
//       backgroundColor: AppColors.buttonColor,
//       body: SafeArea(
//         child: LayoutBuilder(
//           builder: (context, constraints) {
//             double imageSize =
//                 constraints.maxWidth * 0.4; // 40% of screen width

//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   // App Logo
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(80),
//                     child: SizedBox(
//                       height: imageSize,
//                       width: imageSize,
//                       child: Image.asset(
//                         'assets/images/app_logo.jpeg',
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//                   ),

//                   // Connectivity Status
//                   Obx(() {
//                     final status = splashController.connectionStatus.value;

//                     if (status == ConnectivityResult.mobile ||
//                         status == ConnectivityResult.wifi) {
//                       // Show a progress indicator
//                       return const Padding(
//                         padding: EdgeInsets.only(top: 20),
//                         child: CircularProgressIndicator(color: Colors.white),
//                       );
//                     } else if (status == ConnectivityResult.none) {
//                       // Show error message for no connection
//                       return Padding(
//                         padding: const EdgeInsets.all(20.0),
//                         child: Column(
//                           children: [
//                             SizedBox(
//                               width: constraints.maxWidth *
//                                   0.8, // 80% of screen width
//                               child: Text(
//                                 'You are not connected to the internet. Verify your internet connection before trying again!',
//                                 style: GoogleFonts.poppins(
//                                   color: Colors.white,
//                                   fontSize: constraints.maxWidth *
//                                       0.045, // Responsive font size
//                                   fontWeight: FontWeight.w400,
//                                 ),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                             const SizedBox(
//                                 height:
//                                     20), // Space between error message and progress indicator
//                             const CircularProgressIndicator(
//                                 color: Colors.white), // Progress bar
//                           ],
//                         ),
//                       );
//                     }

//                     // Default: Show a progress indicator while checking
//                     return const Padding(
//                       padding: EdgeInsets.only(top: 20),
//                       child: CircularProgressIndicator(color: Colors.white),
//                     );
//                   }),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
