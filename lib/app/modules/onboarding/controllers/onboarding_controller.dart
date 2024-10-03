import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_blog_app/app/routes/routes.dart';

class OnboardingController extends GetxController {
  final storage = GetStorage();
  var currentPage = 0.obs;




  void finished(){
    storage.write("is_displaying_onboarding", false);
     if (storage.read("is_signedin") == true) {
      Get.offAllNamed(Routes.ROOT);
    } else {
      Get.offAllNamed(Routes.SIGNIN);
    }
  }
   void next() {
    if (currentPage.value < 2) { // تأكد من عدم تجاوز عدد الصفحات
      currentPage.value++;
    }
  }

  void back() {
    if (currentPage.value > 0) { // تأكد من عدم الرجوع إلى صفحة سلبية
      currentPage.value--;
    }
  }
}
