import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_blog_app/app/constants/conatans.dart';
import 'package:my_blog_app/app/modules/home/controllers/controllers.dart';
import 'package:my_blog_app/app/modules/profile/controllers/account_controller.dart';
import 'package:my_blog_app/app/routes/app_pages.dart';
import '../widgets/account_link_widget.dart';

class AccountView extends GetView<AccountController> {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'حسابي',
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,
            elevation: 0,
          ),
          body: ListView(
            primary: true,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: const BoxDecoration(),
                child: Column(
                  children: [
                    AccountLinkWidget(
                      icon: const Icon(
                        Icons.person_outline,
                        color: AppColors.primaryColore,
                      ),
                      text: "ملفي الشخصي",
                      onTap: (e) {
                        Get.toNamed(Routes.PROFILE);
                      },
                    ),
                    AccountLinkWidget(
                      icon: const Icon(
                        Icons.assignment_outlined,
                        color: AppColors.primaryColore,
                      ),
                      text: "منشوراتي",
                      onTap: (e) {
                        // Get.find<RootController>().changePage(1);
                      },
                    ),
                    AccountLinkWidget(
                      icon: const Icon(
                        Icons.group_outlined,
                        color: AppColors.primaryColore,
                      ),
                      text: "متابعيني",
                      onTap: (e) {
                        // Get.find<RootController>().changePage(3);
                      },
                    ),
                    AccountLinkWidget(
                      icon: const Icon(
                        Icons.chat_outlined,
                        color: AppColors.primaryColore,
                      ),
                      text: "المفضلة",
                      onTap: (e) {
                        // Get.find<RootController>().changePage(2);
                      },
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: const BoxDecoration(),
                child: Column(
                  children: [
                    AccountLinkWidget(
                      icon: const Icon(
                        Icons.settings_outlined,
                        color: AppColors.primaryColore,
                      ),
                      text: "جميع المشتركين",
                      onTap: (e) {
                        // Get.toNamed(Routes.SETTINGS);
                      },
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: const BoxDecoration(),
                child: Column(
                  children: [
                    // AccountLinkWidget(
                    //   icon: Icon(Icons.support_outlined,  color: AppColors.primaryColore,),
                    //   text: Text("Help & FAQ".tr),
                    //   onTap: (e) {
                    //     Get.toNamed(Routes.HELP);
                    //   },
                    // ),
                    AccountLinkWidget(
                      icon: const Icon(
                        Icons.logout,
                        color: AppColors.primaryColore,
                      ),
                      text: "تسجيل الخروج",
                      onTap: (e) async {
                        Get.find<HomeController>().signout();
                      },
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
