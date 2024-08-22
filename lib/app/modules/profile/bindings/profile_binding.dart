import 'package:get/get.dart';
import 'package:my_blog_app/app/modules/home/controllers/controllers.dart';
import 'package:my_blog_app/app/modules/profile/controllers/account_controller.dart';
import 'package:my_blog_app/app/modules/profile/provides/profile_provider.dart';

import '../controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
     Get.lazyPut<ProfileProvider>(
      () => ProfileProvider(),
    );
      Get.lazyPut<AccountController>(
      () => AccountController(),
    );
     Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
