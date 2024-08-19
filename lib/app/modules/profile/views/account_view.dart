import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_blog_app/app/constants/conatans.dart';
import 'package:my_blog_app/app/modules/profile/controllers/profile_controller.dart';
import 'package:my_blog_app/app/routes/app_pages.dart';
import '../widgets/account_link_widget.dart';

class AccountView extends GetView<ProfileController> {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Account".tr,
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          
          elevation: 0,
         
        ),
        body: ListView(
          primary: true,
          children: [

            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(),
              child: Column(
                children: [
                  AccountLinkWidget(
                    icon: Icon(Icons.person_outline,  color: AppColors.primaryColore,),
                    text: Text("ملفي الشخصي"),
                    onTap: (e) {
                      Get.toNamed(Routes.PROFILE);
                    },
                  ),
                  AccountLinkWidget(
                    icon: Icon(Icons.assignment_outlined,  color: AppColors.primaryColore,),
                    text: Text("منشوراتي"),
                    onTap: (e) {
                      // Get.find<RootController>().changePage(1);
                    },
                  ),
                  AccountLinkWidget(
                    icon: Icon(Icons.group_outlined,  color: AppColors.primaryColore,),
                    text: Text("متابعيني"),
                    onTap: (e) {
                      // Get.find<RootController>().changePage(3);
                    },
                  ),
                 
                  AccountLinkWidget(
                    icon: Icon(Icons.chat_outlined,  color: AppColors.primaryColore,),
                    text: Text("المفضلة"),
                    onTap: (e) {
                      // Get.find<RootController>().changePage(2);
                    },
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(),
              child: Column(
                children: [
                  AccountLinkWidget(
                    icon: Icon(Icons.settings_outlined,  color: AppColors.primaryColore,),
                    text: Text("جميع المشتركين"),
                    onTap: (e) {
                      // Get.toNamed(Routes.SETTINGS);
                    },
                  ),
                 
                 
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(),
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
                    icon: Icon(Icons.logout,  color: AppColors.primaryColore,),
                    text: Text("Logout".tr),
                    onTap: (e) async {
                      // await Get.find<AuthService>().removeCurrentUser();
                      // Get.find<RootController>().changePage(0);
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
