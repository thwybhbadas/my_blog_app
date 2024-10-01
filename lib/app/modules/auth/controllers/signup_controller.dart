import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_blog_app/app/constants/conatans.dart';
import 'package:my_blog_app/app/modules/auth/models/signup_request_model.dart';
import 'package:my_blog_app/app/modules/auth/models/signup_response_model.dart';
import 'package:my_blog_app/app/modules/auth/providers/providers.dart';
import 'package:my_blog_app/app/modules/auth/widgets/diplay_snack_bar.dart';
import 'package:my_blog_app/app/routes/routes.dart';

class SignupController extends GetxController {
  final storage = GetStorage();
  final SignupProvider _provider = Get.find<SignupProvider>();

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();

  final RxBool _isLoading = false.obs;
  final RxBool _isPasswordVisible = false.obs;
  final RxBool _isPasswordConfirmationVisible = false.obs;

  bool get isLoading => _isLoading.value;
  bool get isPasswordVisible => _isPasswordVisible.value;
  bool get isPasswordConfirmationVisible =>
      _isPasswordConfirmationVisible.value;

  @override
  void onReady() {
    super.onReady();
    if (storage.read("is_signedup") == true) {
      Get.offAllNamed(Routes.PHONE_VERIFICATION);
    }
  }

  @override
  void onClose() {
    // phoneController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();
    super.onClose();
  }

  void togglePasswordVisibility() {
    _isPasswordVisible.value = !_isPasswordVisible.value;
  }

  void togglePasswordConfirmationVisibility() {
    _isPasswordConfirmationVisible.value =
        !_isPasswordConfirmationVisible.value;
  }

  Future<void> signup() async {
    if (phoneController.text.trim().isEmpty) {
      DisplaySnackBar.displaySnackBar("الرجاء إدخال رقم الهاتف");
    } else if (passwordController.text.trim().isEmpty) {
      DisplaySnackBar.displaySnackBar("الرجاء إدخال كلمة مرور");
    } else if (passwordController.text.trim().length < 9) {
      DisplaySnackBar.displaySnackBar(
          "يجب أن تتكون كلمة المرور من 9 رموز او اكثر");
    } else if (passwordConfirmationController.text.trim().isEmpty) {
      DisplaySnackBar.displaySnackBar("الرجاء تأكيد كلمة المرور");
    } else if (passwordController.text.trim() !=
        passwordConfirmationController.text.trim()) {
      DisplaySnackBar.displaySnackBar("كلمة المرور غير متطابقة");
    }
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      DisplaySnackBar.displaySnackBar(
          "يرجى التحقق من اتصال الإنترنت", 3, AppColors.redColor);
      return;
    }
    _isLoading.value = true;

    SignupRequestModel signupData = SignupRequestModel(
      phone: phoneController.text,
      password: passwordController.text,
      passwordConfirmation: passwordConfirmationController.text,
    );

    try {
      Response<SignupResponseModel> response =
          await _provider.postSignup(signupData);

      if (response.isOk) {
        storage.write("phone", phoneController.text);
        DisplaySnackBar.displaySnackBar(
            "تم التسجيل بنجاح", 3, AppColors.greenColor);
        Get.offAllNamed(Routes.PHONE_VERIFICATION);
      } else if (response.statusCode == 409) {
        DisplaySnackBar.displaySnackBar(
            "هذا الرقم مسجل بالفعل", 3, AppColors.redColor);
      } else {
        DisplaySnackBar.displaySnackBar(
            response.body?.message ?? 'خطأ غير معروف', 3, AppColors.redColor);
      }
    } catch (e) {
      // Get.snackbar('Error', e.toString());
    } finally {
      _isLoading.value = false;
    }
  }
}
