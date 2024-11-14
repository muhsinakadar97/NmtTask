import 'package:flutter/material.dart';
import 'package:yt_player/yt_player.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: YtPlayer(
          url: 'https://www.youtube.com/watch?v=NcDnmpvQ-Fk', FullScreen: (bool ) {  },
          // onEnterFullScreen: (isFullScreen) {
            
          // }, FullScreen: (bool ) {  },
          
        ),
      )),
    );
  }
}
