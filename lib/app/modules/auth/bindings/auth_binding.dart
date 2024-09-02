
import 'package:get/get.dart';
import 'package:my_blog_app/app/modules/auth/controllers/controllers.dart';
import 'package:my_blog_app/app/modules/auth/providers/providers.dart';


class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(
      () => AuthController(),
    );
    Get.lazyPut<SigninProvider>(
      () => SigninProvider(),
    );
    Get.lazyPut<SignupProvider>(
      () => SignupProvider(),
      );
    Get.lazyPut<SignupController>(
      () => SignupController(),
    );
   Get.lazyPut<PhoneVerificationController>(
    () => PhoneVerificationController(),
   );
   Get.lazyPut<PhoneVerificationProvider>(
    () => PhoneVerificationProvider(),
   );
   Get.put(RefreshTokenController());

  }
}
