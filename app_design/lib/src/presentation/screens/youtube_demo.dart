import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class YoutubeDemo extends StatefulWidget {
  final String url;
  const YoutubeDemo({super.key, required this.url});

  @override
  State<YoutubeDemo> createState() => _YoutubeDemoState();
}

class _YoutubeDemoState extends State<YoutubeDemo> {
  final ScrollController _scrollController = ScrollController();
  late AudioOnlyStreamInfo currentAudioStream;
  late VideoOnlyStreamInfo currentStream;
  List<VideoOnlyStreamInfo> videoOnlyStreams = [];
  late VlcPlayerController vlcPlayerCtrl;
  bool isFullscreen = false;
  bool isLoading = true;
  double _buffering = 1;
  double hidecontrols = 1;
  Duration currentPosition = Duration.zero;
  Duration backupPosition = Duration.zero;
  Duration totalDuration = Duration.zero;
  bool fetching = false;

  double scale = 1.0; // Initial scale
  double previousScale = 1.0;

  // updated variables
  ValueNotifier<bool?> isPlaying = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels != 0) {
        _scrollController.jumpTo(0); // Jump back to the top
      }
    });
    _initializePlayer();
  }

  Future<void> _initializePlayer() async {
    final yt = YoutubeExplode();
    try {
      // log("player is trying to initialize...");
      // Extract the video ID from the provided URL
      var videoId = VideoId(widget.url);
      // log("videoId:$videoId");

      // Fetch video streams
      var video = await yt.videos.streamsClient.getManifest(videoId);
      // log("video:$video");
      currentAudioStream = video.audioOnly.withHighestBitrate();
      // log('currentAudioOnlyStream:$currentAudioStream');
      final seenResolutions = <int>{};
      videoOnlyStreams = video.videoOnly.where((streamInfo) {
        // Check if the stream's container is mp4 and its height is <= 1080
        final resolution = streamInfo.videoResolution;

        // Avoid duplicates by checking if resolution already exists in the set
        if (streamInfo.codec.mimeType == 'video/mp4' &&
            resolution.height <= 1080 &&
            !seenResolutions.contains(resolution.height)) {
          seenResolutions
              .add(resolution.height); // Add the resolution to the set
          return true;
        }
        return false;
      }).toList();
      // log('videoOnlyStreams[] : $videoOnlyStreams');

      currentStream = videoOnlyStreams.firstWhere(
          (stream) => stream.qualityLabel == '360p',
          orElse: () => videoOnlyStreams.last); // by default 360p
      // log("current stream:$currentStream");

      // log("url of currentstream:${currentStream.url.toString()}");
      // Initialize VLC player with the extracted stream URL

      await initPlayer(currentStream.url.toString());
    } catch (e) {
      // log("Error extracting stream: $e");
    } finally {
      yt.close();
    }
  }

  Future<void> initPlayer(String streamUrl) async {
    try {
      vlcPlayerCtrl = VlcPlayerController.network(
        streamUrl,
        autoPlay: true,
        autoInitialize: true,
      );
      // vlcPlayerCtrl.setMediaFromNetwork(
      //   currentAudioStream.url.toString(),
      //   autoPlay: true,
      // );
      setState(() {
        isLoading = false;
      });
      vlcPlayerCtrl.addOnInitListener(() {
        if (mounted) {
          setState(() {
            // log("once only..........................addOnInitListener");
            vlcPlayerCtrl
                .addAudioFromNetwork(currentAudioStream.url.toString());
          });
        }
      });

      vlcPlayerCtrl.addListener(() {
        listenPlayingduration();
        setState(() {
          if (vlcPlayerCtrl.value.position != Duration.zero) {
            currentPosition = vlcPlayerCtrl.value.position;
            backupPosition = currentPosition;
          }
          if (vlcPlayerCtrl.value.position != Duration.zero &&
              totalDuration == Duration.zero) {
            totalDuration = vlcPlayerCtrl.value.duration;
          }
          if (vlcPlayerCtrl.value.playingState == PlayingState.playing) {
            isPlaying.value = true;
          }
          if (vlcPlayerCtrl.value.playingState == PlayingState.stopped) {
            isPlaying.value = null;
          }
          if (vlcPlayerCtrl.value.playingState == PlayingState.buffering) {
            _buffering = 0;
          } else {
            _buffering = 1;
          }
        });
        if (vlcPlayerCtrl.value.playingState == PlayingState.error) {
          log("Error: ${PlayingState.error}");
        }
      });
    } catch (e) {
      log("Error :$e");
    }
  }

  Future changeQuality({required VideoOnlyStreamInfo stream}) async {
    Navigator.of(context).pop();
    try {
      currentStream = stream;
      setState(() {
        fetching = true;
      });

      await vlcPlayerCtrl
          .setMediaFromNetwork(currentStream.url.toString(),
              hwAcc: HwAcc.full, autoPlay: true)
          .then((_) async {
        await vlcPlayerCtrl.seekTo(backupPosition).then((_) {
          vlcPlayerCtrl.addAudioFromNetwork(currentAudioStream.url.toString());
        });
      });

      setState(() {
        fetching = false;
      });
    } catch (e) {
      log('Error in quality change function:$e');
    }
  }

  void listenPlayingduration() {
    // log('backup pos:$backupPosition');
    // log('backup pos:$currentPosition');
    // log('vlcplayer pos:${vlcPlayerCtrl.value.position}');
    Duration diff = vlcPlayerCtrl.value.position - backupPosition;
    // log("difference :$diff");
    if ((diff >= const Duration(seconds: 1) || diff <= Duration.zero) &&
        vlcPlayerCtrl.value.playingState == PlayingState.playing) {
      setState(() {
        fetching = true;
      });
    } else {
      setState(() {
        fetching = false;
      });
    }
  }

  @override
  void dispose() {
    // log("disposed....");
    vlcPlayerCtrl.removeListener(() {});
    vlcPlayerCtrl.dispose();
    super.dispose();
  }

  void _hidecontrols() {
    setState(
      () {
        if (hidecontrols == 0) {
          hidecontrols = 1;
        } else {
          hidecontrols = 0;
        }
      },
    );
  }

  Future onExitFullScreen() async {
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
    setState(() {
      isFullscreen = false;
    });
  }

  Future onEnterFullScreen() async {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ],
    );
    setState(() {
      isFullscreen = true;
    });
  }

  void toggleFullScreen() {
    if (isFullscreen == false) {
      onEnterFullScreen();
    } else {
      onExitFullScreen();
      setState(() {
        scale = 1;
      });
    }
  }

  Future<void> togglePlayPause() async {
    if (hidecontrols > 0) {
      if (!vlcPlayerCtrl.value.isInitialized) {
        // log("Player is not initialized yet");
        return;
      }

      // log("Current Player State: ${vlcPlayerCtrl.value.playingState}");

      switch (vlcPlayerCtrl.value.playingState) {
        case PlayingState.playing:
          // log("Pausing the player...");
          await vlcPlayerCtrl.pause().then((val) {
            // log("paused successfully");
            isPlaying.value = false;
          }).catchError((e) {
            log("Error: $e");
          });
          break;

        case PlayingState.stopped:
          isPlaying.value = null;
          // log("Player is stopped, attempting to play...");
          try {
            vlcPlayerCtrl.stop(); // Ensure it's fully stopped
            await vlcPlayerCtrl
                .setMediaFromNetwork(
              vlcPlayerCtrl.dataSource,
            )
                .then((_) async {
              await vlcPlayerCtrl.addAudioFromNetwork(
                currentAudioStream.url.toString(),
                isSelected: true,
              );
            }); // Reload the media from the URL
          } catch (e) {
            log("Error seeking or playing: $e");
          }
          break;
        case PlayingState.paused:
          // log("Resuming play...");
          vlcPlayerCtrl.play().whenComplete(() {
            // log("playing started");
            isPlaying.value = true;
          });
          break;

        case PlayingState.buffering:
          isPlaying.value = null;
          // log("Buffering... Please wait.");
          break;

        case PlayingState.error:
          isPlaying.value = null;
          // log("Error in playback. Checking if we can retry...");
          break;

        default:
          // log("Unknown player state: ${vlcPlayerCtrl.value.playingState}");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              isLoading
                  ? AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Container(
                        
                        height: double.infinity,
                        width: double.infinity,
                        color: Colors.black,
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    )
                  : GestureDetector(
                      onScaleStart: (ScaleStartDetails details) {
                        if (isFullscreen) {
                          previousScale = scale;
                        }
                      },
                      onScaleUpdate: (ScaleUpdateDetails details) {
                        if (isFullscreen) {
                          setState(() {
                            scale = (previousScale * details.scale)
                                .clamp(1.0, 1.2); // Set zoom limits
                            // log("scale:$scale");
                          });
                        }
                      },
                      onScaleEnd: (ScaleEndDetails details) {
                        if (isFullscreen) {
                          previousScale = 1.0;
                        }
                      },
                      onTap: _hidecontrols,
                      child: AspectRatio(
                        aspectRatio: isFullscreen
                            ? MediaQuery.of(context).size.aspectRatio
                            : 16 / 9,
                        child: Container(
                          color: Colors.black,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Transform.scale(
                                scale: scale,
                                child: VlcPlayer(
                                  controller: vlcPlayerCtrl,
                                  aspectRatio: 16 / 9,
                                ),
                              ),
                              if (hidecontrols > 0)
                                AspectRatio(
                                  aspectRatio: isFullscreen
                                      ? (MediaQuery.of(context).size.width -
                                              MediaQuery.of(context)
                                                  .padding
                                                  .left -
                                              MediaQuery.of(context)
                                                  .padding
                                                  .right) /
                                          (MediaQuery.of(context).size.height -
                                              MediaQuery.of(context)
                                                  .padding
                                                  .top -
                                              MediaQuery.of(context)
                                                  .padding
                                                  .bottom)
                                      : 16 / 9,
                                  child: AnimatedOpacity(
                                    opacity: 0.7,
                                    duration: const Duration(milliseconds: 700),
                                    child: Container(
                                      color: const Color.fromARGB(144, 0, 0,
                                          0), // Semi-transparent grey
                                    ),
                                  ),
                                ),
                              // Opacity(
                              //   opacity: hidecontrols,
                              //   child: Row(
                              //     mainAxisAlignment:
                              //         MainAxisAlignment.spaceBetween,
                              //     children: [
                              //       const SizedBox(
                              //         width: 10,
                              //       ),
                              //       Opacity(
                              //         opacity: _buffering,
                              //         child: IconButton(
                              //           onPressed: () {
                              //             if (_buffering > 0 &&
                              //                 hidecontrols > 0) {
                              //               log("reverse 10");
                              //               if (vlcPlayerCtrl
                              //                   .value.isInitialized) {
                              //                 final currentPosition =
                              //                     vlcPlayerCtrl.value.position;
                              //                 final newPosition =
                              //                     currentPosition -
                              //                         const Duration(
                              //                             seconds: 10);
                              //                 vlcPlayerCtrl.seekTo(
                              //                     newPosition > Duration.zero
                              //                         ? newPosition
                              //                         : Duration.zero);
                              //               }
                              //             } else {
                              //               log("loading.....");
                              //             }
                              //           },
                              //           icon: const CircleAvatar(
                              //             backgroundColor: Colors.transparent,
                              //             child: Icon(
                              //               size: 30,
                              //               Icons.replay_10,
                              //               color: Colors.white,
                              //             ),
                              //           ),
                              //         ),
                              //       ),
                              //       VLCPlayerControls(
                              //         vlcPlayerCtrl: vlcPlayerCtrl,
                              //         isPlaying: isPlaying,
                              //         fetching: fetching,
                              //         hidecontrols: hidecontrols,
                              //         togglePlayPause: togglePlayPause,
                              //       ),
                              //       Opacity(
                              //         opacity: _buffering,
                              //         child: IconButton(
                              //           onPressed: () {
                              //             if (_buffering > 0 &&
                              //                 hidecontrols > 0) {
                              //               log("forward 10");
                              //               if (vlcPlayerCtrl
                              //                   .value.isInitialized) {
                              //                 final currentPosition =
                              //                     vlcPlayerCtrl.value.position;
                              //                 final totalDuration =
                              //                     vlcPlayerCtrl.value.duration;
                              //                 final newPosition =
                              //                     currentPosition +
                              //                         const Duration(
                              //                             seconds: 10);
                              //                 vlcPlayerCtrl.seekTo(
                              //                     newPosition < totalDuration
                              //                         ? newPosition
                              //                         : totalDuration);
                              //               }
                              //             } else {
                              //               log("loading...");
                              //             }
                              //           },
                              //           icon: const Icon(
                              //             size: 30,
                              //             Icons.forward_10,
                              //             color: Colors.white,
                              //           ),
                              //         ),
                              //       ),
                              //       const SizedBox(
                              //         width: 10,
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              // Positioned(
                              //   bottom: 0,
                              //   child: Opacity(
                              //     opacity: hidecontrols,
                              //     child: buildControls(),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ),
              isFullscreen
                  ? Container()
                  : Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: const Column(
                        children: [],
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildControls() {
    if (hidecontrols > 0) {
      String formatDuration(Duration duration) {
        String twoDigits(int n) => n.toString().padLeft(2, '0');
        final hours = duration.inHours;
        final minutes = twoDigits(duration.inMinutes.remainder(60));
        final seconds = twoDigits(duration.inSeconds.remainder(60));
        return hours > 0 ? "$hours:$minutes:$seconds" : "$minutes:$seconds";
      }

      return Container(
        padding: const EdgeInsets.all(5),
        width: MediaQuery.of(context).size.width,
        color: const Color.fromARGB(140, 38, 36, 36),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${formatDuration(currentPosition)} / ${formatDuration(totalDuration)}",
                style: const TextStyle(color: Colors.white),
              ),
            ),
            Expanded(
              child: Slider(
                value: totalDuration.inSeconds > 0
                    ? backupPosition.inMilliseconds
                        .toDouble() // Current position
                    : 0.0,
                min: 0.0,
                max: totalDuration.inMilliseconds > 0
                    ? totalDuration.inMilliseconds.toDouble() // Total duration
                    : 1.0,
                onChanged: (newValue) {
                  setState(() {
                    backupPosition = Duration(milliseconds: newValue.toInt());
                    if (totalDuration.inMilliseconds > 0) {
                      vlcPlayerCtrl.seekTo(backupPosition);
                    }
                  });
                },
                activeColor: Colors.red,
              ),
            ),
            IconButton(
              onPressed: showmenu,
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: toggleFullScreen,
              icon: isFullscreen
                  ? const Icon(
                      Icons.fullscreen_exit,
                      color: Colors.white,
                    )
                  : const Icon(
                      Icons.fullscreen,
                      color: Colors.white,
                    ),
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }

  void showmenu() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15),
        ),
      ),
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(119, 72, 70, 70),
            borderRadius: BorderRadius.circular(15),
          ),
          margin: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10)),
                      width: 60,
                      height: 7,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: showQuality,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
                            children: [
                              Icon(
                                Icons.tune,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Quality',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                currentStream.qualityLabel,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: Colors.white,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: playBackspeedsheet,
                    // onTap: () {
                    //   // log("speed:${vlcPlayerCtrl.value.playbackSpeed}");
                    //   playBackspeedsheet();
                    //   // vlcPlayerCtrl.setPlaybackSpeed(2);
                    // },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
                            children: [
                              Icon(
                                Icons.play_circle_outline_rounded,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Playback speed',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                "${vlcPlayerCtrl.value.playbackSpeed}x",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: Colors.white,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void playBackspeedsheet() {
    List<String> speed = ['0.5', '1', '1.5', '2'];
    Navigator.of(context).pop();
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15),
        ),
      ),
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(119, 72, 70, 70),
            borderRadius: BorderRadius.circular(15),
          ),
          margin: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(height: 10),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: 60,
                  height: 7,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 16, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Current speed',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${vlcPlayerCtrl.value.playbackSpeed}x',
                      style: const TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 240,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  itemBuilder: (BuildContext ctx, index) {
                    return InkWell(
                      customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      onTap: () => playbackspeed(double.parse(speed[index])),
                      child: Container(
                        height: 50,
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${speed[index]}x",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            if (vlcPlayerCtrl.value.playbackSpeed ==
                                double.parse(speed[index]))
                              Container(
                                height: 8,
                                width: 8,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                              )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext ctx, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: speed.length,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void playbackspeed(double value) {
    vlcPlayerCtrl.setPlaybackSpeed(value);
    Navigator.of(context).pop();
  }

  void showQuality() {
    Navigator.of(context).pop();
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      shape:   const RoundedRectangleBorder(
        borderRadius:  BorderRadius.vertical(
          top: Radius.circular(15),
        ),
      ),
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(119, 72, 70, 70),
            borderRadius: BorderRadius.circular(15),
          ),
          margin: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(height: 10),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: 60,
                  height: 7,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 16, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Quality of current video',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      currentStream.qualityLabel,
                      style: const TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 240,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  itemBuilder: (BuildContext ctx, index) {
                    return InkWell(
                      customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      onTap: () {
                        changeQuality(stream: videoOnlyStreams[index]);
                      },
                      child: Container(
                        height: 50,
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              videoOnlyStreams[index].qualityLabel,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            if (currentStream.qualityLabel ==
                                videoOnlyStreams[index].qualityLabel)
                              Container(
                                height: 8,
                                width: 8,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                              )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext ctx, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: videoOnlyStreams.length,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class PlayPause extends StatelessWidget {
  final ValueNotifier<bool?> isPlaying;
  final Function() togglePlay;

  const PlayPause({
    super.key,
    required this.isPlaying,
    required this.togglePlay,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(seconds: 1, milliseconds: 500),
      child: IconButton(
        icon: ValueListenableBuilder(
          valueListenable: isPlaying,
          builder: (context, value, child) => Icon(
            value == null
                ? Icons.replay
                : value == false
                    ? Icons.play_arrow
                    : Icons.pause,
            color: Colors.white,
            size: 50,
          ),
        ),
        onPressed: togglePlay,
      ),
    );
  }
}

class VLCPlayerControls extends StatelessWidget {
  final VlcPlayerController vlcPlayerCtrl;
  final ValueNotifier<bool?> isPlaying;
  final bool fetching;
  final double hidecontrols;
  final VoidCallback togglePlayPause;

  const VLCPlayerControls({
    super.key,
    required this.vlcPlayerCtrl,
    required this.isPlaying,
    required this.fetching,
    required this.hidecontrols,
    required this.togglePlayPause,
  });

  @override
  Widget build(BuildContext context) {
    return vlcPlayerCtrl.value.playingState == PlayingState.ended
        ? IconButton(
            onPressed: togglePlayPause,
            icon: const Icon(
              Icons.replay,
              size: 50,
              color: Colors.white,
            ),
          )
        : vlcPlayerCtrl.value.playingState == PlayingState.buffering || fetching
            ? const CircularProgressIndicator(
                color: Colors.white,
              )
            : PlayPause(
                isPlaying: isPlaying,
                togglePlay: () {
                  if (hidecontrols > 0) {
                    togglePlayPause();
                  } else {
                    // Add logic for invalid state if needed
                    debugPrint("invalid");
                  }
                },
              );
  }
}
