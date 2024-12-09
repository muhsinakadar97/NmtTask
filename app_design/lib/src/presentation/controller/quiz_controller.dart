import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizController extends GetxController {
  RxBool isReset = false.obs;
  RxInt currentScore = 0.obs;
  var shadowColor = const Color(0xFF7986CB); 
  var quizQuestionsList = [
    {
      'qno': 1,
      'question': 'What is a datatype?',
      'options': {'A': 'Class', 'B': 'Function', 'C': 'Structure', 'D': 'Variable'},
      'correctAnswer': 'C' // Correct answer for question 1
    },
    {
      'qno': 2,
      'question': 'Which is a primitive datatype?',
      'options': {'A': 'int', 'B': 'String', 'C': 'List', 'D': 'Map'},
      'correctAnswer': 'A' // Correct answer for question 2
    },
    {
      'qno': 3,
      'question': 'Which is a primitive datatype?',
      'options': {'A': 'int', 'B': 'String', 'C': 'List', 'D': 'Map'},
      'correctAnswer': 'A' // Correct answer for question 2
    },
    {
      'qno': 4,
      'question': 'Which is a primitive datatype?',
      'options': {'A': 'int', 'B': 'String', 'C': 'List', 'D': 'Map'},
      'correctAnswer': 'A' // Correct answer for question 2
    },
    {
      'qno': 5,
      'question': 'Which is a primitive datatype?',
      'options': {'A': 'int', 'B': 'String', 'C': 'List', 'D': 'Map'},
      'correctAnswer': 'A' // Correct answer for question 2
    },
    {
      'qno': 6,
      'question': 'What is a datatype?',
      'options': {'A': 'Class', 'B': 'Function', 'C': 'Structure', 'D': 'Variable'},
      'correctAnswer': 'C' // Correct answer for question 1
    },
    {
      'qno': 7,
      'question': 'Which is a primitive datatype?',
      'options': {'A': 'int', 'B': 'String', 'C': 'List', 'D': 'Map'},
      'correctAnswer': 'A' // Correct answer for question 2
    },
    {
      'qno': 8,
      'question': 'Which is a primitive datatype?',
      'options': {'A': 'int', 'B': 'String', 'C': 'List', 'D': 'Map'},
      'correctAnswer': 'A' // Correct answer for question 2
    },
    {
      'qno': 9,
      'question': 'Which is a primitive datatype?',
      'options': {'A': 'int', 'B': 'String', 'C': 'List', 'D': 'Map'},
      'correctAnswer': 'A' // Correct answer for question 2
    },
    {
      'qno': 10,
      'question': 'Which is a primitive datatype?',
      'options': {'A': 'int', 'B': 'String', 'C': 'List', 'D': 'Map'},
      'correctAnswer': 'A' // Correct answer for question 2
    },
  ];

  RxList<String?> selectedAnswers = RxList<String?>(List.filled(2, null));
  RxBool isQuizStarted = false.obs;
  var score = Rx<int?>(null); // Reactive score

  // Initialize selected answers
  void initializeAnswers() {
    selectedAnswers.value = List.filled(quizQuestionsList.length, null);
  }

  // Handle answer selection
  void selectAnswer(int index, String answer) {
    selectedAnswers[index] = answer;
  }

  // Calculate Score
  int calculateScore() {
    int score = 0;
    for (int i = 0; i < quizQuestionsList.length; i++) {
      if (quizQuestionsList[i]['correctAnswer'] == selectedAnswers[i]) {
        score += 1;
      }
    }
    currentScore.value = score;
    log("currentScore.value => ${currentScore.value}");
    return currentScore.value;
    
  }

 // Reset the values
  resetQuiz() {
    isReset.value = true;
    log("Resetting the quiz");
    selectedAnswers.value = List.filled(quizQuestionsList.length, null);
    score.value = 0; // Reset the score to zero 
    currentScore.value = 0;
    return currentScore.value;
  }
}


