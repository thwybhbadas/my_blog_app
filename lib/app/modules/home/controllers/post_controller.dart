import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_blog_app/app/modules/home/models/post_request_model.dart';
import 'package:my_blog_app/app/modules/home/providers/post_provider.dart';

class PostController extends GetxController {
  final storage = GetStorage();
  final PostProvider _provider = Get.find<PostProvider>();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  final RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    // Any actions to take when the controller is ready
  }

  @override
  void onClose() {
    titleController.dispose();
    contentController.dispose();
    super.onClose();
  }

  Future<void> createPost() async {
    _isLoading.value = true;

    final postRequestModel = PostReauestModel(
      title: titleController.text,
      content: contentController.text,
    );

    try {
      final response = await _provider.createPost(postRequestModel);

      if (response != null) {
        // Handle successful post creation
        Get.snackbar('Success', 'Post created successfully!');
        // Optionally navigate or perform other actions
      } else {
        Get.snackbar('Error', 'Failed to create post');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      _isLoading.value = false;
    }
  }
}