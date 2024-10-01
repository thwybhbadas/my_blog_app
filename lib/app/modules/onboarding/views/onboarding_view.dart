import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_blog_app/app/constants/conatans.dart';
import 'package:my_blog_app/app/modules/onboarding/controllers/controllers.dart';
import 'package:my_blog_app/app/modules/onboarding/widgets/widgets.dart';


class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Obx(() {
        return Stack(children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                  color: AppColors.primaryColore,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(300))),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                  color: AppColors.secondaryColor,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(300))),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: PageView(
                  controller:
                      PageController(initialPage: controller.currentPage.value),
                  onPageChanged: (index) =>
                      controller.currentPage.value = index,
                  children: [
                    OnboardingWidget(
                      title: 'مرحبًا بك في تطبيق مدونتي',
                      description: 'اكتشف محتوى جديد كل يوم',
                      imagePath: 'assets/images/onboarding3.png',
                    ),
                    OnboardingWidget(
                        title: 'تابع اهتماماتك',
                        description: 'احصل على تحديثات حول الموضوعات التي تهمك',
                        imagePath: 'assets/images/onboarding2.png'),
                    OnboardingWidget(
                      title: 'انضم إلى مجتمعنا',
                      description: 'تواصل مع الأشخاص ذوي التفكير المماثل',
                      imagePath: 'assets/images/onboarding1.png',
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: controller.back,
                    child: Text('Back'),
                  ),
                  TextButton(
                    onPressed: controller.finished,
                    child: Text('Skip'),
                  ),
                  TextButton(
                    onPressed: controller.next,
                    child: Text('Next'),
                  ),
                ],
              ),
            ],
          ),
        ]);
      }),
     
    );
  }
}
