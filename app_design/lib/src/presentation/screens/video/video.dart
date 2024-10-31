import 'package:app_design/src/presentation/controller/course_overview_controller.dart';
import 'package:app_design/src/presentation/controller/video_controller.dart';
import 'package:app_design/src/presentation/screens/video/widgets/tabbar_custom.dart';
import 'package:app_design/src/presentation/widgets/youtube_player_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Obx(
            () => Text(
              courseOverviewController.selectedChapterName.value,
              style: GoogleFonts.raleway(
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey[900],
              ),
            ),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
        ),
        body: Obx(() => SafeArea(
              child: Column(
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
                                : YoutubePlayerWidget(vlcController: videoController.vlcController)
                              // : VlcPlayer(
                              //     controller: videoController.vlcController,
                              //     aspectRatio: 16 / 9,
                              //   ),
                        ),
                      ),
                      Positioned(
                        top: 80,
                        left: 160,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(
                                videoController.isPlaying.value
                                    ? Icons.pause
                                    : Icons.play_arrow,
                                color: Colors.white,
                                size: 40,
                              ),
                              onPressed: () {
                                videoController.togglePlayPause();
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Expanded(
                    child: TabbarCustom(),
                  ),
                ],
              ),
            )));
  }
}
