import 'dart:developer';

import 'package:app_design/src/presentation/screens/video/widgets/tabbar_custom.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart'; // Import youtube_player_flutter

class Video extends StatefulWidget {
  final String videoIdForLoading;

  const Video({super.key, required this.videoIdForLoading});

  @override
  State<Video> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<Video> {
  late YoutubePlayerController _controller;
  bool _isInitialized = false; // To track initialization status

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _isInitialized
              ? SafeArea(
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: YoutubePlayer(controller: _controller),
                  ),
                )
              : SafeArea(
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Container(
                      color: Colors.black,
                      child: const Center(child: CircularProgressIndicator()),
                    ),
                  ),
                ),
          const Expanded(
            child: TabbarCustom(),
          ),
        ],
      ),
    );
  }

  void initializePlayer() async {
    try {
      // Initialize YoutubePlayerController using the videoIdForLoading
      String videoUrl = widget.videoIdForLoading;

      // Initialize the YoutubePlayerController
      _controller = YoutubePlayerController(
        initialVideoId: videoUrl, // Directly use the videoIdForLoading
        flags: const YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
          enableCaption: true,
        ),
      )..addListener(() {
          if (_controller.value.hasError) {
            log("Error: ${_controller.value.errorCode}");
          }
        });

      setState(() {
        _isInitialized = true;
      });
    } catch (e) {
      log("Error during video initialization: $e");
    }
  }

  @override
  void dispose() {
    _controller.dispose(); // Clean up the controller when the widget is disposed
    super.dispose();
  }
}
