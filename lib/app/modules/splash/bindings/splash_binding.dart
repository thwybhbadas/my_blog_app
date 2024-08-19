import 'package:get/get.dart';
import 'package:my_blog_app/app/modules/splash/controllers/controllers.dart';


class SplashBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<SplashController>(
    //   () => SplashController(),
    // );
    Get.put(SplashController());
  }
}
