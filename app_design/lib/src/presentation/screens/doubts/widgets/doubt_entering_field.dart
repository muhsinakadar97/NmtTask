import 'package:app_design/src/presentation/controller/doubts_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DoubtEnteringField extends StatelessWidget {
  const DoubtEnteringField({super.key});

  @override
  Widget build(BuildContext context) {
    DoubtsController doubtsController = Get.find<DoubtsController>();
    return TextField(
      maxLength: 300,
      maxLines: null,
      cursorColor: Colors.blueGrey[900],
      controller: doubtsController.doubtTextController,
      decoration: InputDecoration(
        hintText: 'Ask your doubts here...',
        hintStyle: TextStyle(color: Colors.blueGrey[100]),
        counterText: "",
        focusedBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: Color.fromRGBO(38, 50, 56, 1), width: 2),
          borderRadius: BorderRadius.circular(10.0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color.fromRGBO(38, 50, 56, 1)),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 10.0,
        ),
      ),
      style: GoogleFonts.raleway(),
      // onChanged: (text) {
      //   // Call the updateText method with the new text
      //   doubtsController.updateText(text);
      // },
    );
  }
}
