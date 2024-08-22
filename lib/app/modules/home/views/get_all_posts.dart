// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:my_blog_app/app/modules/home/controllers/all_posts_controller.dart';

// class PostListView extends GetView<AllPostsController> {
//   const PostListView({super.key});


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Posts')),
     
//       body: Obx(() {
//         if (controller.isLoading) {
//           return Center(child: CircularProgressIndicator());
//         }
        
//         if (controller.posts.isEmpty) {
//           return Center(child: Text('No posts available'));
//         }

//         return ListView.builder(
//           itemCount: controller.posts.length,
//           itemBuilder: (context, index) {
//             final post = controller.posts[index];
//             return ListTile(
//               title: Text(post.title ?? 'No Title'),
//               subtitle: Text(post.content ?? 'No Content'),
//               leading: post.image != null ? Image.network(post.image!) : null,
//               onTap: () {
//                 // Action on tap, e.g. navigate to details
//               },
//             );
//           },
//         );
//   }),
//       );
//   }
// }