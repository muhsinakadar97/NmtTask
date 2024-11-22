import 'package:app_design/src/core/config/theme/colors.dart';
import 'package:app_design/src/presentation/controller/splash_controller.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash extends StatelessWidget {

  const Splash({super.key,});

  @override
  Widget build(BuildContext context) {
    SplashController splashController = Get.put(SplashController());

    return Scaffold(
      backgroundColor: AppColors.buttonColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(80),
                child: SizedBox(
                    height: 150,
                    width: 150,
                    child: Image.asset('assets/images/app_logo.jpeg', fit: BoxFit.fill,)),
              ),
              Obx(
                () {
                  if (splashController.connectionStatus.isNotEmpty) {
                    final status = splashController.connectionStatus.first;

                    if (status == ConnectivityResult.mobile ||
                        status == ConnectivityResult.wifi) { 
                          // Get.to(BottomNav());
                          // Future.delayed(Duration(seconds: 3) {})
                      // Future.microtask(() => splashController.loadHome());
                      return const Center(child: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: CircularProgressIndicator(color: Colors.white,),
                      ));
                    } else if (status == ConnectivityResult.none) {
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            'You are not connected to Internet. Please check your Internet Connection before try again!!!',
                            style: GoogleFonts.poppins(
                                color: Colors.red,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    }
                  }
                  return const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Center(
                        child:CircularProgressIndicator(),
                      ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
