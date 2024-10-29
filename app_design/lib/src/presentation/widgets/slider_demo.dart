// import 'package:app_design/src/presentation/controller/home_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderDemo extends StatelessWidget {
  const SliderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    // HomeController homeController = Get.put(HomeController());

    // Sample list of image URLs
    final List<String> imgList = [
      'assets/images/download1.jpeg',
      'assets/images/download2.jpeg',
      'assets/images/download1.jpeg',
    ];

    return CarouselSlider.builder(
        itemCount: imgList.length,
        itemBuilder: (context, index, realIndex) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                imgList[index],
                fit: BoxFit.cover,
                
              ),
            ),
          );
        },
        options: CarouselOptions(
          height: 200,
          autoPlay: true,
          enlargeCenterPage: true,
          aspectRatio: 16/9,
          onPageChanged: (index, reason) {
            // You can handle page change if needed
          },
        ),
      
    );
  }
}
