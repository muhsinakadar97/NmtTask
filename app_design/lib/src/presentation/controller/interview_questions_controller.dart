import 'package:get/get.dart';

class InterviewQUestionsController extends GetxController {
  final List<Map<String, String>> interviewQuestionsList = const [
    {"question": "What are local variables and global\nvariables in Python?", "answer": "Global Variables: Variables declared outside a function or in a global space are called global variables. These variables can be accessed by any function in the program.\n\nLocal Variables: Any variable declared inside a function is known as a local variable. This variable is present in the local space and not in the global space."},
    {"question": "When to use a tuple vs list vs\ndictionary in Python?", "answer": "Use a tuple to store a sequence of items that will not change. \nUse a list to store a sequence of items that may change.\nUse a dictionary when you want to associate pairs of two items."},
    {"question": "What is GetX?", "answer": "GetX is a state management solution in Flutter. GetX is a state management solution in Flutter."},
    {"question": "What is Dart?", "answer": "Dart is a programming language optimized for apps. Dart is a programming language optimized for apps."},
    {"question": "What is JavaScript?", "answer": "JavaScript is a programming language for web development. JavaScript is a programming language for web development."},
  ];

  // List to track the expansion state of each item
  var isExpandedList = <bool>[].obs;

  // Initialize the expansion states
  @override
  void onInit() {
    super.onInit();
    initializeExpansionStates(interviewQuestionsList.length);
  }

  void initializeExpansionStates(int count) {
    isExpandedList.value = List.filled(count, false);
  }

  // Toggle the expansion state of a specific FAQ item
  void toggleExpansion(int index) {
    isExpandedList[index] = !isExpandedList[index];
  }
}
