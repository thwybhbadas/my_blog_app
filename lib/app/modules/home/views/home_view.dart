import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_blog_app/app/constants/conatans.dart';
import 'package:my_blog_app/app/modules/home/controllers/controllers.dart';
import 'package:my_blog_app/app/modules/home/models/all_posts_respons_model.dart';
import 'package:my_blog_app/app/modules/home/views/post_detail_view.dart';
import 'package:my_blog_app/app/modules/home/widgets/main_drawer_widget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          'مُدونتي',
          style: TextStyleConst.boldTextStyle(AppColors.primaryColore, 25),
        ),
        centerTitle: true,
      ),
      drawer: MainDrawerWidget(),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.posts.isEmpty) {
          return const Center(child: Text('No posts available'));
        }

        return ListView.builder(
          itemCount: controller.posts.length,
          itemBuilder: (context, index) {
            Post post = controller.posts[index];
            return PostCard(
              post: post,
            );
          },
        );
      }),
    ));
  }
}

class PostCard extends StatelessWidget {
  final Post post;
  final storage = GetStorage();
  final HomeController controller = Get.find();

  PostCard({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // الانتقال إلى صفحة تفاصيل المنشور باستخدام Get.to
        Get.to(()=>PostDetailView(post: post));
      },
      child: Column(
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
                        post.user.profile?.username ??
                            'None', // Handle null profile
                        style: TextStyleConst.mediumTextStyle(
                            AppColors.blackTextColor, 15),
                      ),
                      const SizedBox(height: 5.0),
                    ],
                  ),
                ),
                storage.read('user_id') != post.user.id
                    ? Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 9, vertical: 9),
                        decoration: BoxDecoration(
                            color: controller.isUserFollowed(post.user.id)
                                ? AppColors.secondaryColor
                                : AppColors.primaryColore,
                            borderRadius: BorderRadius.circular(40)),

                        // disabledColor: Get.theme.focusColor,

                        child: InkWell(
                          onTap: () {
                            controller.isUserFollowed(post.user.id)
                                ? controller.unfollowUser(post.user.id)
                                : controller.followUser(post.user.id);
                          },
                          child: Text(
                              controller.isUserFollowed(post.user.id)
                                  ? 'إلغاء المتابعة'
                                  : 'متابعة',
                              style: controller.isUserFollowed(post.user.id)
                                  ? TextStyleConst.forgotTextStyle(
                                      AppColors.blackTextColor, 14)
                                  : TextStyleConst.forgotTextStyle(
                                      AppColors.whiteTextColor, 14)),
                        ))
                    : Container(),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          InkWell(
            onDoubleTap: () => controller.isPostLiked(post.id)
                ? controller.unlikePost(post.id)
                : controller.likePost(post.id),
            // onTap: ()=>,
            child: Container(
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
      ),
    );
  }
}

class LikePostCard extends StatelessWidget {
  final LikePost post;
  final HomeController controller = Get.find();
  LikePostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'None', // Handle null profile
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 5.0),
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
    );
  }
}
