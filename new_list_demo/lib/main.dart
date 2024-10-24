import 'package:flutter/material.dart';
import 'package:new_list_demo/demo1/item_selector.dart';
import 'package:new_list_demo/demo2/list_demo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: ListDemo(),
    );
  }
}
