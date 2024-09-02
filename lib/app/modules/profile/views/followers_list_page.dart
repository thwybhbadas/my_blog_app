import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_blog_app/app/constants/conatans.dart';
import 'package:my_blog_app/app/modules/profile/controllers/profile_controller.dart';

class FollowersListPage extends StatelessWidget {
  const FollowersListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'المتابعون',
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

        if (profileController.followerProfiles.isEmpty) {
          return const Center(child: Text('لا يوجد متابعون.'));
        }

        return ListView.builder(
          itemCount: profileController.followerProfiles.length,
          itemBuilder: (context, index) {
            final follower = profileController.followerProfiles[index];

            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blueAccent,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              title: Text(follower?.username ?? 'Unknown User'),
              subtitle: Text(follower?.name ?? 'No Name'),
              onTap: () {
                if (follower != null) {
                  // Get.to(() => FollowerProfilePage(userId: follower.id));
                }
              },
            );
          },
        );
      }),
    );
  }
}
