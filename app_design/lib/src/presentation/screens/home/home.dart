// lib/src/presentation/screens/home/home.dart

import 'dart:developer';
import 'package:app_design/src/data/models/course.dart';
import 'package:app_design/src/presentation/controller/home_controller.dart';
import 'package:app_design/src/presentation/screens/course_overview/course_overview.dart';
import 'package:app_design/src/presentation/widgets/slider_demo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
   

    return WillPopScope(
      onWillPop: () => homeController.onWillPop(context),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              const SliverAppBar(
                backgroundColor: Colors.white,
                automaticallyImplyLeading: false,
                expandedHeight: 250.0,
                floating: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: SliderDemo(),
                ),
              ),
              SliverToBoxAdapter(
                child: Row(
                  children: [
                    const SizedBox(width: 20),
                    Text(
                      "Featured Courses",
                      style: GoogleFonts.raleway(
                        color: Colors.black,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    // Get the current course from the course list
                    Course course = homeController.courses[index];

                    return Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              log("Selected Item => ${course.courseName}");

                              homeController.selectedItemName.value = course.courseName;
                              homeController.selectedImage.value = course.logo;
                              homeController.currentIndex.value = index;
                              Get.to(const CourseOverview());
                            },
                            child: Container(
                              height: 280,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.blueGrey.withOpacity(0.4),
                                    blurRadius: 5,
                                    spreadRadius: 3,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20, left: 20),
                                        child: Text(
                                          course.courseName,
                                          style: GoogleFonts.raleway(
                                            color: Colors.blueGrey[800],
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20, right: 20),
                                        child: Container(
                                          height: 30,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            color: Colors.blueGrey[100],
                                          ),
                                          child: const Center(
                                            child: Text(
                                              "New",
                                              style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: SizedBox(
                                        height: 130,
                                        width: double.infinity,
                                        child: Image.asset(
                                          course.logo,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                                    child: Container(
                                      height: 1.3,
                                      width: double.infinity,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          course.rate,
                                          style: GoogleFonts.raleway(
                                            fontSize: 23,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.blueGrey[800],
                                          ),
                                        ),
                                        Container(
                                          height: 50,
                                          width: 180,
                                          decoration: BoxDecoration(
                                            color: Colors.blueGrey[100],
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Explore",
                                              style: GoogleFonts.raleway(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  childCount: homeController.courseList.length,
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

