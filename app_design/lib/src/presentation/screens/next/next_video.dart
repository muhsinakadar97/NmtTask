import 'package:app_design/src/presentation/controller/course_overview_controller.dart';
import 'package:app_design/src/presentation/controller/view_video_controller.dart';
import 'package:app_design/src/presentation/screens/next/widgets/header.dart';
import 'package:app_design/src/presentation/screens/next/widgets/video_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NextVideo extends StatelessWidget {
  const NextVideo({super.key});

  @override
  Widget build(BuildContext context) {
    CourseOverviewController courseOverviewController =
        Get.find<CourseOverviewController>();
    ViewVideoController viewVideoCtr = Get.find<ViewVideoController>();
    return const Column(
      children: [NextVideoHeader(), VideoList()],
    );
  }
}
