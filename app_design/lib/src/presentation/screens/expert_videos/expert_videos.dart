import 'package:app_design/src/presentation/controller/expert_videos_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpertVideos extends StatelessWidget {
  const ExpertVideos({super.key});

  @override
  Widget build(BuildContext context) {
    ExpertVideosController expertVideosController =
        Get.put(ExpertVideosController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Expert Videos',
          style: GoogleFonts.raleway(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false, // Hide the back button
      ),
      // body: ListView.builder(itemBuilder: (context, index) {
      //   return Padding(
      //     padding: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
      //     child: Container(
      //       color: Colors.amber,
      //       width: MediaQuery.of(context).size.width,
      //       child: Row(
      //         children: [
      //           const SizedBox(
      //             width: 10,
      //           ),
      //           Container(
      //             height: 120,
      //             width: 150,
      //             color: Colors.black,
      //           )
      //         ],
      //       ),
      //     ),
      //   );
      // }),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: expertVideosController.videos.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  height: 125,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey[50],
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          height: 100,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 2, top: 7),
                            child: Text(
                              expertVideosController.videos[index]["title"]!,
                              style: GoogleFonts.raleway(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.indigo),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.access_time_rounded,
                                      color: Colors.black,
                                      size: 10,
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      expertVideosController.videos[index]
                                              ["duration"]
                                          .toString(),
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    expertVideosController.videos[index]["date"]
                                        .toString(),
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
