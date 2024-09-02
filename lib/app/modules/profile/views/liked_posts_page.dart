import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_blog_app/app/modules/home/models/all_posts_respons_model.dart';
import 'package:my_blog_app/app/modules/home/providers/home_provider.dart';
import 'package:my_blog_app/app/modules/home/views/views.dart';
import 'package:my_blog_app/app/modules/profile/controllers/profile_controller.dart';
import 'package:my_blog_app/app/modules/profile/provides/profile_provider.dart';

class LikedPostsPage extends GetView<ProfileController> {
  const LikedPostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text('المنشورات المفضلة')),
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: controller.likedPosts.length,
            itemBuilder: (context, index) {
              LikePost post = controller.likedPosts[index];
              return LikePostCard(post: post);
            },
          );
        },
      ),
    );
  }
}
