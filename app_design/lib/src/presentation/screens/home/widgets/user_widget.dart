import 'package:app_design/src/core/config/theme/colors.dart';
import 'package:flutter/material.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 20,
      top: 30,
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Icon(
          Icons.person,
          size: 40,
          color: AppColors.buttonColor.withOpacity(0.15),
        ),
      ),
    );
  }
}
