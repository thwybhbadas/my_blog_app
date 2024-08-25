import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_blog_app/app/constants/conatans.dart';
import 'package:my_blog_app/app/modules/home/controllers/all_posts_controller.dart';
import 'package:my_blog_app/app/modules/home/models/all_posts_respons_model.dart';
import 'package:my_blog_app/app/modules/home/widgets/main_drawer_widget.dart';

class HomeView extends GetView<AllPostsController> {
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
      ),
      drawer: MainDrawerWidget(),
      body: Obx(() {
        if (controller.isLoading) {
          return Center(child: CircularProgressIndicator());
        }

        if (controller.posts.isEmpty) {
          return Center(child: Text('No posts available'));
        }

        return ListView.builder(
          itemCount: controller.posts.length,
          itemBuilder: (context, index) {
            Post post = controller.posts[index];
            return PostCard(post: post);
          },
        );
      }),
    ));
  }
}

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // CircleAvatar(
        //   radius: 25, // Use ScreenUtil for radius
        //   backgroundColor: Colors.blue, // Background color of the circle
        //   child: Icon(
        //     Icons.person, // Icon to display
        //     color: Colors.white, // Color of the icon
        //     size: 40, // Use ScreenUtil for icon size
        //   ),
        // ),
        // Use ScreenUtil for spacing
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16, // Use ScreenUtil for font size
                      ),
                    ),
                    SizedBox(height: 5.0),
                    // Use ScreenUtil for spacing
                    if (post.image.isNotEmpty)
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                'http://myblog.mobaen.com/storage/public/${post.image}'),
                            fit: BoxFit.fill,
                          ),
                        ),
                        height: 200.0,
                        width: double.infinity,
                      ),
                    // Container(
                    //   decoration: BoxDecoration(
                    //     image: DecorationImage(
                    //       image: NetworkImage(
                    //           'http://myblog.mobaen.com/storage/public/${post.image}'),
                    //       fit: BoxFit
                    //           .fill, // You can adjust the fit property as needed
                    //     ),
                    //   ),
                    //   height: 200.0, // Use ScreenUtil for height
                    //   width: double.infinity,
                    // ),
                    if (post.image.isNotEmpty) SizedBox(height: 5.0),
                    Text(
                      post.content,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 5.0), // Use ScreenUtil for spacing
                    Text(
                      post.createdAt,
                      style: TextStyle(color: Colors.grey),
                    ),
                    Row(
                      children: [
                        Icon(Icons.favorite_outline,),
                          Icon(Icons.save,),
                            Icon(Icons.share,)
                      ],
                    )
                  ],
                ),
              ),
              Divider(),
            ],
          ),
        ),
      ],
    );
  }
}
