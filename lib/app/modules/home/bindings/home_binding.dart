import 'package:get/get.dart';
import 'package:my_blog_app/app/modules/auth/controllers/refresh_token_controller.dart';
import 'package:my_blog_app/app/modules/home/controllers/all_posts_controller.dart';
import 'package:my_blog_app/app/modules/home/providers/all_posts_provider.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<AllPostsController>(
      () => AllPostsController(),
    );
    Get.lazyPut<AllPostsProvider>(
      () => AllPostsProvider(),
    );
     Get.lazyPut<RefreshTokenController>(
      () => RefreshTokenController(),
    );
    
  }
}
