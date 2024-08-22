import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_blog_app/app/modules/auth/models/models.dart';
import 'package:my_blog_app/app/modules/auth/models/signup_request_model.dart';
import 'package:my_blog_app/app/modules/auth/models/signup_response_model.dart';
import 'package:my_blog_app/app/modules/auth/providers/providers.dart';
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
  void onInit() {
    super.onInit();

    
  }

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
    if (passwordController.text != passwordConfirmationController.text) {
      Get.snackbar('خطأ', 'كلمة المرور غير متطابقة');
      return;
    }

    _isLoading.value = true;

    SignupRequestModel signupData = SignupRequestModel(
      phone: phoneController.text,
      password: passwordController.text,
      passwordConfirmation: passwordConfirmationController.text,
    );

    try { 
      Response<SignupResponseModel> response = await _provider.postSignup(signupData); 
 
      if (response.isOk) { 
        storage.write("phone", phoneController.text); 
        Get.offAllNamed(Routes.PHONE_VERIFICATION); 
      } else { 
        Get.snackbar('Error', response.body?.message ?? 'Unknown error'); 
      } 
    } catch (e) { 
      Get.snackbar('Error', e.toString()); 
    } finally { 
      _isLoading.value = false; 
    } 
  } 
}
