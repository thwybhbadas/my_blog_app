import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_blog_app/app/modules/create_post/model/post_create_model.dart';
import 'package:my_blog_app/app/modules/create_post/provider/create_post_provider.dart';
import 'package:my_blog_app/app/modules/home/models/all_posts_respons_model.dart';
import 'package:my_blog_app/app/routes/routes.dart';

class CreatePostController extends GetxController {
  var posts = <Post>[].obs;
  var isLoading = true.obs;
  var selectedImage = Rx<File?>(null);

  final PostProvider postProvider=Get.put(PostProvider());

  CreatePostController();

  void createPosts(PostCreateModel post) async {
    try {
      isLoading(true);
      var respons = await postProvider.createPost(post);
      print(post);
      print(respons.body);
      if (respons.status.isOk) {
        Get.offAllNamed(Routes.HOME);
        Get.snackbar('Success', 'Post created successfully');
      } else {
        Get.snackbar('Error', 'Failed to create post');
      }
    } finally {
      isLoading(false);
    }
  }

  Future<void> pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      selectedImage(File(pickedFile.path));
    } else {
      Get.snackbar('Error', 'No image selected');
    }
  }
}
