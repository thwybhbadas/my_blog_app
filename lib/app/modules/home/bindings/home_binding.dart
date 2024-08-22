import 'package:get/get.dart';
import 'package:my_blog_app/app/modules/home/controllers/all_posts_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    // Get.lazyPut<PostController>(
    //   () => PostController(),
    // );
    // Get.lazyPut<PostProvider>(
    //   () => PostProvider(),
    // );
     Get.lazyPut<AllPostsController>(
      () => AllPostsController(),
    );
  }
}
