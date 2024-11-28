import 'package:app_design/src/core/config/theme/colors.dart';
import 'package:app_design/src/data/models/course.dart';
import 'package:app_design/src/presentation/controller/home_controller.dart';
import 'package:app_design/src/presentation/screens/home/widgets/slider_widget.dart';
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
      child: SafeArea(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    color: AppColors.buttonColor,
                  ),
                  Expanded(
                    child: CustomScrollView(
                      slivers: [
                        const SliverAppBar(
                          backgroundColor: Colors.white,
                          automaticallyImplyLeading: false,
                          expandedHeight: 200.0,
                          floating: true,
                          flexibleSpace: FlexibleSpaceBar(
                            background: SliderWidget(),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 20),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Your Courses",
                                    style: GoogleFonts.raleway(
                                      color: Colors.blueGrey[900],
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, bottom: 20),
                                  child: Container(
                                    height: 220,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                              Colors.blueGrey.withOpacity(0.4),
                                          blurRadius: 5,
                                          spreadRadius: 3,
                                          offset: const Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: SizedBox(
                                            height: 130,
                                            width: double.infinity,
                                            child: Image.asset(
                                              homeController.courseList[1]
                                                  ['logo'],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 20, right: 20),
                                          child: Container(
                                            height: 1.3,
                                            width: double.infinity,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 20, right: 20),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                homeController.courseList[1]
                                                    ['rate'],
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
                                                  color: AppColors.buttonColor,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      color: Colors.blueGrey,
                                                      blurRadius: 5,
                                                      spreadRadius: 1,
                                                      offset: Offset(0, 3),
                                                    ),
                                                  ],
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "Explore",
                                                    style: GoogleFonts.raleway(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Row(
                            children: [
                              const SizedBox(width: 20),
                              Text(
                                "Featured Courses",
                                style: GoogleFonts.raleway(
                                  color: Colors.indigo[900],
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
                              Course course = homeController.courses[index];

                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 30, right: 30, top: 20),
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        homeController.onCourseTapped(index);
                                      },
                                      child: Container(
                                        height: 280,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.blueGrey
                                                  .withOpacity(0.4),
                                              blurRadius: 5,
                                              spreadRadius: 3,
                                              offset: const Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 20, left: 20),
                                                  child: Text(
                                                    course.courseName,
                                                    style: GoogleFonts.raleway(
                                                      color:
                                                          Colors.blueGrey[800],
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 20, right: 20),
                                                  child: Container(
                                                    height: 30,
                                                    width: 60,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      color:
                                                          AppColors.amberColor,
                                                    ),
                                                    child: const Center(
                                                      child: Text(
                                                        "New",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20, right: 20, top: 10),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20),
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
                                              padding: const EdgeInsets.only(
                                                  top: 10, left: 20, right: 20),
                                              child: Container(
                                                height: 1.3,
                                                width: double.infinity,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10, left: 20, right: 20),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    course.rate,
                                                    style: GoogleFonts.raleway(
                                                      fontSize: 23,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color:
                                                          Colors.blueGrey[800],
                                                    ),
                                                  ),
                                                  Container(
                                                      height: 50,
                                                      width: 180,
                                                      decoration: BoxDecoration(
                                                        color: AppColors
                                                            .buttonColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        boxShadow: const [
                                                          BoxShadow(
                                                            color:
                                                                Colors.blueGrey,
                                                            blurRadius: 5,
                                                            spreadRadius: 1,
                                                            offset:
                                                                Offset(0, 3),
                                                          ),
                                                        ],
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          "Explore",
                                                          style: GoogleFonts
                                                              .raleway(
                                                            color: Colors.white,
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      )),
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
                            childCount: homeController.courses.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                right: 20,
                top: 30,
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Icon(
                    Icons.person,
                    size: 40,
                    color: AppColors.buttonColor.withOpacity(0.15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
