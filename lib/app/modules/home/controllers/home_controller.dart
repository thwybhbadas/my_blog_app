import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_blog_app/app/routes/routes.dart';

class HomeController extends GetxController {
  final storage = GetStorage();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void showOnBoarding() 
  {
    storage.write("is_displaying_onboarding", true);
    Get.offAllNamed(Routes.ONBOARDING);
  }

  void signout() 
  {
    storage.erase();
    Get.offAllNamed(Routes.SIGNIN);
  }
   void createPost() 
  {
   
    Get.offAllNamed(Routes.CREATEPOST);
  }
    void getAllPosts() 
  {
   
    Get.offAllNamed(Routes.GETALLPOST);
  }
}
