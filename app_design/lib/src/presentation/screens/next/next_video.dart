import 'package:app_design/src/presentation/screens/next/widgets/header.dart';
import 'package:app_design/src/presentation/screens/next/widgets/video_list.dart';
import 'package:app_design/src/presentation/screens/widgets/network_aware.dart';
import 'package:flutter/material.dart';

class NextVideo extends StatelessWidget {
  const NextVideo({super.key});

  @override
  Widget build(BuildContext context) {
    return const NetworkAware(
      child: Column(
        children: [
          NextVideoHeader(),
          VideoList(),
        ],
      ),
    );
  }
}
