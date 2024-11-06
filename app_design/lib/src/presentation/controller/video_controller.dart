import 'dart:developer';

import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:get/get.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class VideoController extends GetxController {
  late VlcPlayerController vlcController;
  RxBool isPlaying = false.obs;
  RxBool isLoading = true.obs;
  String videoUrl = '';
  String subtitleText = "";
  RxBool isFullscreen = false.obs;

  Future<void> loadVideo(String videoId) async {
    try {
      isLoading.value = true;
      var yt = YoutubeExplode();
      var video = await yt.videos.get(videoId);
      var manifest = await yt.videos.streamsClient.getManifest(videoId);
      var streamInfo = manifest.muxed.withHighestBitrate();
      videoUrl = streamInfo.url.toString();

      // Initialize VLC Player Controller with the extracted video URL
      vlcController = VlcPlayerController.network(
        videoUrl,
        autoPlay: true,
        hwAcc: HwAcc.full,
      );

      vlcController.addListener(() {
        final currentTime = vlcController.value.position.inSeconds;

        // Example subtitle logic
        if (currentTime < 5) {
          subtitleText = "Welcome to the video!";
        } else if (currentTime < 10) {
          subtitleText = "Enjoy the content!";
        } else {
          subtitleText =
              ""; // Change this to show actual subtitles from a file or URL if needed
        }
      });

      isPlaying.value = true;
      isLoading.value = false;
    } catch (e) {
      log("Error loading video: $e");
      isLoading.value = false;
    }
  }

  void togglePlayPause() {
    if (vlcController.value.isPlaying) {
      vlcController.pause();
      isPlaying.value = false;
    } else {
      vlcController.play();
      isPlaying.value = true;
    }
  }

  @override
  void onClose() {
    vlcController.dispose();
    super.onClose();
  }
}
