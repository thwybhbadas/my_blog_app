import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_blog_app/app/constants/conatans.dart';
import 'package:my_blog_app/app/modules/profile/controllers/profile_controller.dart';
import 'package:my_blog_app/app/modules/profile/widgets/account_link_widget.dart';
import 'package:my_blog_app/app/routes/routes.dart';

class SettingsView extends GetView<ProfileController> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    decoration: const BoxDecoration(),
                    child: Column(
                      children: [
                        AccountLinkWidget(
                          icon: const Icon(
                            Icons.person_outline,
                            color: AppColors.primaryColore,
                          ),
                          text: "تعديل ملفي الشخصي",
                          onTap: (e) {
                            Get.toNamed(Routes.PROFILE);
                          },
                        ),
                        AccountLinkWidget(
                          icon: const Icon(
                            Icons.assignment_outlined,
                            color: AppColors.primaryColore,
                          ),
                          text: "منشوراتي",
                          onTap: (e) {
                            Get.toNamed(Routes.MYPOSTS);
                            // controller.myPosts();
                          },
                        ),
                       
                        AccountLinkWidget(
                          icon: const Icon(
                            Icons.favorite_outline,
                            color: AppColors.primaryColore,
                          ),
                          text: "المفضلة",
                          onTap: (e) {
                            Get.toNamed(Routes.LIKEDPOSTS);
                          },
                        ),
                        AccountLinkWidget(
                          icon: const Icon(
                            Icons.bookmark_border_outlined,
                            color: AppColors.primaryColore,
                          ),
                          text: "المحفوظات",
                          onTap: (e) {
                            Get.toNamed(Routes.SAVEDPOSTS);
                          },
                        ),
                        AccountLinkWidget(
                          icon: const Icon(
                            Icons.people_alt_outlined,
                            color: AppColors.primaryColore,
                          ),
                          text: "جميع المشتركين",
                          onTap: (e) {
                            Get.toNamed(Routes.ALLPROFILES);
                          },
                        ),
                         AccountLinkWidget(
                          icon: const Icon(
                            Icons.favorite_outline,
                            color: AppColors.primaryColore,
                          ),
                          text: "الخصوصية وسياسة الاستخدام",
                          onTap: (e) {
                            Get.toNamed(Routes.LIKEDPOSTS);
                          },
                        ),
                        AccountLinkWidget(
                          icon: const Icon(
                            Icons.logout,
                            color: AppColors.primaryColore,
                          ),
                          
                          text: "تسجيل الخروج",
                          onTap: (e) async {
                            Get.find<ProfileController>().signout();
                          },
                        ),
                      ],
                    ),
                  ),
      ],
    );
  }
}