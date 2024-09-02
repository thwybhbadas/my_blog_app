// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:my_blog_app/app/modules/home/controllers/all_posts_controller.dart';
// import 'package:my_blog_app/app/modules/home/models/all_posts_respons_model.dart';

// class PostListView extends GetView<AllPostsController> {
//   const PostListView({super.key});


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Posts')),
     
//       body: Obx(() {
//         if (controller.isLoading.value) {
//           return Center(child: CircularProgressIndicator());
//         }
        
//         if (controller.posts.isEmpty) {
//           return Center(child: Text('No posts available'));
//         }

//         return ListView.builder(
//           itemCount: controller.posts.length,
//             itemBuilder: (context, index) {
//               Post post = controller.posts[index];
//               return PostCard(post: post);
//           },
//         );
//   }),
//       );
//   }
// }
// class PostCard extends StatelessWidget {
//   final Post post;

//   const PostCard({super.key, required this.post});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(8.0), // Use ScreenUtil for padding
//       child: Card(
//         elevation: 5,
//         child: Padding(
//           padding: EdgeInsets.all(10.0), // Use ScreenUtil for padding
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // CircleAvatar(
//               //   radius: 25.r, // Use ScreenUtil for radius
//               //   backgroundColor: Colors.blue, // Background color of the circle
//               //   child: Icon(
//               //     Icons.person, // Icon to display
//               //     color: Colors.white, // Color of the icon
//               //     size: 40.sp, // Use ScreenUtil for icon size
//               //   ),
//               // ),
//               SizedBox(width: 10.0), // Use ScreenUtil for spacing
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       post.title,
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16, // Use ScreenUtil for font size
//                       ),
//                     ),
//                     SizedBox(height: 5.0), // Use ScreenUtil for spacing
//                     Container(
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                           image: NetworkImage(
//                               'http://myblog.mobaen.com/storage/public/${post.image}'),
//                           fit: BoxFit
//                               .fill, // You can adjust the fit property as needed
//                         ),
//                       ),
//                       height: 200.0, // Use ScreenUtil for height
//                       width: double.infinity,
//                     ),
//                     SizedBox(height: 5.0), // Use ScreenUtil for spacing
//                     Text(
//                       post.content,
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     SizedBox(height: 5.0), // Use ScreenUtil for spacing
//                     Text(
//                       post.createdAt,
//                       style: TextStyle(color: Colors.grey),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
