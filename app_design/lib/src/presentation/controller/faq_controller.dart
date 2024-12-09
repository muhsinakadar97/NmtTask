import 'package:get/get.dart';

class FaqController extends GetxController {
  final List<Map<String, String>> faqList = const [
    {"question": "What is Python?", "answer": "Python is an interpreted, object-oriented, high-level programming language with dynamic semantics. Its high-level built in data structures, combined with dynamic typing and dynamic binding, make it very attractive for Rapid Application Development, as well as for use as a scripting or glue language to connect existing components together.\nPython's simple, easy to learn syntax emphasizes readability and therefore reduces the cost of program maintenance. Python supports modules and packages, which encourages program modularity and code reuse. The Python interpreter and the extensive standard library are available in source or binary form without charge for all major platforms, and can be freely distributed."},
    {"question": "What is Flutter?", "answer": "Flutter is an open-source UI software development kit. Flutter is an open-source UI software development kit."},
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
    initializeExpansionStates(faqList.length);
  }

  // initialize state of each expansion tile
  void initializeExpansionStates(int count) {
    isExpandedList.value = List.filled(count, false);
  }

  // Toggle the expansion state of a specific FAQ item
  void toggleExpansion(int index) {
    isExpandedList[index] = !isExpandedList[index];
  }
}
