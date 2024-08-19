import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_blog_app/app/modules/auth/controllers/controllers.dart';
import 'package:my_blog_app/app/modules/auth/widgets/widgets.dart';

import '../../../constants/conatans.dart';

class PhoneVerificationView extends GetView<PhoneVerificationController> {
  const PhoneVerificationView({super.key});

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
                          'إرسال كود التحقق',
                          style: TextStyleConst.boldTextStyle(Colors.black, 30),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // Text(
                          
                        //   style:
                        //       TextStyleConst.mediumTextStyle(Colors.black, 20),
                        // ),
                      ],
                    ),
                  ),
                ),

                Text(
                  'كود التحقق',
                  style: TextStyleConst.mediumTextStyle(Colors.black, 16),
                ),
                const SizedBox(
                  height: 10,
                ),

                TextFormField(
                  controller: controller.codeController,
                  decoration: const InputDecoration(
                    // labelText: 'كلمة المرور',
                    // hintText: '*********',
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
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'كلمة المرور مطلوبة';
                    }
                    return null;
                  },
                ),

                const SizedBox(
                  height: 20,
                ),
                // SignIn Button
                MainBtnWidget(
                    color: AppColors.primaryColore,
                    onPressed: () {
                      controller.submitVerificationCode();
                      print('done');
                    },
                    text: Text(
                      "إرسال".tr,
                      style: TextStyleConst.mediumTextStyle(
                          AppColors.whiteTextColor, 20),
                    ),
                  ),
                
                // Obx(()=>
                //  MainBtnWidget(
                //     color: AppColors.primaryColore,
                //     onPressed: () {
                //        controller.submitVerificationCode();
                //       // print('done;');
                //     },
                //     text: Text(
                //       "إرسال".tr,
                //       style: TextStyleConst.mediumTextStyle(
                //           AppColors.whiteTextColor, 20),
                //     ),
                //   ),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//     Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'رمز التحقق'.tr,
//                   style: const TextStyle(color: Colors.black),
//                 ),
//                 const SizedBox(height: 10),
//                 TextFormField(
//                   controller: controller.codeController,
//                   minLines: 1,
//                   maxLines: 1,
//                   keyboardType: TextInputType.number,
//                   decoration: const InputDecoration(
//                     labelText: 'أدخل رمز التحقق',
//                     filled: true,
//                     border: OutlineInputBorder(
//                       borderSide: BorderSide(color: Color(0xffd9d9d9), width: 1.0),
//                       borderRadius: BorderRadius.all(Radius.circular(6.0)),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Color(0xffd9d9d9), width: 1.0),
//                       borderRadius: BorderRadius.all(Radius.circular(6.0)),
//                     ),
//                     // hintText: '123456',
//                   ),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'هذا الحقل مطلوب'.tr;
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 20),
//                 Obx(
//                   () => controller.isLoading
//                       ? const CircularProgressIndicator()
//                       : TextButton(
//                           onPressed: controller.submitVerificationCode,
//                           child: Text(
//                             "تحقق من الهاتف".tr,
//                           ),
//                         ),
//                 ),
//                 const SizedBox(height: 30),
//                 // الأزرار والعناصر الأخرى في الواجهة...
//               ],
//             ),
//           ),
//         ),
//   ),
// );
// }
// }
