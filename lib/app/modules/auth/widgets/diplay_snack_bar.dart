import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_blog_app/app/constants/colors.dart';
import 'package:my_blog_app/app/constants/conatans.dart';

class DisplaySnackBar {
  static displaySnackBar(String content, [int? sec, Color? bgColor]) {
    Get.rawSnackbar(
      backgroundColor: bgColor ?? AppColors.redColor ,
      messageText: Text(
        content,
        style: TextStyleConst.mediumTextStyle(Colors.white, 15),
      ),
      borderRadius: 5,
      duration: Duration(seconds: sec ?? 3),
      margin: const EdgeInsets.all(10),
      dismissDirection: DismissDirection.horizontal,
    );
  }
}