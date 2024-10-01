import 'package:flutter/material.dart';
import 'package:my_blog_app/app/constants/conatans.dart';

class OnboardingWidget extends StatelessWidget {
  
final String title;
final String description;
final String imagePath;
 OnboardingWidget({super.key, required this.title, required this.description, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath,height: 350,),
          SizedBox(height: 16),
          Text(
            title,
          style: TextStyleConst.boldTextStyle(AppColors.blackTextColor, 25),
          ),
          SizedBox(height: 8),
          Text(
            description,
          style: TextStyleConst.mediumTextStyle(AppColors.blackTextColor, 15),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}