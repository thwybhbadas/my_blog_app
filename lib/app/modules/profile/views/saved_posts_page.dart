import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_blog_app/app/constants/conatans.dart';
import 'package:my_blog_app/app/modules/home/providers/home_provider.dart';
import 'package:my_blog_app/app/modules/home/views/home_view.dart';
import 'package:my_blog_app/app/modules/profile/controllers/profile_controller.dart';
import 'package:my_blog_app/app/modules/profile/provides/profile_provider.dart';

import '../../home/models/all_posts_respons_model.dart';

class SavedPostsPage extends GetView<ProfileController> {
  const SavedPostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'المفضلة',
          style: TextStyleConst.boldTextStyle(AppColors.primaryColore, 25),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: controller.savedPosts.length,
            itemBuilder: (context, index) {
              LikePost post = controller.savedPosts[index];
              return LikePostCard(post: post);
            },
          );
        },
      ),
    );
  }
}
