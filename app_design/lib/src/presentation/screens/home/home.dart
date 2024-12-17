import 'package:app_design/src/presentation/controller/home_controller.dart';
import 'package:app_design/src/presentation/screens/home/widgets/custom_appbar.dart';
import 'package:app_design/src/presentation/screens/home/widgets/featured_courses_header.dart';
import 'package:app_design/src/presentation/screens/home/widgets/featured_courses_list.dart';
import 'package:app_design/src/presentation/screens/home/widgets/purchased_courses_widget.dart';
import 'package:app_design/src/presentation/screens/home/widgets/sliver_appbar_widget.dart';
import 'package:app_design/src/presentation/screens/home/widgets/user_widget.dart';
import 'package:app_design/src/presentation/screens/widgets/network_aware.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());

    return WillPopScope(
      onWillPop: () => homeController.onWillPop(context),
      child: const SafeArea(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.white,
          body: NetworkAware(
            child: Stack(
              children: [
                Column(
                  children: [
                    CustomAppbar(),
                    Expanded(
                      child: CustomScrollView(
                        slivers: [
                          SliverAppbarWidget(),
                          PurchasedCoursesWidget(),
                          FeaturedCoursesHeader(),
                          FeaturedCoursesList()
                        ],
                      ),
                    ),
                  ],
                ),
                UserWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
