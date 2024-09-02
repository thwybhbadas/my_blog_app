
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_blog_app/app/constants/conatans.dart';
import 'package:my_blog_app/app/modules/auth/controllers/controllers.dart';
import 'package:my_blog_app/app/modules/auth/widgets/widgets.dart';
import 'package:my_blog_app/app/routes/routes.dart';

class SignupView extends GetView<SignupController>  {
  const SignupView({super.key});

  //final SignupController controller = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 70),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          'تسجيل حساب جديد',
                          style: TextStyleConst.boldTextStyle(Colors.black, 30),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'مرحبا بك',
                          style:
                              TextStyleConst.mediumTextStyle(Colors.black, 20),
                        ),
                      ],
                    ),
                  ),
                ),

                Text(
                  'رقم الجوال',
                  style: TextStyleConst.mediumTextStyle(Colors.black, 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
              controller: controller.phoneController,
                  minLines: 1,
                  maxLines: 1,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    // labelText: 'رقم الجوال',
                    fillColor: AppColors.secondaryColor,
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffd9d9d9), width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(6.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffd9d9d9), width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(6.0))),
                    hintText: '777 777 777',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'هذا الحقل مطلوب';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),

                Text(
                  'كلمة المرور',
                  style: TextStyleConst.mediumTextStyle(Colors.black, 16),
                ),
                const SizedBox(
                  height: 10,
                ),

                Obx(
                  () => TextFormField(
              controller: controller.passwordController,
                    decoration: InputDecoration(
                      // labelText: 'كلمة المرور',
                      hintText: '*********',
                      fillColor: AppColors.secondaryColor,
                      filled: true,
                      border: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffd9d9d9), width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(6.0)),
                      ),
                      enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xffd9d9d9), width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(6.0))),
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: controller.togglePasswordVisibility,
                      ),
                    ),
                    obscureText: !controller.isPasswordVisible,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'كلمة المرور مطلوبة';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'تأكيد كلمة المرور',
                  style: TextStyleConst.mediumTextStyle(Colors.black, 16),
                ),
                const SizedBox(
                  height: 10,
                ),

                Obx(
                  () => TextFormField(
              controller: controller.passwordConfirmationController,
                    decoration: InputDecoration(
                      // labelText: 'كلمة المرور',
                      hintText: '*********',
                      fillColor: AppColors.secondaryColor,
                      filled: true,
                      border: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffd9d9d9), width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(6.0)),
                      ),
                      enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xffd9d9d9), width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(6.0))),
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.isPasswordConfirmationVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed:
                            controller.togglePasswordConfirmationVisibility,
                      ),
                    ),
                    obscureText: !controller.isPasswordConfirmationVisible,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'كلمة المرور مطلوبة';
                      }
                      return null;
                    },
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
                // SignIn Button
                MainBtnWidget(
                  color: AppColors.primaryColore,
                  onPressed: () {
                    controller.signup();
                    // print('done;');
                  },
                  text: Text(
                    "تسجيل حساب جديد".tr,
                    style: TextStyleConst.mediumTextStyle(
                        AppColors.whiteTextColor, 20),
                  ),
                ),
                
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        "لديك حساب؟",
                        style: TextStyleConst.forgotTextStyle(
                            AppColors.primaryColore, 16),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
