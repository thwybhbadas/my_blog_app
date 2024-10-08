import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_blog_app/app/constants/conatans.dart';
import 'package:my_blog_app/app/modules/profile/controllers/profile_controller.dart';

class AllProfilesView extends GetView<ProfileController> {
  const AllProfilesView({super.key});

  @override
Widget build(BuildContext context) {
    final ProfileController profileController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ألمشتركون',
          style: TextStyleConst.boldTextStyle(AppColors.primaryColore, 25),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: Obx(() {
        if (profileController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (profileController.all_Profiles.isEmpty) {
          return const Center(child: Text('لا يوجد متابعون.'));
        }

        return ListView.builder(
          itemCount: profileController.all_Profiles.length,
          itemBuilder: (context, index) {
            final profile = profileController.all_Profiles[index];

            return ListTile(
              leading: const CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.secondaryColor,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 25,
                ),
              ),
              title: Text(profile?.username ?? 'مستخدم غير معروف'),
              subtitle: Text(profile?.name ?? 'لا يوجد اسم'),
              onTap: () {
                // if (follower != null) {
                //   Get.to(() => FollowerProfilePage(userId: follower.id));
                // }
              },
            );
          },
        );
      }),
    );
  }
}
