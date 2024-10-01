import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_blog_app/app/constants/conatans.dart';
import 'package:my_blog_app/app/modules/auth/models/signin_request_model.dart';
import 'package:my_blog_app/app/modules/auth/providers/providers.dart';
import 'package:my_blog_app/app/modules/auth/widgets/diplay_snack_bar.dart';
import 'package:my_blog_app/app/routes/routes.dart';

class AuthController extends GetxController {
  final GetStorage storage = GetStorage();
  final provider = Get.find<SigninProvider>();

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final RxBool _isLoading = false.obs;

  var isPasswordVisible = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  get isLoading => _isLoading;

  @override
  void onInit() {
    super.onInit();
    // Check if already signed in
    if (storage.read("is_signedin") == true) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.offAllNamed(Routes.ROOT);
      });
    }
  }

  @override
  void onClose() {
    phoneController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void signin() {
    if (phoneController.text.trim().isEmpty) {
      DisplaySnackBar.displaySnackBar("الرجاء إدخال رقم الهاتف");
    } else if (passwordController.text.trim().isEmpty) {
      DisplaySnackBar.displaySnackBar("الرجاء إدخال كلمة مرور");
    }
    _isLoading.value = true;
    SigninRequestModel signinModel = SigninRequestModel(
        phone: phoneController.text, password: passwordController.text);
    provider.postSignin(signinModel).then((response) {
      if (response.isOk) {
        storage.write("jwt_token", response.body?.data?.token);
        storage.write("is_signedin", true);
        storage.write("user_id", response.body?.data?.id);

        Get.offAllNamed(Routes.ROOT);
      } else if (response.statusCode == 401) {
        DisplaySnackBar.displaySnackBar(
            "يجب عليك ان تسجل اولا لتستطيع الدخول", 3, AppColors.redColor);
      }

      
       else {
        Get.snackbar('خطأ', response.body?.message ?? 'Unknown error');
      }
      _isLoading.value = false;
    }).catchError((error) {
      Get.snackbar('خطأ', error.toString());
      _isLoading.value = false;
    });
  }

  void signout() {
    storage.erase();
    Get.offAllNamed(Routes.SIGNIN); // Navigate to login after signout
  }
//    void signin() {
//   _isLoading.value = true; // Start loading
//   SigninRequestModel signinModel = SigninRequestModel(
//     phone: phoneController.text,
//     password: passwordController.text,
//   );

//   provider.postSignin(signinModel).then((response) {
//     if (response.isOk) {
//       // Log the entire response for debugging
//       print('Response data: ${response.body}');

//       // Create a SigninResponseModel from the response body
//       SigninResponseModel signinResponse = SigninResponseModel();

//       // Access the token and status
//       final token = signinResponse.token;

//       if (signinResponse.status == true && token != null) {
//         storage.write("jwt_token", token);
//         print('Stored token: $token');
//         storage.write("is_signedin", true);
//         Get.offAllNamed(Routes.ROOT);
//       } else {
//         Get.snackbar('Error', '${signinResponse.token}');
//       }
//     } else {
//       // Handle error
//       Get.snackbar('Error', response.body?.message ?? 'Unknown error');
//     }
//     _isLoading.value = false; // Stop loading
//   }).catchError((error) {
//     Get.snackbar('Error', error.toString());
//     _isLoading.value = false; // Stop loading
//   });
// }
}
