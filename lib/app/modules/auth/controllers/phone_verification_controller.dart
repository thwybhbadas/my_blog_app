
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_blog_app/app/modules/auth/providers/providers.dart';
import 'package:my_blog_app/app/routes/routes.dart';

class PhoneVerificationController extends GetxController {
  final provider = Get.find<PhoneVerificationProvider>();
  final storage = GetStorage();

  
  final TextEditingController codeController = TextEditingController();

  final RxBool _isLoading = false.obs;
  final RxBool _isVerified = false.obs;

  bool get isLoading => _isLoading.value;
  bool get isVerified => _isVerified.value;

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
    codeController.dispose();
    super.onClose();
  }

 

  void submitVerificationCode() async {
    _isLoading(true);
       try {
      final response =
          await provider.postVerify(storage.read('phone'), codeController.text);

      if (response.isOk && response.body?.status == true) {
        Get.snackbar(
            'success', response.body?.message ?? 'phone number verified');
        Get.toNamed(Routes.SIGNIN);
      } else {

        Get.snackbar('error', response.body?.message ?? 'Verification failed');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred. Please try again.');
    }finally{
      _isLoading(false);
    }}}
//     _isLoading(true);
   
//     VerifyRequestModel verifyRequestModel = VerifyRequestModel(
//       code: codeController.text,
//       phone: phoneController.text,
//     );
//     provider.postVerify(verifyRequestModel).then((response) {
//       if (response.isOk) {
//         _isVerified(true);
//         storage.write("is_phone_verified", true);
//         Get.offAllNamed(Routes.SIGNIN);
//       } else {
//         _isVerified(false);
//         Get.snackbar(
//             'Error', response.body?.message ?? 'Invalid verification code');
//         // Invalid verification code
//       }
//     }).catchError((error) {
//       Get.snackbar('Error', error.toString());
//     });
//   }
// }
