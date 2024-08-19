import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_blog_app/app/modules/home/controllers/post_controller.dart';

class CreatePostView extends GetView<PostController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Title Input Field
            TextField(
              controller: controller.titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 16),
            // Content Input Field
            TextField(
              controller: controller.contentController,
              decoration: InputDecoration(labelText: 'Content'),
              minLines: 5,
              maxLines: 10,
            ),
            SizedBox(height: 16),
            // Submit Button
            Obx(() {
              if (controller.isLoading) {
                return Center(child: CircularProgressIndicator());
              }
              return ElevatedButton(
                onPressed: controller.createPost,
                child: Text('Submit'),
              );
            }),
            // Status Message (optional)
            Obx(() {
              if (controller.isLoading) {
                return SizedBox.shrink(); // Hide when loading
              }
              return SizedBox.shrink(); // Optional message can be added
            }),
          ],
        ),
      ),
    );
  }
}