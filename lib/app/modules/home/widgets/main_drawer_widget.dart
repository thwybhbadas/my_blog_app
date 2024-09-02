/*
 * Copyright (c) 2020 .
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_blog_app/app/constants/colors.dart';
import 'package:my_blog_app/app/constants/conatans.dart';
import 'package:my_blog_app/app/modules/auth/widgets/main_btn_widget.dart';
import 'package:my_blog_app/app/modules/home/controllers/controllers.dart';
import 'package:my_blog_app/app/modules/profile/controllers/profile_controller.dart';
import 'package:my_blog_app/app/modules/profile/models/profile_respons_model.dart';
import 'package:my_blog_app/app/modules/root/controllers/root_controller.dart';
import 'package:my_blog_app/app/routes/app_pages.dart';
import 'drawer_link_widget.dart';

class MainDrawerWidget extends StatelessWidget {
  final ProfileController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: ListView(
          children: [
            ProfileDetailsPage(profile: controller.profileResponse.value),

            const SizedBox(height: 25),
            DrawerLinkWidget(
              icon: Icons.home_outlined,
              text: 'الرئيسية',
              onTap: (e) async {
                Get.back();
                Get.find<RootController>().onTap(0);
              },
            ),

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
              onTap: (e) {
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
              onTap: (e) {
// Get.find<HomeController>().allfavorites();
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
              text: "تسجيل الخروج",
              onTap: (e) {
                // Get.find<HomeController>().signout();
                // Get.offAllNamed(Route.SIGNIN);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileDetailsPage extends StatelessWidget {
  final ProfileResponseModel? profile;
  final storage = GetStorage();
  ProfileDetailsPage({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    // final ProfileController controller = Get.find();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: AppColors.secondaryColor,
            child: profile == null
                ? const Icon(
                    Icons.person, // Icon to display
                    color: Colors.white, // Color of the icon
                    size: 40,
                  )
                : null,
          ),
          const SizedBox(width: 5),
          if (profile != null) ...[
            Column(
              children: [
                Text(
                  profile!.username,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  profile!.email,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w300),
                ),
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: AppColors.primaryColore,
            ),
          ] else ...[
            // ElevatedButton(
            //   onPressed: () {
            //     Get.toNamed(Routes.PROFILE);
            //   },
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Colors.blueAccent,
            //     padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //   ),
            //   child: const Text(
            //     'إنشاء الملف الشخصي',
            //     style: TextStyle(fontSize: 18, color: Colors.white),
            //   ),
            // ),

            MaterialButton(
              onPressed: () {
                Get.toNamed(Routes.PROFILE);
              },
              padding: EdgeInsets.symmetric(horizontal: 9, vertical: 9),
              color: AppColors.primaryColore, disabledElevation: 0,
              // disabledColor: Get.theme.focusColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
              elevation: 0,
              child: Text(
                'إنشاء الملف الشخصي',
                style: TextStyleConst.mediumTextStyle(
                    AppColors.whiteTextColor, 20),
              ),
            ),
          ],
          // const SizedBox(height: 16),
        ],
      ),
    );
  }
}