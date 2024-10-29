import 'package:app_design/src/presentation/controller/faq_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Faq extends StatelessWidget {
  const Faq({super.key});

  @override
  Widget build(BuildContext context) {
    FaqController faqController = Get.put(FaqController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'FAQ',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false, // Hide the back button
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: ListView.builder(
          
          padding: const EdgeInsets.all(20),
          itemCount: faqController.faqList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: GestureDetector(
                onTap: () {
                  faqController.toggleExpansion(index);
                },
                child: Obx(() => Container(
                      width: MediaQuery.of(context).size.width - 40,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey[50],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                faqController.faqList[index]["question"]!,
                                style: GoogleFonts.poppins(fontSize: 20,
                                  fontWeight: FontWeight.bold)
                              ),
                              Icon(Icons.arrow_drop_down, color: Colors.black,)
                            ],
                          ),
                          // Show answer only if the item is expanded
                          faqController.isExpandedList[index]
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: SingleChildScrollView(
                                        child: Text(
                                          faqController.faqList[index]["answer"]!,
                                          style: GoogleFonts.poppins(fontSize: 16),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    )),
              ),
            );
          },
        ),
      ),
    );
  }
}
