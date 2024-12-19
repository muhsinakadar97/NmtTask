import 'dart:async';
import 'dart:developer';

import 'package:app_design/src/data/models/user_model.dart';
import 'package:app_design/src/presentation/controller/connectivity_controller.dart';
import 'package:app_design/src/presentation/screens/home/widgets/bottom_nav.dart';
import 'package:app_design/src/presentation/screens/login/login.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SplashController extends GetxController {
  ConnectivityController connectivityController =
      Get.put(ConnectivityController());

  late Rx<UserModel> activeUser;
  late final userBox;
  RxBool isFirstLogin = true.obs;

  @override
  void onInit() {
    super.onInit();

    initHive(); // Initialize Hive and perform the necessary checks for user data

    // connectivitySubscription = connectivity.onConnectivityChanged.listen(
    //   (result) {
    //     updateConnectionStatus(result.first);
    //   },
    // );
  }

  Future<void> initHive() async {
    log("on initHive()");
    await Hive.initFlutter();
    Box<UserModel> userBox =
        await Hive.openBox('userHiveBox'); // Open the user box

    // Check if there is a saved user in the box
    UserModel? currentUser = userBox.get('userName');
    log("currentUser => $currentUser");

    if (currentUser != null) {
      log("inside if");

      // If a user exists, navigate to the home page
      log("User found: ${currentUser.userName}");
      isFirstLogin.value = false;
      navigateToHome();
      log("isfirstLogin.value => ${isFirstLogin.value}");
    } else {
      log("inside else");

      // If no user exists, navigate to the login page
      log("No user found. Navigating to login.");
      isFirstLogin.value = true;
            log("isfirstLogin.value => ${isFirstLogin.value}");


      navigateToLogin();
    }
    if (currentUser != null) {
      activeUser.value = currentUser;
    }
  }

  Future<void> saveUsertoHive() async {
    Box<UserModel> userBox =
        await Hive.openBox('userHiveBox'); // Open the user box

    UserModel user1 = UserModel(userName: "Ann");
    await userBox.put("userName", user1);
    log("User saved successfully");
    log(userBox.get("userName").toString());
  }

  void navigateToHome() {
    Get.offAll(() => const BottomNav());
  }

  void navigateToLogin() {
    Get.offAll(() => const Login());
  }
}




// import 'dart:async';
// import 'dart:developer';

// import 'package:app_design/src/data/models/user_model.dart';
// import 'package:app_design/src/presentation/screens/home/widgets/bottom_nav.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// class SplashController extends GetxController {
//   Rx<ConnectivityResult> connectionStatus = ConnectivityResult.none.obs;
//   final Connectivity connectivity = Connectivity();
//   late StreamSubscription connectivitySubscription;

//   @override
//   void onInit() {
//     super.onInit();

//     initHive();
//     // initConnectivity();

//     connectivitySubscription = connectivity.onConnectivityChanged.listen(
//       (result) {
//         updateConnectionStatus(result.first);
//       },
//     );
//   }

//   Future<void> initConnectivity() async {
//     try {
//       final result = await connectivity.checkConnectivity();
//       updateConnectionStatus(result.first);
//     } on PlatformException catch (e) {
//       log('Couldn\'t check connectivity status', error: e);
//     }
//   }

//   Future<void> initHive() async {
//     await Hive.initFlutter();
//     final appConnectionBox = await Hive.openBox('appConnectionState');
//     final userBox = await Hive.openBox('userHiveBox'); // 1. open user box

//     bool hasLaunchedBefore =
//         appConnectionBox.get('hasLaunchedBefore', defaultValue: false);
//     log("hasLaunchedBefore => $hasLaunchedBefore");

//     // Ensure that user data is not null and safely cast it
//     UserModel? currentUser = userBox.get('userName') as UserModel?;

//     // If currentUser is null, you may want to handle that case or create a fallback
//     if (currentUser != null) {
//       log("currentUser => ${currentUser.userName}");

//     } else {
//       log("No current user found.");
//     }

//     if (hasLaunchedBefore) {
//       navigateToHome();
//     } else {
//       saveLaunchStatus();
//       createNewUser();
//     }
//   }

//   Future saveLaunchStatus() async {
//     final appConnectionBox = await Hive.openBox('appConnectionState');
//     await appConnectionBox.put('hasLaunchedBefore', true);
//   }

//   Future createNewUser() async {
//     final userBox = await Hive.openBox('userHiveBox');

//     // Create a new user (ensure the UserModel constructor is defined correctly)
//     UserModel newUser = UserModel(userName: "Anu");

//     // Save the new user to the box
//     await userBox.put('userName', newUser);
//     UserModel user = userBox.get('userName');
//     log('username => ${user.userName}');
//   }

//   void navigateToHome() {
//     Future.delayed(
//       const Duration(seconds: 3),
//       () => Get.offAll(() => const BottomNav()),
//     );
//   }

//   void updateConnectionStatus(ConnectivityResult result) {
//     connectionStatus.value = result;
//     log('Connectivity changed: $result');

//     navigateToHome();
//   }
//   //   if (result == ConnectivityResult.mobile ||
//   //       result == ConnectivityResult.wifi) {
//   //     // Navigate to home after a short delay if there is internet connection
//   // Future.delayed(
//   //   const Duration(seconds: 3),
//   //   () => Get.offAll(() => const BottomNav()),
//   // );
//   //   }
//   // }

//   @override
//   void dispose() {
//     connectivitySubscription.cancel();
//     super.dispose();
//   }
// }

