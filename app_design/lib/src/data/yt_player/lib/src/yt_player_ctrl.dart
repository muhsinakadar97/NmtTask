// import 'dart:developer';

// import 'package:flutter_vlc_player/flutter_vlc_player.dart';
// import 'package:youtube_explode_dart/youtube_explode_dart.dart';

// class YtPlayerController {
//   late AudioOnlyStreamInfo currentAudioStream;
//   late VideoOnlyStreamInfo currentStream;
//   List<VideoOnlyStreamInfo> videoOnlyStreams = [];
//   late VlcPlayerController vlcPlayerCtrl;

//   Future<bool> initiallize({required String url}) async {
//     final yt = YoutubeExplode();
//     try {
//       // Extract the video ID from the provided URL
//       var videoId = VideoId(url);
//       log("videoId:$videoId");

//       log("vdo:${videoId.value}");
//       // Fetch video streams
//       var video = await yt.videos.streamsClient.getManifest(videoId);
//       log("video:$video");

//       currentAudioStream = video.audioOnly.withHighestBitrate();
//       log('currentAudioOnlyStream:$currentAudioStream');

//       final seenResolutions = <int>{};

//       videoOnlyStreams = video.videoOnly.where((streamInfo) {
//         final resolution = streamInfo.videoResolution;
//         final mimeType = streamInfo.codec.mimeType;

//         // Log stream info for debugging
//         log('Processing stream: ${streamInfo.qualityLabel}, MIME type: $mimeType, Height: ${resolution.height}');

//         // Check if the stream's container is mp4 and its height matches any of the specified resolutions
//         if (mimeType == 'video/mp4' &&
//             (resolution.height == 1080 ||
//                 resolution.height == 720 ||
//                 resolution.height == 480 ||
//                 resolution.height ==
//                     360) && // Add any additional relevant heights
//             !seenResolutions.contains(resolution.height) &&
//             !streamInfo.qualityLabel.contains('HDR')) {
//           // Exclude HDR formats

//           seenResolutions
//               .add(resolution.height); // Add the resolution to the set
//           return true;
//         } else {
//           return false;
//         }
//       }).toList();

//       currentStream = videoOnlyStreams.firstWhere(
//           (stream) => stream.qualityLabel == '480p',
//           orElse: () => videoOnlyStreams.last); // by default 360p
//       log("current stream:$currentStream");

//       log("url of currentstream:${currentStream.url.toString()}");

//       vlcPlayerCtrl = VlcPlayerController.network(
//         currentStream.url.toString(),
//         autoPlay: true,
//         autoInitialize: true,
//       );
//       vlcPlayerCtrl.addOnInitListener(() {
//         log("external initialization");
//         vlcPlayerCtrl.addAudioFromNetwork(currentAudioStream.url.toString());
//       });

//       return true;
//     } catch (e) {
//       log("Error in initialization:$e");
//       return false;
//     }
//   }
// }
