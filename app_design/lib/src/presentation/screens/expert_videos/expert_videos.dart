import 'package:app_design/src/presentation/controller/expert_videos_controller.dart';
import 'package:app_design/src/presentation/screens/expert_videos/widgets/expert_video_list.dart';
import 'package:app_design/src/presentation/screens/widgets/network_aware.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpertVideos extends StatelessWidget {
  const ExpertVideos({super.key});

  @override
  Widget build(BuildContext context) {
    ExpertVideosController expertVideosController =
        Get.put(ExpertVideosController());
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Expert Videos',
            style: GoogleFonts.raleway(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false, // Hide the back button
        ),
        body: const NetworkAware(child: ExpertVideoList()));
  }
}
