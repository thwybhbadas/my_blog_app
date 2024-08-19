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
                      title: 'Welcome to the Blog App',
                      description: 'Discover new content every day',
                      imagePath: 'assets/images/onboarding1.png',
                    ),
                    OnboardingWidget(
                        title: 'Follow Your Interests',
                        description: 'Get updates on topics you care about',
                        imagePath: 'assets/images/onboarding2.png'),
                    OnboardingWidget(
                      title: 'Join the Community',
                      description: 'Connect with like-minded people',
                      imagePath: 'assets/images/onboarding3.png',
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: controller.finished,
                    child: Text('Back'),
                  ),
                  TextButton(
                    onPressed: controller.finished,
                    child: Text('Skip'),
                  ),
                  TextButton(
                    onPressed: controller.finished,
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
