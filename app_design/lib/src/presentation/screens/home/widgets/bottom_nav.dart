import 'package:app_design/src/core/config/theme/colors.dart';
import 'package:app_design/src/presentation/screens/doubts/doubts.dart';
import 'package:app_design/src/presentation/screens/home/home.dart';
import 'package:app_design/src/presentation/screens/home/widgets/navbar_widget.dart';
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
        bottomNavigationBar: NavBarWidget(
            pageIndex: pageIndex,
            onPageChanged: (index) {
              setState(() {
                pageIndex = index;
              });
            }),
      ),
    );
  }
}
