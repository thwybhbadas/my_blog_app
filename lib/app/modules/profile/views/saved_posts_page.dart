import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_blog_app/app/constants/conatans.dart';
import 'package:my_blog_app/app/modules/home/controllers/controllers.dart';
import 'package:my_blog_app/app/modules/home/views/home_view.dart';
import 'package:my_blog_app/app/modules/profile/controllers/profile_controller.dart';

import '../../home/models/all_posts_respons_model.dart';

class SavedPostsPage extends GetView<ProfileController> {
  const SavedPostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'المحفوظات',
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
              return PostCard(post: post);
            },
          );
        },
      ),
    );
  }
}
class PostCard extends StatelessWidget {
  final LikePost post;

  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.blue,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          // post.user.profile?.name ?? 
                          'None',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 5.0),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.isUserFollowed(post.pivot.userId)
                          ? controller.unfollowUser(post.pivot.userId)
                          : controller.followUser(post.pivot.userId);
                    },
                    child: Text(controller.isUserFollowed(post.pivot.userId)
                        ? 'Unfollow'
                        : 'Follow'),
                  ),
                ],
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
                height: 200.0,
                width: double.infinity,
              ),
              const SizedBox(height: 10.0),
              Text(
                post.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 5.0),
              Text(
                post.content,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 5.0),
              Text(
                post.createdAt,
                style: const TextStyle(color: Colors.grey),
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
      ),
    );
  }
}
