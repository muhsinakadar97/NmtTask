import 'dart:developer';

import 'package:app_design/src/core/config/theme/colors.dart';
import 'package:app_design/src/data/models/chapter.dart';
import 'package:app_design/src/data/yt_player/lib/src/yt_player.dart';
import 'package:app_design/src/presentation/controller/course_overview_controller.dart';
import 'package:app_design/src/presentation/controller/view_video_controller.dart';
import 'package:app_design/src/presentation/screens/video/widgets/tabbar_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewVideo extends StatelessWidget {
  final String videoIdForLoading;
  final String currentChapterName;
  final List<Chapter> chapters;
  final String sectionName;

  const ViewVideo({
    super.key,
    required this.videoIdForLoading,
    required this.currentChapterName,
    required this.chapters,
    required this.sectionName,
  });

  @override
  Widget build(BuildContext context) {
    ViewVideoController viewVideoController = Get.put(ViewVideoController());
    viewVideoController.setCurrentVideoId(videoId: videoIdForLoading);
    viewVideoController.setCurrentChapterName(chapterName: currentChapterName);
    viewVideoController.setCurrentChapterList(chapters: chapters);
    viewVideoController.setCurrentSectionName(sectionName: sectionName);
    CourseOverviewController courseOverviewController =
        Get.find<CourseOverviewController>();

    log("viewVideoController.isFullscreen.value in video page => ${viewVideoController.isFullscreen.value}");

    return WillPopScope(
      onWillPop: () async {
        if (MediaQuery.of(context).orientation == Orientation.landscape) {
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
            SystemUiOverlay.top,
            SystemUiOverlay.bottom,
          ]);
          SystemChrome.setPreferredOrientations(
            [
              DeviceOrientation.portraitUp,
              DeviceOrientation.portraitDown,
            ],
          );

          viewVideoController.toggleFullscreen(false);
          return false; // Prevent default back navigation
        } else {
          return true; // Allow back navigation if in portrait mode
        }
      },
      child: OrientationBuilder(
        builder: (context, orientation) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: !viewVideoController.isFullscreen.value
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
                    ),
                  )
                : null,
            // body: NetworkAware(
            body: SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isFullscreen = viewVideoController.isFullscreen.value;
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        height: isFullscreen
                            ? constraints.maxHeight
                            : constraints.maxWidth / (16 / 9),
                        width: double.infinity,
                        child: Obx(() {
                          return YtPlayer(
                            key: viewVideoController.videoWidgetKey.value,
                            url:
                                'https://www.youtube.com/watch?v=${viewVideoController.currentVideoId}',
                            fullScreen: (bool value) {
                              viewVideoController.isFullscreen.value = value;
                            },
                          );
                        }),
                      ),
                      if (!isFullscreen)
                        const Expanded(
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: TabbarCustom(),
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
            // ),
          );
        },
      ),
    );
  }
}
