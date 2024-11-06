import 'package:app_design/src/presentation/controller/course_overview_controller.dart';
import 'package:app_design/src/presentation/controller/video_controller.dart';
import 'package:app_design/src/presentation/screens/video/widgets/tabbar_custom.dart';
import 'package:app_design/src/presentation/widgets/youtube_player_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yt_player/yt_player.dart';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:yt_player/yt_player.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_design/src/presentation/controller/video_controller.dart';
import 'package:app_design/src/presentation/controller/course_overview_controller.dart';

class Video extends StatelessWidget {
  final String videoId;
  final VideoController videoController = Get.put(VideoController());

  Video({super.key, required this.videoId}) {
    videoController.loadVideo(videoId);
  }

  @override
  Widget build(BuildContext context) {
    CourseOverviewController courseOverviewController =
        Get.put(CourseOverviewController());

    return WillPopScope(
      onWillPop: () async {
        // When back button is pressed, return to portrait mode
        SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
        return true;  // Allow the back navigation
      },
      child: OrientationBuilder(
        builder: (context, orientation) {
          // Lock orientation to landscape when in landscape mode
          if (orientation == Orientation.landscape) {
            SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
          } else {
            // Unlock the orientation when in portrait mode
            SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
          }

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
            body: Obx(
              () => SafeArea(
                child: orientation == Orientation.portrait
                    ? Column(
                        children: [
                          Stack(
                            children: [
                              AspectRatio(
                                aspectRatio: 16 / 9,
                                child: Container(
                                  color: Colors.black,
                                  child: videoController.isLoading.value
                                      ? const Center(
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                          ),
                                        )
                                      : YtPlayer(
                                          url:
                                              'https://www.youtube.com/watch?v=$videoId',
                                        ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Expanded(
                            child: TabbarCustom(),
                          ),
                        ],
                      )
                    : SizedBox.expand(  // Use SizedBox.expand for landscape mode
                        child: YtPlayer(
                          url: 'https://www.youtube.com/watch?v=$videoId',
                        ),
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}


// class Video extends StatelessWidget {
//   final String videoId;
//   final VideoController videoController = Get.put(VideoController());

//   Video({super.key, required this.videoId}) {
//     videoController.loadVideo(videoId);
//   }

//   @override
//   Widget build(BuildContext context) {
//     CourseOverviewController courseOverviewController =
//         Get.put(CourseOverviewController());

//     return OrientationBuilder(
//       builder: (context, orientation) {
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
//           body: Obx(
//             () => SafeArea(
//               child: orientation == Orientation.portrait
//                   ? Column(
//                       children: [
//                         Stack(
//                           children: [
//                             AspectRatio(
//                               aspectRatio: 16 / 9,
//                               child: Container(
//                                 color: Colors.black,
//                                 child: videoController.isLoading.value
//                                     ? const Center(
//                                         child: CircularProgressIndicator(
//                                           color: Colors.white,
//                                         ),
//                                       )
//                                     : YtPlayer(
//                                         url:
//                                             'https://www.youtube.com/watch?v=$videoId',
//                                       ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 10),
//                         const Expanded(
//                           child: TabbarCustom(),
//                         ),
//                       ],
//                     )
//                   : SizedBox.expand(
//                       child: YtPlayer(
//                         url: 'https://www.youtube.com/watch?v=$videoId',
//                       ),
//                     ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

