import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_blog_app/app/constants/colors.dart';

import '../controllers/root_controller.dart';

class RootView extends GetView<RootController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Obx(
        () => controller.screens[controller.selectedIndex],
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: const BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                spreadRadius: 1,
                offset: Offset(0.0, 0.75),
              ),
            ]),
        child: Obx(
          () => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Color(0xFF01B7F1),
            unselectedItemColor: Color(0xFFA1A1A1),
            selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            currentIndex: controller.selectedIndex,
            onTap: controller.onTap,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: 'الصفحة الرئيسية'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.post_add), label: 'منشور جديد'),
              BottomNavigationBarItem(
                  icon:Icon( Icons.person_outline), label: 'الإعدادات'),
           
            ],
          ),
        ),
      ),
    );
  }
}