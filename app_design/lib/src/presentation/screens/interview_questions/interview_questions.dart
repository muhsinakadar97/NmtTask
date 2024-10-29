import 'package:app_design/src/presentation/controller/interview_questions_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class InterviewQuestions extends StatelessWidget {
  const InterviewQuestions({super.key});

  @override
  Widget build(BuildContext context) {
    InterviewQUestionsController interviewQUestionsController = Get.put(InterviewQUestionsController());

    return Scaffold(
       backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Interview Questions',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false, // Hide the back button
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: ListView.builder(
          
          padding: const EdgeInsets.all(20),
          itemCount: interviewQUestionsController.interviewQuestionsList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: GestureDetector(
                onTap: () {
                  interviewQUestionsController.toggleExpansion(index);
                },
                child: Obx(() => Container(
                      width: MediaQuery.of(context).size.width - 40,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey[50],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                interviewQUestionsController.interviewQuestionsList[index]["question"]!,
                                style: GoogleFonts.poppins(fontSize: 16,
                                  fontWeight: FontWeight.bold)
                              ),
                              const Icon(Icons.arrow_drop_down, color: Colors.black,)
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          // Show answer only if the item is expanded
                          interviewQUestionsController.isExpandedList[index]
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: SingleChildScrollView(
                                        child: Text(
                                          interviewQUestionsController.interviewQuestionsList[index]["answer"]!,
                                          style: GoogleFonts.poppins(fontSize: 16),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    )),
              ),
            );
          },
        ),
      ),
    );
  }
}
