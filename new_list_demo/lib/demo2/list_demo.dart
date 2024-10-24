import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:new_list_demo/demo2/list_demo_controller.dart';

class ListDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ListDemoController listDemoController = Get.put(ListDemoController());
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView Example"),
      ),
      body: Column(
        children: [
          // Container with aspect ratio
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              color: Colors.black,
              child: const Center(
                child: Icon(
                  Icons.play_arrow_rounded,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
          ),
          // ListView
          Expanded(
            child: ListView.builder(
              controller: listDemoController.scrollController,
              itemCount: listDemoController.chapters.length,
              itemBuilder: (context, index) {
                return Obx(() => ListTile(
                  tileColor: listDemoController.selectedIndex.value == index? Colors.red[200] : Colors.red[50],
                  title: Padding(
                    padding: const EdgeInsets.only(top: 15, left: 20),
                    child: Text(listDemoController.chapters[index]['chapterName'].toString()),
                  ),
                  onTap: () {
                    listDemoController.onItemTapped(index);
                  },
                ));
              },
            ),
          ),
        ],
      ),
    );
  }

  
}
