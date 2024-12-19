import 'package:app_design/src/presentation/controller/expert_videos_controller.dart';
import 'package:app_design/src/presentation/screens/expert_videos/widgets/expert_video_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpertVideoList extends StatelessWidget {
  const ExpertVideoList({super.key});

  @override
  Widget build(BuildContext context) {
    ExpertVideosController expertVideosController =
        Get.find<ExpertVideosController>();
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: expertVideosController.videos.length,
        itemBuilder: (context, index) {
          return ExpertVideoListItem(selectedIndex: index);
        },
      ),
    );
  }
}
