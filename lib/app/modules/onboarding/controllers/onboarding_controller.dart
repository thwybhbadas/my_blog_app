import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_blog_app/app/routes/routes.dart';

class OnboardingController extends GetxController {
  final storage = GetStorage();
  var currentPage = 0.obs;

  @override
  void onInit() {
    super.onInit();
    // if(storage.read("is_displaying_onboarding") == false)
    // {
    //   Get.offAllNamed(Routes.SIGNIN);
    // }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void finished(){
    storage.write("is_displaying_onboarding", false);
     if (storage.read("is_signedin") == true) {
      Get.offAllNamed(Routes.HOME);
    } else {
      Get.offAllNamed(Routes.SIGNIN);
    }
  }
}

