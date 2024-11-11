import 'package:app_design/src/presentation/screens/doubts/doubts.dart';
import 'package:app_design/src/presentation/screens/home/home.dart';
import 'package:app_design/src/presentation/screens/notes/notes.dart';
import 'package:app_design/src/presentation/screens/settings/settings.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int pageIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final pages = [
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
        backgroundColor: Colors.white,
        body: pages[pageIndex],
        bottomNavigationBar: buildMyNavBar(context),
      ),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
          color: Color.fromRGBO(38, 50, 56, 1),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Row(
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
    );
  }
}
