import 'package:get/get.dart';
import 'package:my_blog_app/app/modules/onboarding/controllers/controllers.dart';


class OnboardingBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<OnboardingController>(
    //   () => OnboardingController(),
    // );
    Get.put(OnboardingController());
  }
}
