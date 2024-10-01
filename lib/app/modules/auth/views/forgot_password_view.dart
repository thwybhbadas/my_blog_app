import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_blog_app/app/constants/conatans.dart';
import 'package:my_blog_app/app/modules/auth/widgets/widgets.dart';

class ForgotPasswordView extends GetView {
  const ForgotPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
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
                          'إستعادة كلمة المرور ',
                          style: TextStyleConst.boldTextStyle(Colors.black, 30),
                        ),
                        const SizedBox(
                          height: 10,
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
                  minLines: 1,
                  maxLines: 1,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
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
                  height: 30,
                ),
                //  Button
                MainBtnWidget(
                  color: AppColors.primaryColore,
                  onPressed: () {
                    
                  },
                  text: Text(
                    "إرسال".tr,
                    style: TextStyleConst.mediumTextStyle(
                        AppColors.whiteTextColor, 20),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
