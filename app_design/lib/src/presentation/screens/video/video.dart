import 'dart:developer';

import 'package:app_design/src/core/config/theme/colors.dart';
import 'package:app_design/src/data/yt_player/lib/src/yt_player.dart';
import 'package:app_design/src/presentation/controller/view_video_controller.dart';
import 'package:app_design/src/presentation/screens/tab/tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewVideo extends StatelessWidget {
  final String videoIdForLoading;
  final String currentChapterName;

  const ViewVideo(
      {super.key,
      required this.videoIdForLoading,
      required this.currentChapterName});

  @override
  Widget build(BuildContext context) {
    ViewVideoController viewVideoController = Get.put(ViewVideoController());
    viewVideoController.setCurrentVideoId(videoId: videoIdForLoading);
    viewVideoController.setCurrentChapterName(chapterName: currentChapterName);
    log("viewVideoController.isFullscreen.value => ${viewVideoController.isFullscreen.value}");

    return WillPopScope(
      onWillPop: () async {
        if (MediaQuery.of(context).orientation == Orientation.landscape) {
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
            DeviceOrientation.portraitDown,
          ]);
          return false;
        } else {
          return true;
        }
      },
      child: OrientationBuilder(
        builder: (context, orientation) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: orientation == Orientation.portrait
                ? AppBar(
                    automaticallyImplyLeading: false,
                    backgroundColor: Colors.white,
                    title: Obx(
                      () => Text(
                        viewVideoController.currentChapterName.value,
                        style: GoogleFonts.raleway(
                          fontWeight: FontWeight.bold,
                          color: AppColors.buttonColor,
                        ),
                      ),
                    ))
                : null, // Hide the AppBar in landscape mode
            body: Column(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: YtPlayer(
                    key: viewVideoController.videoWidgetKey.value,
                    url:
                        'https://www.youtube.com/watch?v=${viewVideoController.currentVideoId}',
                    FullScreen: (bool value) {
                      log("Full screen value => $value");
                      viewVideoController.isFullscreen.value = value;

                      // When exiting fullscreen, set the preferred orientation to portrait
                      if (!value) {
                        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                            overlays: [
                              SystemUiOverlay.top,
                              SystemUiOverlay.bottom,
                            ]);
                        SystemChrome.setPreferredOrientations([
                          DeviceOrientation.portraitUp,
                          DeviceOrientation.portraitDown,
                        ]);
                      }
                    },
                  ),
                ),
                Obx(
                  () => viewVideoController.isFullscreen.value == false
                      ? const SizedBox(
                          height: 500,
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: TabPage(),
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}




// import 'dart:developer';

// import 'package:app_design/src/core/config/theme/colors.dart';
// import 'package:app_design/src/data/yt_player/lib/src/yt_player.dart';
// import 'package:app_design/src/presentation/controller/view_video_controller.dart';
// import 'package:app_design/src/presentation/screens/tab/tab.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';

// class ViewVideo extends StatelessWidget {
//   final String videoIdForLoading;
//   final String currentChapterName;

//   const ViewVideo(
//       {super.key,
//       required this.videoIdForLoading,
//       required this.currentChapterName});

//   @override
//   Widget build(BuildContext context) {
//     ViewVideoController viewVideoController = Get.put(ViewVideoController());
//     viewVideoController.setCurrentVideoId(videoId: videoIdForLoading);
//     viewVideoController.setCurrentChapterName(chapterName: currentChapterName);
//     log("viewVideoController.isFullscreen.value => ${viewVideoController.isFullscreen.value}");

//     // Future<bool> onWillPop() async {
//     //   if () {
//     //     Fluttertoast.showToast(
//     //       msg: "Press Full Screen Exit to go back!!!",
//     //       toastLength: Toast.LENGTH_SHORT,
//     //       gravity: ToastGravity.BOTTOM,
//     //     );
//     //     return false;
//     //   }
//     //   return true;
//     // }

//     return WillPopScope(
//       onWillPop: () async {
//         // Check if the current orientation is landscape
//         if (MediaQuery.of(context).orientation == Orientation.landscape) {
//           // Change orientation to portrait when back is pressed in landscape mode
//           SystemChrome.setPreferredOrientations([
//             DeviceOrientation.portraitUp,
//             DeviceOrientation.portraitDown,
//           ]);
//           return false; // Allow back navigation
//         } else {
//           return true; // If it's already portrait, just go back
//         }
//       },
//       child: OrientationBuilder(
//         builder: (context, orientation) {
//           return Scaffold(
//             backgroundColor: Colors.white,
//             appBar:
//                 // orientation == Orientation.portrait
//                 !viewVideoController.isFullscreen.value
//                     ? AppBar(
//                         automaticallyImplyLeading: false,
//                         backgroundColor: Colors.white,
//                         title: Obx(
//                           () => Text(
//                             viewVideoController.currentChapterName.value,
//                             style: GoogleFonts.raleway(
//                               fontWeight: FontWeight.bold,
//                               color: AppColors.buttonColor,
//                             ),
//                           ),
//                         ))
//                     : null, // Hide the AppBar in landscape mode
//             body: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Obx(
//                     () => AspectRatio(
//                       aspectRatio: 16 / 9,
//                       child: YtPlayer(
//                         key: viewVideoController.videoWidgetKey.value,
//                         url:
//                             'https://www.youtube.com/watch?v=${viewVideoController.currentVideoId}',
//                         FullScreen: (bool value) {
//                           log("Full screen value => $value");
//                           viewVideoController.isFullscreen.value = value;

//                           // // When exiting fullscreen, set the preferred orientation to portrait
//                           // if (!value) {
//                           //   SystemChrome.setEnabledSystemUIMode(
//                           //       SystemUiMode.manual,
//                           //       overlays: [
//                           //         SystemUiOverlay.top,
//                           //         SystemUiOverlay.bottom,
//                           //       ]);
//                           //   SystemChrome.setPreferredOrientations([
//                           //     DeviceOrientation.portraitUp,
//                           //     DeviceOrientation.portraitDown,
//                           //   ]);
//                           // }
//                         },
//                       ),
//                     ),
//                   ),
//                   // MediaQuery.of(context).orientation == Orientation.portrait
//                   viewVideoController.isFullscreen.value
//                       ? const SizedBox(
//                           height: 500,
//                           child: Align(
//                             alignment: Alignment.topCenter,
//                             child: Padding(
//                               padding: EdgeInsets.only(top: 20),
//                               child: TabPage(),
//                             ),
//                           ),
//                         )
//                       : const SizedBox.shrink(),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
