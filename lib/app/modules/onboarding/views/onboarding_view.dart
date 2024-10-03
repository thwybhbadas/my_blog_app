import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_blog_app/app/constants/conatans.dart';
import 'package:my_blog_app/app/modules/onboarding/controllers/controllers.dart';
import 'package:my_blog_app/app/modules/onboarding/widgets/widgets.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});
  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();

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
                  controller: pageController,
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      color: controller.currentPage.value == index
                          ? AppColors.primaryColore
                          : AppColors.secondaryColor,
                      shape: BoxShape.circle,
                    ),
                  );
                }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: controller.currentPage.value > 0
                        ? () {
                            controller.back();
                            pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          }
                        : null,
                    child: controller.currentPage.value > 0
                        ? const Text('Back'):Text(''),
                  ),
                  TextButton(
                    onPressed: controller.finished,
                    child:  controller.currentPage.value < 2
                        ?const Text('Skip'):const Text(''),
                  ),
                  TextButton(
                  onPressed: controller.currentPage.value < 2
                        ? () {
                            controller.next();
                            pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          }
                        : null,
                    child:const Text('Next'),
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
