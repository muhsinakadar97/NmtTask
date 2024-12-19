import 'package:app_design/src/core/data_state/data_state.dart';
import 'package:app_design/src/presentation/controller/item_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ItemController>();
    controller.fetchItems();

    return Scaffold(
      appBar: AppBar(title: const Text("Items")),
      body: Obx(() {
        final state = controller.state.value;

        if (state.state == DataStateType.initial) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.state == DataStateType.failure) {
          return Center(
              child: Text(
                  state.data?.fold((l) => l.message, (r) => "") ?? "Error"));
        } else if (state.state == DataStateType.success) {
          return ListView(
            children: state.data?.fold(
                    (l) => [],
                    (r) => r
                        .map((item) => ListTile(title: Text(item)))
                        .toList()) ??
                [],
          );
        }
        return const SizedBox();
      }),
    );
  }
}
