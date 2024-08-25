/*
 * Copyright (c) 2020 .
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_blog_app/app/modules/home/controllers/controllers.dart';
import 'package:my_blog_app/app/modules/root/controllers/root_controller.dart';
import 'drawer_link_widget.dart';

class MainDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
         
          SizedBox(height: 20),
          DrawerLinkWidget(
            icon: Icons.home_outlined,
            text: "Home".tr,
            onTap: (e) async {
              Get.back();
               Get.find<RootController>().onTap(0);
            },),
         
          // DrawerLinkWidget(
          //   icon: Icons.folder_special_outlined,
          //   text: "Specialities".tr,
          //   onTap: (e) {
          //     Get.offAndToNamed(Routes.SPECIALITIES);
          //   },
          // ),
          DrawerLinkWidget(
            icon: Icons.assignment_outlined,
            text: "منشوراتي",
            onTap: (e)  {
              Get.back();
               Get.find<RootController>().onTap(1);
            },
          ),
          DrawerLinkWidget(
            icon: Icons.group_outlined,
            text: "متابعيني".tr,
            onTap: (e) async {
              Get.back();
              Get.find<RootController>().onTap(2);
            },
          ),
         
          DrawerLinkWidget(
            icon: Icons.favorite_outline,
            text: "المفضلة".tr,
            onTap: (e)  {
              //  Get.offAndToNamed(Routes.FAVORITES);
            },
          ),
        
        
       
        
        
        
          // DrawerLinkWidget(
          //   icon: Icons.translate_outlined,
          //   text: "Languages".tr,
          //   onTap: (e) async {
          //     await Get.offAndToNamed(Routes.SETTINGS_LANGUAGE);
          //   },
          // ),
          // DrawerLinkWidget(
          //   icon: Icons.brightness_6_outlined,
          //   text: Get.isDarkMode ? "Light Theme".tr : "Dark Theme".tr,
          //   onTap: (e) async {
          //     await Get.offAndToNamed(Routes.SETTINGS_THEME_MODE);
          //   },
          // ),
        
        
          
         DrawerLinkWidget(
                icon: Icons.logout,
                text: "Logout".tr,
                onTap: (e)  {
                   Get.find<HomeController>().signout();
                  // Get.offAllNamed(Route.SIGNIN);
                  
                },
              ),
           
         
         
        ],
      ),
    );
  }
}
