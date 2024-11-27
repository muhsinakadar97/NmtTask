import 'package:app_design/src/data/yt_player/lib/src/yt_player.dart';
import 'package:app_design/src/presentation/controller/course_overview_controller.dart';
import 'package:app_design/src/presentation/controller/view_video_controller.dart';
import 'package:app_design/src/presentation/screens/tab/tab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewVideo extends StatelessWidget {
  const ViewVideo({super.key, required this.videoIdForLoading});
  final String videoIdForLoading;
  @override
  Widget build(BuildContext context) {
    ViewVideoController viewVideoController = Get.put(ViewVideoController());
    CourseOverviewController courseOverviewController =
        Get.find<CourseOverviewController>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            courseOverviewController.selectedChapter?.chapterName ?? "",
            style: GoogleFonts.raleway(fontWeight: FontWeight.bold),
          )),
      body: Column(
        children: [
          Obx(
            () => YtPlayer(
              key: viewVideoController.videoWidgetKey.value,
              url: 'https://www.youtube.com/watch?v=$videoIdForLoading',
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
