import 'package:get/get.dart';
import 'package:my_blog_app/app/modules/home/controllers/post_controller.dart';
import 'package:my_blog_app/app/modules/home/providers/post_provider.dart';

import '../controllers/root_controller.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RootController>(
      () => RootController(),
    );
     Get.lazyPut<PostController>(
      () => PostController(),
    );
     Get.lazyPut<PostProvider>(
      () => PostProvider(),
    );
  }
}
