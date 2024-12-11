// import 'package:app_design/src/presentation/controller/home_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // HomeController homeController = Get.put(HomeController());

    // Sample list of image URLs
    final List<String> imgList = [
      'assets/images/carousel1.jpg',
      'assets/images/carousel2.jpg',
      'assets/images/carousel1.jpg',
    ];

    return CarouselSlider.builder(
        itemCount: imgList.length,
        itemBuilder: (context, index, realIndex) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(0),
            child: SizedBox(
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
          viewportFraction: 1,
          onPageChanged: (index, reason) {
            // You can handle page change if needed
          },
        ),
      
    );
  }
}
