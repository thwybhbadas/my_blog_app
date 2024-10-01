import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_blog_app/app/constants/conatans.dart';
import 'package:my_blog_app/app/modules/home/models/all_posts_respons_model.dart';
import 'package:my_blog_app/app/modules/profile/controllers/profile_controller.dart';
import 'package:my_blog_app/app/modules/profile/models/profile_respons_model.dart';
import 'package:my_blog_app/app/modules/profile/views/followers_list_page.dart';
import 'package:my_blog_app/app/modules/profile/views/following_list_page.dart';
import 'package:my_blog_app/app/modules/profile/views/my_posts_view.dart';
import 'package:my_blog_app/app/modules/profile/views/profile_view.dart';
import 'package:my_blog_app/app/routes/app_pages.dart';
import '../widgets/account_link_widget.dart';

class AccountView extends GetView<ProfileController> {
  final storage = GetStorage();
    // final Post post;

  
  AccountView( {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                'حسابي',
                style:
                    TextStyleConst.boldTextStyle(AppColors.primaryColore, 25),
              ),
              centerTitle: true,
              automaticallyImplyLeading: false,
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Obx(() {
                    if (controller.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return ProfileDetailsPage(
                          profile: controller.profileResponse.value);
                    }
                  }),

      //             Obx(
      //   () {
      //     if (controller.isLoading.value) {
      //       return const Center(child: CircularProgressIndicator());
      //     }

      //     return ListView.builder(
      //       itemCount: controller.posts.length,
      //       itemBuilder: (context, index) {
      //         Post post = controller.posts[index];
      //         return MyPostCard(post: post);
      //       },
      //     );
      //   },
      // ),
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
              ),
            )));
  }
}

class ProfileDetailsPage extends GetView<ProfileController> {
  final ProfileResponseModel? profile;
  final storage = GetStorage();
  ProfileDetailsPage({super.key, this.profile});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Obx(() => Stack(
           children: [
             CircleAvatar(
              radius: 40,
              backgroundColor: AppColors.secondaryColor,
              backgroundImage: controller.profileImagePath.value.isNotEmpty 
                  ? FileImage(File(controller.profileImagePath.value)) 
                  : null, // إذا لم يكن هناك صورة، لا تستخدم الخلفية
              child: controller.profileImagePath.value.isEmpty 
                  ? const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 50,
                    ) 
                  : null,
                     ), const SizedBox(height: 16),
                     
        Positioned(
      bottom: 0, // المسافة من الأسفل
      right: 0, // المسافة من اليمين
      child: IconButton(
        onPressed: () {
          controller.pickImage(); // اختيار الصورة
        },
        icon: const Icon(Icons.add_a_photo_rounded),
        color: Colors.white, // يمكنك تغيير لون الأيقونة
      ),
    ),
  ],
)),
       
        const SizedBox(height: 16),
        if (profile != null) ...[
          Text(
            profile!.username,
            style: TextStyleConst.smallTextStyle(AppColors.blackTextColor, 16),
          ),
          Text(
            profile!.name,
            style: TextStyleConst.smallTextStyle(AppColors.blackTextColor, 16),
          ),
          Text(
            profile!.email,
            style: TextStyleConst.smallTextStyle(AppColors.blackTextColor, 16),
          ),
        ] else ...[
          ElevatedButton(
            onPressed: () {
              Get.to(() => ProfileView());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'إنشاء الملف الشخصي',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ],
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Obx(() => Text(
                      '${controller.followersProfiles.length}', // الرقم
                      style: TextStyleConst.smallTextStyle(
                          AppColors.primaryColore, 16),
                    )),
                SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: () => Get.to(() => const FollowersListPage()),
                  child: Text(
                    'متابع', // النص
                    style: TextStyleConst.smallTextStyle(
                        AppColors.primaryColore, 16),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Row(
              children: [
                Obx(() => Text(
                      '${controller.followingProfiles.length}', // الرقم
                      style: TextStyleConst.smallTextStyle(
                          AppColors.primaryColore, 16),
                    )),
                SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: () => Get.to(() => const FollowingListPage()),
                  child: Text(
                    'يتابع', // النص
                    style: TextStyleConst.smallTextStyle(
                        AppColors.primaryColore, 16),
                  ),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
