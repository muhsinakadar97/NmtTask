import 'package:app_design/src/presentation/controller/course_overview_controller.dart';
import 'package:app_design/src/presentation/screens/course_overview/widgets/couse_overview_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseOverview extends StatelessWidget {
  const CourseOverview({super.key});

  @override
  Widget build(BuildContext context) {
    CourseOverviewController courseOverviewController =
        Get.put(CourseOverviewController());
    return const Scaffold(
        backgroundColor: Colors.white, body: CouseOverviewBody());
  }
}
