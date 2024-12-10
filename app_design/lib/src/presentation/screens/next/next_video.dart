import 'package:app_design/src/presentation/screens/next/widgets/header.dart';
import 'package:app_design/src/presentation/screens/next/widgets/video_list.dart';
import 'package:flutter/material.dart';

class NextVideo extends StatelessWidget {
  const NextVideo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        NextVideoHeader(),
        VideoList(),
      ],
    );
  }
}
