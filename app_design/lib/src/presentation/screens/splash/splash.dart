import 'package:app_design/src/core/config/theme/colors.dart';
import 'package:app_design/src/presentation/controller/splash_controller.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    SplashController splashController = Get.put(SplashController());

    return Scaffold(
      backgroundColor: AppColors.buttonColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double imageSize =
                constraints.maxWidth * 0.4; // 40% of the screen width

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(80),
                    child: SizedBox(
                      height: imageSize, // Set responsive height
                      width: imageSize, // Set responsive width
                      child: Image.asset(
                        'assets/images/app_logo.jpeg',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Obx(
                    () {
                      if (splashController.connectionStatus.isNotEmpty) {
                        final status = splashController.connectionStatus.first;

                        if (status == ConnectivityResult.mobile ||
                            status == ConnectivityResult.wifi) {
                          return const Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          );
                        } else if (status == ConnectivityResult.none) {
                          return Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: SizedBox(
                              width: constraints.maxWidth *
                                  0.8, // 80% width of screen
                              child: Text(
                                'You are not connected to the internet. Verify your internet connection before trying again!',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: constraints.maxWidth *
                                      0.045, // Responsive font size
                                      fontWeight: FontWeight.w400
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        }
                      }
                      return const Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
