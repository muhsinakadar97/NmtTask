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
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: expertVideosController.videos.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey[50],
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(7),
                        child: Container(
                          height: 100,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: const Icon(Icons.play_arrow, color: Colors.white,),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 2,top: 7),
                            child: Text(
                              expertVideosController.videos[index]["title"]!,
                              style: GoogleFonts.raleway(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo
                              ),
                              // style: const TextStyle(
                                // fontSize: 16,
                                // fontWeight: FontWeight.bold,
                                // color: Colors.indigo
                              // ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Column(
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
                                    expertVideosController.videos[index]["duration"]
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
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,)
                    
              
              ],
            );
            // return Column(
            //   children: [
            //     Container(
            //       color: Colors.amber[100],
            //       child: Row(
            //         children: [
            //           Container(
            //             height: 150,
            //             width: MediaQuery.of(context).size.width / 2,
            //             color: Colors.black,
            //             child: const Center(
            //               child: Icon(
            //                 Icons.play_arrow,
            //                 color: Colors.white,
            //                 size: 50, // Increase icon size for better visibility
            //               ),
            //             ),
            //           ),
            //           const SizedBox(width: 20),
            //           Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Padding(
            //                 padding: const EdgeInsets.only(left: 2),
            //                 child: Text(
            //                   expertVideosController.videos[index]["title"]!,
            //                   style: const TextStyle(
            //                     fontSize: 16,
            //                     fontWeight: FontWeight.bold,
            //                     color: Colors.indigo
            //                   ),
            //                 ),
            //               ),
            //               const SizedBox(
            //                 height: 20,
            //               ),
            //               Column(
            //                 children: [
            //                   Row(
            //                     children: [
            //                       const Icon(
            //                         Icons.access_time_rounded,
            //                         color: Colors.black,
            //                         size: 10,
            //                       ),
            //                       const SizedBox(
            //                         width: 4,
            //                       ),
            //                       Text(
            //                         expertVideosController.videos[index]["duration"]
            //                             .toString(),
            //                         style: const TextStyle(fontSize: 14),
            //                       ),
            //                     ],
            //                   ),
            //                   const SizedBox(
            //                     height: 5,
            //                   ),

            //                       Padding(
            //                         padding: const EdgeInsets.only(left: 5),
            //                         child: Text(
            //                           expertVideosController.videos[index]["date"]
            //                               .toString(),
            //                           style: const TextStyle(fontSize: 14),
            //                         ),
            //                       ),
            //                 ],
            //               ),
            //             ],
            //           ),
            //         ],
            //       ),
            //     ),
            //     SizedBox(height: 10,)
            //   ],
            // );
          },
        ),
      ),
    );
  }
}
