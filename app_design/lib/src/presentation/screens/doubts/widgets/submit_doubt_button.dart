import 'package:app_design/src/presentation/controller/doubts_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SubmitDoubtButton extends StatelessWidget {
  const SubmitDoubtButton({super.key});

  @override
  Widget build(BuildContext context) {
    DoubtsController doubtsController = Get.find<DoubtsController>();

    return GestureDetector(
      onTap: () {
        doubtsController.submitDoubt(context); // Call submit method
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.blueGrey[900],
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(
              "SUBMIT DOUBT",
              style: GoogleFonts.raleway(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
