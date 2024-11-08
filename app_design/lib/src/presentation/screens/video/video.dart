import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:yt_player/yt_player.dart';
import 'package:app_design/src/presentation/controller/course_overview_controller.dart';
import 'package:app_design/src/presentation/controller/video_controller.dart';
import 'package:app_design/src/presentation/screens/video/widgets/tabbar_custom.dart';

class Video extends StatefulWidget {
  final String videoId;

  Video({super.key, required this.videoId});

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  CourseOverviewController courseOverviewController =
      Get.put(CourseOverviewController());
  VideoController videoController = Get.put(VideoController());

  @override
  void initState() {
    super.initState();
    videoController.loadVideo(widget.videoId);
    log("videoController.showTabbar.value => ${videoController.showTabbar.value}");
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (MediaQuery.of(context).orientation == Orientation.landscape) {
          videoController.showBottomSheet(context);
        } else if (MediaQuery.of(context).orientation == Orientation.portrait) {
          try {
            Get.back();
          } catch (e) {
            log("error => $e");
          }
        }
        return false;
      },
      child: OrientationBuilder(builder: (context, orientation) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: orientation == Orientation.portrait
              ? AppBar(
                  backgroundColor: Colors.white,
                  title: Text(
                    courseOverviewController.selectedChapterName.value,
                    style: GoogleFonts.raleway(fontWeight: FontWeight.bold),
                  ),
                  automaticallyImplyLeading: false,
                )
              : null,
          body: SafeArea(
            child: SingleChildScrollView(
              // Wrap the entire body to handle overflow
              child: Column(
                children: [
                  YtPlayer(
                    url: 'https://www.youtube.com/watch?v=${widget.videoId}',
                    onEnterFullScreen: (bool value) {
                      videoController.isFullScreen.value = value;
                    },
                  ),
                  if (orientation == Orientation.portrait)
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height -
                            250,
                        child: const TabbarCustom(),
                      ),
                    )
                  else
                    SizedBox.shrink(),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}





// import 'dart:developer';

// import 'package:app_design/src/presentation/controller/course_overview_controller.dart';
// import 'package:app_design/src/presentation/controller/video_controller.dart';
// import 'package:app_design/src/presentation/screens/video/widgets/tabbar_custom.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:yt_player/yt_player.dart';

// class Video extends StatefulWidget {
//   final String videoId;

//   Video({super.key, required this.videoId});

//   @override
//   State<Video> createState() => _VideoState();
// }

// class _VideoState extends State<Video> {
//   CourseOverviewController courseOverviewController =
//       Get.put(CourseOverviewController());
//   VideoController videoController = Get.put(VideoController());


//   @override
//   void initState() {
//     super.initState();
//     videoController.loadVideo(widget.videoId);
//      log("videoController.showTabbar.value => ${videoController.showTabbar.value}");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         if (MediaQuery.of(context).orientation == Orientation.landscape) {
//           videoController.showBottomSheet(context);
//         } else if (MediaQuery.of(context).orientation == Orientation.portrait) {
//           try {
//             Get.back();
//           } catch (e) {
//             log("error => $e");
//           }
//         }
//         return false;
//       },
//       child: OrientationBuilder(builder: (context, orientation) {



//         return Scaffold(
//           backgroundColor: Colors.white,
//           appBar: orientation == Orientation.portrait
//               ? AppBar(
//                   backgroundColor: Colors.white,
//                   title: Text(
//                     courseOverviewController.selectedChapterName.value,
//                     style: GoogleFonts.raleway(fontWeight: FontWeight.bold),
//                   ),
//                   automaticallyImplyLeading: false,
//                 )
//               : null,
//           body: SafeArea(
//             child: Column(
//               children: [
//                 YtPlayer(
//                   url: 'https://www.youtube.com/watch?v=${widget.videoId}',
//                   onEnterFullScreen: (bool value) {
//                     videoController.isFullScreen.value = value;
//                   },
//                 ),
//                 if (orientation == Orientation.portrait) 
               
//                   const Expanded(
//                     child: Padding(
//                       padding: EdgeInsets.only(top: 10),
//                       child: TabbarCustom(),
//                     ),
//                   )
//                 else
//                   SizedBox.shrink()
//               ],
//             ),
//           ),
//         );
//       }),
//     );
//   }
// }
