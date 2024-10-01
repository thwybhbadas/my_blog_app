import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_blog_app/app/constants/conatans.dart';
import 'package:my_blog_app/app/modules/home/controllers/controllers.dart';
import 'package:my_blog_app/app/modules/home/models/all_posts_respons_model.dart'; // تأكد من استيراد النموذج

class PostDetailView extends StatelessWidget {
  final Post post;
  final storage = GetStorage();
  final HomeController controller = Get.find();
  PostDetailView({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
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
                child: Image.network(
                    'http://myblog.mobaen.com/storage/public/${post.image}'),
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
        ),
      ),
    );
  }
}
