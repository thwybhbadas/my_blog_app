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
          ),
        child: Obx(
          () => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.primaryColore,
            unselectedItemColor: AppColors.secondaryColor,
            selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            currentIndex: controller.selectedIndex,
            onTap: controller.onTap,
            items:  [
              BottomNavigationBarItem(
                  icon: Container(
                    padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: controller.selectedIndex == 0
                        ? AppColors.secondaryColor
                        :null,
                    shape: BoxShape.circle,
                  ),
                    child: Icon(Icons.home_outlined)), label: 'الصفحة الرئيسية'),
              BottomNavigationBarItem(
                  icon: Container(padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: controller.selectedIndex == 1
                        ? AppColors.secondaryColor
                        :null,
                    shape: BoxShape.circle,
                  ),
                  
                      child: Icon(Icons.post_add)), label: 'منشور جديد'),
              BottomNavigationBarItem(
                  icon:Container(
                    padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: controller.selectedIndex == 2
                        ? AppColors.secondaryColor
                        :null,
                    shape: BoxShape.circle,
                  ),
                    child: Icon( Icons.person_outline)), label: 'حسابي'),
           
            ],
          ),
        ),
      ),
    );
  }
}