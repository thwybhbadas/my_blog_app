import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_blog_app/app/constants/conatans.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Image.asset('assets/images/splash.png'),
      ),
    );
  }
}
