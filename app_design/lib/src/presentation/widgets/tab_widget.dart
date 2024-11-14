import 'package:app_design/src/presentation/controller/tabbar_custom_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TabWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isSelected; // Add this line
  final int index;

  const TabWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.index,
    this.isSelected = false, // Default value for isSelected
  });

  @override
  Widget build(BuildContext context) {
    TabbarSecondController tabbarCustomController =
        Get.put(TabbarSecondController());
    return Obx(
      () => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: tabbarCustomController.selectedIndex.value == index
                  ? Colors.white
                  : Colors.black,
              size:
                  tabbarCustomController.selectedIndex.value == index ? 15 : 10,
            ),
            Text(
              title,
              style: GoogleFonts.raleway(
                color: tabbarCustomController.selectedIndex.value == index
                    ? Colors.white
                    : Colors.black,
                fontSize: tabbarCustomController.selectedIndex.value == index
                    ? 14
                    : 13,
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
    );
  }
}
