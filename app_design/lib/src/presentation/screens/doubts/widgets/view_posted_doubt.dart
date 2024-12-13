import 'package:app_design/src/presentation/controller/doubts_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewPostedDoubt extends StatelessWidget {
  const ViewPostedDoubt({super.key});

  @override
  Widget build(BuildContext context) {
    DoubtsController doubtsController = Get.find<DoubtsController>();

    return Obx(
      () => doubtsController.isDoubtEmpty.value
          ? const SizedBox()
          : Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.blueGrey[50],
                    borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Column(
                    children: [
                      Text(
                        "POSTED DOUBT",
                        style: GoogleFonts.raleway(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey[900]),
                        overflow: TextOverflow.clip,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        doubtsController.doubtText.value,
                        style: GoogleFonts.raleway(color: Colors.blueGrey[900]),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
