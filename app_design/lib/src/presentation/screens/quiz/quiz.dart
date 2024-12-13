import 'dart:developer';

import 'package:app_design/src/presentation/controller/quiz_controller.dart';
import 'package:app_design/src/presentation/screens/quiz/quiz_result.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Quiz extends StatelessWidget {
  const Quiz({super.key});

  @override
  Widget build(BuildContext context) {
    QuizController quizController = Get.put(QuizController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Quiz',
          style: GoogleFonts.raleway(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false, // Hide the back button
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text(
                "Topic : Datatypes",
                style: GoogleFonts.raleway(),
              ),
              Text(
                "Total no of questions : ${quizController.quizQuestionsList.length}",
                style: GoogleFonts.raleway(),
              ),
              Text(
                "Maximum Marks : ${quizController.quizQuestionsList.length} (1 for each question)",
                style: GoogleFonts.raleway(),
              ),
              const SizedBox(height: 50),
              Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.blueGrey[900],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: GestureDetector(
                  onTap: () {
                    log("Quiz Started!!!");
                    quizController.initializeAnswers(); // Initialize answers
                    quizController.isQuizStarted.value = true;
                    log("quizController.isQuizStarted.value => ${quizController.isQuizStarted.value}");
                  },
                  child: Center(
                    child: Text(
                      "START QUIZ",
                      style: GoogleFonts.raleway(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Obx(() => quizController.isQuizStarted.value
                  ? Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 40),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey[100],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount:
                                  quizController.quizQuestionsList.length,
                              itemBuilder: (context, index) {
                                final question =
                                    quizController.quizQuestionsList[index];
                                // String? selectedAnswer =
                                //     quizController.selectedAnswers[index];

                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0, horizontal: 16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Q${question['qno']}: ${question['question']}',
                                        style: GoogleFonts.raleway(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                        // style: TextStyle(
                                        //     fontWeight: FontWeight.bold),
                                      ),
                                      if (question['options'] != null &&
                                          question['options']
                                              is Map<String, String>) ...[
                                        ...['A', 'B', 'C', 'D'].map((option) {
                                          final options = question['options']
                                              as Map<String, String>;
                                          return Obx(() => Row(
                                                children: [
                                                  Radio<String>(
                                                    activeColor: Colors.indigo,
                                                    value: option,
                                                    groupValue: quizController
                                                        .selectedAnswers[index],
                                                    onChanged: (value) {
                                                      quizController
                                                          .selectAnswer(
                                                              index, value!);
                                                    },
                                                  ),
                                                  Text(
                                                    '$option : ${options[option]}',
                                                    style: GoogleFonts.raleway(
                                                        fontSize: 15),
                                                  ),
                                                ],
                                              ));
                                        }),
                                      ]
                                    ],
                                  ),
                                );
                              },
                            ),
                            // Display Score
                            Obx(() {
                              return quizController.score.value != null
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Your Score: ${"${quizController.currentScore} / ${Get.find<QuizController>().quizQuestionsList.length}"}",
                                        style: GoogleFonts.raleway(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.pink),
                                      ),
                                    )
                                  : const SizedBox();
                            }),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 50, left: 20, right: 20),
                              child: GestureDetector(
                                onTap: () {
                                  int score = quizController.resetQuiz();
                                  quizController.score.value = score;
                                  log("Quiz Submitted! Your score: $score");
                                  // Get.to(QuizResult(score: score));
                                },
                                child: Container(
                                  height: 50,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.indigo,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "RESET QUIZ",
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // Submit Button
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 30, bottom: 20, left: 20, right: 20),
                              child: GestureDetector(
                                onTap: () {
                                  log("Quiz Submitted");
                                  int score = quizController.calculateScore();
                                  quizController.score.value = score;
                                  log("Quiz Submitted! Your score: $score");
                                  Get.to(QuizResult(score: score));
                                },
                                child: Container(
                                  height: 50,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.indigo,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "SUBMIT QUIZ",
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : const SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
