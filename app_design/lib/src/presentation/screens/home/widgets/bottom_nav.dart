import 'package:app_design/src/core/config/theme/colors.dart';
import 'package:app_design/src/presentation/screens/home/home.dart';
import 'package:flutter/material.dart';

import '../../doubts/doubts.dart';
import '../../notes/notes.dart';
import '../../settings/settings.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int pageIndex = 0;

  final pages = [
    // Replace this with your actual Home widget
    const Home(),
    Notes(),
    Doubts(),
    const Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Return true to exit the app
        return true;
      },
      child: Scaffold(
        // Background color will apply only if no page content is shown
        // backgroundColor: Colors.green,
        body: pages[pageIndex], // Show the selected page
        bottomNavigationBar: Container(
          height: 60,
          decoration: const BoxDecoration(
            color: AppColors.buttonColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 0;
                  });
                },
                icon: pageIndex == 0
                    ? const Icon(
                        Icons.home_filled,
                        color: Colors.white,
                        size: 25,
                      )
                    : const Icon(
                        Icons.home_outlined,
                        color: Colors.white,
                        size: 25,
                      ),
              ),
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 1;
                  });
                },
                icon: pageIndex == 1
                    ? const Icon(
                        Icons.notes_rounded,
                        color: Colors.white,
                        size: 25,
                      )
                    : const Icon(
                        Icons.notes_outlined,
                        color: Colors.white,
                        size: 25,
                      ),
              ),
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 2;
                  });
                },
                icon: pageIndex == 2
                    ? const Icon(
                        Icons.question_answer_rounded,
                        color: Colors.white,
                        size: 25,
                      )
                    : const Icon(
                        Icons.question_answer_outlined,
                        color: Colors.white,
                        size: 25,
                      ),
              ),
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 3;
                  });
                },
                icon: pageIndex == 3
                    ? const Icon(
                        Icons.settings_rounded,
                        color: Colors.white,
                        size: 25,
                      )
                    : const Icon(
                        Icons.settings,
                        color: Colors.white,
                        size: 25,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
