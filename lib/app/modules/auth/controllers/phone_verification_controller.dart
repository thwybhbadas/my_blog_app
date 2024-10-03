

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_blog_app/app/constants/conatans.dart';
import 'package:my_blog_app/app/modules/auth/providers/providers.dart';
import 'package:my_blog_app/app/modules/auth/widgets/diplay_snack_bar.dart';
import 'package:my_blog_app/app/routes/routes.dart';

class PhoneVerificationController extends GetxController {
  final provider = Get.find<PhoneVerificationProvider>();
  final storage = GetStorage();
 final List<TextEditingController> verificationControllers = List.generate(6, (index) => TextEditingController());
  var timer = 60.obs; // عداد الوقت
  var isTimerRunning = false.obs;
  
  // final TextEditingController codeController = TextEditingController();

  final RxBool _isLoading = false.obs;
  final RxBool _isVerified = false.obs;

  bool get isLoading => _isLoading.value;
  bool get isVerified => _isVerified.value;



  @override
  void onClose() {
    // codeController.dispose();
    super.onClose();
  }

  void startTimer() {
    isTimerRunning.value = true;
    timer.value = 60;

    Future.delayed(const Duration(seconds: 1), () {
      if (timer.value > 0) {
        timer.value--;
        startTimer(); // إعادة تشغيل العداد
      } else {
        isTimerRunning.value = false; // إيقاف العداد
      }
    });
  }

  void submitVerificationCode() async {
     _isLoading(true);
    try {
      String verificationCode = verificationControllers.map((controller) => controller.text).join('');
      final response = await provider.postVerify(storage.read('phone'), verificationCode);

      if (response.isOk && response.body?.status == true) {
        DisplaySnackBar.displaySnackBar("تم التحقق من الرقم بنجاح", 3, AppColors.greenColor);
        Get.toNamed(Routes.SIGNIN);
      } else {
        DisplaySnackBar.displaySnackBar("فشل التحقق من الرقم", 3, AppColors.redColor);
      }
    } catch (e) {
      DisplaySnackBar.displaySnackBar("الرجاء المحاولة مرة أخرى", 3, AppColors.redColor);
    } finally {
      _isLoading(false);
    }
  }}
    // _isLoading(true);
    //    try {
    //   final response =
    //       await provider.postVerify(storage.read('phone'), codeController.text);

    //   if (response.isOk && response.body?.status == true) {
    //          DisplaySnackBar.displaySnackBar(" تم التحقق من الرقم بنجاح", 3, AppColors.greenColor);

    //     Get.toNamed(Routes.SIGNIN);
    //   } else {

    //          DisplaySnackBar.displaySnackBar(" فشل التحقق من الرقم", 3, AppColors.redColor);
    //   }
    // } catch (e) {
    //          DisplaySnackBar.displaySnackBar("الرجاء المحاولة مرة أخرى", 3, AppColors.redColor);
    // }finally{
    //   _isLoading(false);
    // }}}
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
