import 'package:get/get.dart';
import 'package:my_blog_app/app/modules/auth/controllers/refresh_token_controller.dart';
import 'package:my_blog_app/app/modules/create_post/controllers/create_post_controller.dart';
import 'package:my_blog_app/app/modules/create_post/provider/create_post_provider.dart';
import 'package:my_blog_app/app/modules/home/controllers/all_posts_controller.dart';
import 'package:my_blog_app/app/modules/home/controllers/controllers.dart';
import 'package:my_blog_app/app/modules/profile/controllers/profile_controller.dart';

import '../controllers/root_controller.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RootController>(
      () => RootController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
     Get.lazyPut<CreatePostController>(
      () => CreatePostController(),
    );
     Get.lazyPut<AllPostsController>(
      () => AllPostsController(),
    );

    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
        Get.lazyPut<RefreshTokenController>(() => RefreshTokenController());

  }
}
