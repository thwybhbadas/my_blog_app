import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_blog_app/app/constants/conatans.dart';
import 'package:my_blog_app/app/modules/home/controllers/controllers.dart';
import 'package:my_blog_app/app/modules/profile/controllers/profile_controller.dart';

import '../../home/models/all_posts_respons_model.dart';

class MyPostsView extends GetView<ProfileController> {
  const MyPostsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   appBar: AppBar(
      //   title: Text(
      //     'منشوراتي',
      //     style: TextStyleConst.boldTextStyle(AppColors.primaryColore, 25),
      //   ),
      //   centerTitle: true,
      //   automaticallyImplyLeading: false,
      //   elevation: 0,
      // ),
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: controller.posts.length,
            itemBuilder: (context, index) {
              Post post = controller.posts[index];
              return MyPostCard(post: post);
            },
          );
        },
      ),
    );
  }
}
class MyPostCard extends StatelessWidget {
  final Post post;
  final HomeController controller = Get.find();
    final ProfileController profilecontroller = Get.find();


  MyPostCard({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.secondaryColor,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 25,
                ),
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.user.profile?.name ?? 'None', // Handle null profile
                      style: TextStyleConst.mediumTextStyle(
                          AppColors.blackTextColor, 15),
                    ),
                    const SizedBox(height: 5.0),
                  ],
                ),
              ),
              TextButton(onPressed: (){
                profilecontroller.deletePost(post.id);
              }, child: Text('delete')),
              
            ],
          ),
        ),
        const SizedBox(height: 10.0),
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'http://myblog.mobaen.com/storage/public/${post.image}'),
              fit: BoxFit.cover,
            ),
          ),
          height: 300,
          width: double.infinity,
        ),
        const SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.title,
                style: TextStyleConst.forgotTextStyle(
                    AppColors.blackTextColor, 15),
              ),
              const SizedBox(height: 5.0),
              Text(
                post.content,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyleConst.mediumTextStyle(
                    AppColors.blackTextColor, 13),
              ),
              const SizedBox(height: 5.0),
              Text(
                post.createdAt,
                style: TextStyleConst.hintTextStyle(Colors.grey),
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      controller.isPostLiked(post.id)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: controller.isPostLiked(post.id)
                          ? Colors.red
                          : Colors.grey,
                    ),
                    onPressed: () {
                      controller.isPostLiked(post.id)
                          ? controller.unlikePost(post.id)
                          : controller.likePost(post.id);
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      controller.isPostFavorited(post.id)
                          ? Icons.bookmark
                          : Icons.bookmark_border,
                      color: controller.isPostFavorited(post.id)
                          ? Colors.blue
                          : Colors.grey,
                    ),
                    onPressed: () {
                      controller.isPostFavorited(post.id)
                          ? controller.unsavePost(post.id)
                          : controller.savePost(post.id);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}