import 'package:app_design/src/presentation/controller/video_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:get/get.dart';

class YoutubePlayerWidget extends StatelessWidget {
  VlcPlayerController vlcController;

  YoutubePlayerWidget({super.key, required this.vlcController});

  @override
  Widget build(BuildContext context) {
    return VlcPlayer(
      controller: vlcController,
      aspectRatio: 16 / 9,
    );
  }
}
