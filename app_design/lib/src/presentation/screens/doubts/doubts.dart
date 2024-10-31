import 'package:app_design/src/presentation/controller/doubts_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Doubts extends StatelessWidget {
  final DoubtsController doubtsController = Get.put(DoubtsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                maxLength: 300,
                maxLines: null,
                cursorColor: Colors.blueGrey[900],
                controller: doubtsController.doubtTextController,
                decoration: InputDecoration(
                  hintText: 'Ask your doubts here...',
                  hintStyle: TextStyle(color: Colors.blueGrey[100]),
                  counterText: "",
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color.fromRGBO(38, 50, 56, 1), width: 2),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: const Color.fromRGBO(38, 50, 56, 1)),
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
              ),
              SizedBox(height: 20.0),
               Obx(
              () => doubtsController.isDoubtEmpty.value
                  ? SizedBox()
                  : Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.blueGrey[50],
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 20, right: 20),
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
            ),
            GestureDetector(
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
            ),
            ],
          ),
        ),
      ),
    );
  }
}
