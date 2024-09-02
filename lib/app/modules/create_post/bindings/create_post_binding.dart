import 'package:get/get.dart';
import 'package:my_blog_app/app/modules/auth/controllers/refresh_token_controller.dart';
import 'package:my_blog_app/app/modules/create_post/controllers/create_post_controller.dart';
import 'package:my_blog_app/app/modules/create_post/provider/create_post_provider.dart';

class CreatePostBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreatePostController>(
        () => CreatePostController(postProvider: PostProvider()));
 Get.lazyPut<PostProvider>(
        () => PostProvider());
    Get.lazyPut<RefreshTokenController>(() => RefreshTokenController());
  }
}
