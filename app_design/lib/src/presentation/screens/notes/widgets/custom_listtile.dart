import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomListTile extends StatelessWidget {
  final String pdfImagePath; // Path to the PDF image
  final String topicName; // Topic name

  const CustomListTile(
      {super.key, required this.pdfImagePath, required this.topicName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Container(
            height: 100,
            decoration: BoxDecoration(
                color: Colors.blueGrey[50],
                borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      pdfImagePath, // Assuming the image is in your assets
                      width: 50, // Set your desired width
                      height: 50, // Set your desired height
                      fit: BoxFit.cover, // Adjust fit as needed
                    ),
                    Text(
                      topicName,
                      style: GoogleFonts.raleway(fontWeight: FontWeight.bold),
                    ),
                    const Icon(
                      Icons.download,
                      color: Colors.black,
                    ),
                  ],
                ),
                // leading: Image.asset(
                //   pdfImagePath, // Assuming the image is in your assets
                //   width: 50, // Set your desired width
                //   height: 50, // Set your desired height
                //   fit: BoxFit.cover, // Adjust fit as needed
                // ),
                // title: Text(
                //   topicName,
                //   style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                // ),
                // trailing: const Padding(
                //   padding: EdgeInsets.only(right: 20),
                //   child: Icon(Icons.download, color: Colors.black,),
                // ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
