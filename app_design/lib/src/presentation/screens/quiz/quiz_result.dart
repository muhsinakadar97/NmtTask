import 'package:app_design/src/presentation/controller/quiz_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizResult extends StatelessWidget {
  final int score;

  QuizResult({required this.score});

  @override
  Widget build(BuildContext context) {
    QuizController quizController = Get.put(QuizController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz Result"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() =>
               quizController.currentScore.value == 5 ? const Text("Congratulations!!! you have got full marks!!!", style: TextStyle(fontSize: 20, color: Colors.green),) : SizedBox(),
            ),
            const SizedBox(height: 10,),
            const Text(
              "Your Score:",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Obx(
              () => Text(
                "${ quizController.currentScore }/ ${Get.find<QuizController>().quizQuestionsList.length}",
                // quizController.isReset.value
                //     ? "0"
                //     : "$score / ${Get.find<QuizController>().quizQuestionsList.length}",
                style: const TextStyle(fontSize: 22),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(
                  top: 30, bottom: 20, left: 20, right: 20),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(15)),
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Center(
                    child: Text(
                      "BACK TO QUIZ",
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
    );
  }
}
