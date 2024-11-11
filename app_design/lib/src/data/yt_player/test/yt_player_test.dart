// import 'package:flutter_test/flutter_test.dart';
// // import 'package:yt_player/yt_player_platform_interface.dart';
// // import 'package:yt_player/yt_player_method_channel.dart';
// import 'package:plugin_platform_interface/plugin_platform_interface.dart';
// import 'package:yt_player/yt_player.dart';

// class MockYtPlayerPlatform
//     with MockPlatformInterfaceMixin
//     implements YtPlayerPlatform {}

// void main() {
//   final YtPlayerPlatform initialPlatform = YtPlayerPlatform.instance;

//   test('$MethodChannelYtPlayer is the default instance', () {
//     expect(initialPlatform, isInstanceOf<MethodChannelYtPlayer>());
//   });

//   test('getPlatformVersion', () async {
//     YtPlayer ytPlayerPlugin = const YtPlayer();
//     MockYtPlayerPlatform fakePlatform = MockYtPlayerPlatform();
//     YtPlayerPlatform.instance = fakePlatform;

//     expect(await ytPlayerPlugin.getPlatformVersion(), '42');
//   });
// }
