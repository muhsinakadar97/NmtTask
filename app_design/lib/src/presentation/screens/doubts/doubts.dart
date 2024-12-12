import 'package:app_design/src/presentation/controller/doubts_controller.dart';
import 'package:app_design/src/presentation/screens/doubts/widgets/doubt_entering_field.dart';
import 'package:app_design/src/presentation/screens/doubts/widgets/submit_doubt_button.dart';
import 'package:app_design/src/presentation/screens/doubts/widgets/view_posted_doubt.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Doubts extends StatelessWidget {
  final DoubtsController doubtsController = Get.put(DoubtsController());

  Doubts({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => doubtsController.onWillPop(context),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Doubts",
            style: GoogleFonts.raleway(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
          automaticallyImplyLeading: false,
        ),
        body: const SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DoubtEnteringField(),
                SizedBox(height: 20.0),
                ViewPostedDoubt(),
                SubmitDoubtButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
