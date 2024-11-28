import 'package:app_design/src/data/yt_player/lib/src/yt_player.dart';
import 'package:app_design/src/presentation/controller/view_video_controller.dart';
import 'package:app_design/src/presentation/screens/tab/tab.dart';
import 'package:flutter/material.dart';
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Obx(() => Text(
              viewVideoController.currentChapterName.value,
              style: GoogleFonts.raleway(
                  fontWeight: FontWeight.bold, color: Colors.black),
            )),
      ),
      body: Column(
        children: [
          Obx(
            () => YtPlayer(
              key: viewVideoController.videoWidgetKey.value,
              url:
                  'https://www.youtube.com/watch?v=${viewVideoController.currentVideoId}',
              FullScreen: (bool value) {},
            ),
          ),
          const SizedBox(
            height: 500,
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: TabPage(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
