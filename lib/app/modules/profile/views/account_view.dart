import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_blog_app/app/constants/conatans.dart';
import 'package:my_blog_app/app/modules/home/controllers/controllers.dart';
import 'package:my_blog_app/app/modules/profile/controllers/account_controller.dart';
import 'package:my_blog_app/app/modules/profile/controllers/profile_controller.dart';
import 'package:my_blog_app/app/modules/profile/models/profile_respons_model.dart';
import 'package:my_blog_app/app/modules/profile/views/followers_list_page.dart';
import 'package:my_blog_app/app/routes/app_pages.dart';
import '../widgets/account_link_widget.dart';

class AccountView extends GetView<ProfileController> {
  final storage = GetStorage();

  AccountView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                'حسابي',
                style:
                    TextStyleConst.boldTextStyle(AppColors.primaryColore, 25),
              ),
              centerTitle: true,
              automaticallyImplyLeading: false,
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  ProfileDetailsPage(profile: controller.profileResponse.value),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
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
                            Get.toNamed(Routes.MYPOSTS);
                            // controller.myPosts();
                          },
                        ),
                        AccountLinkWidget(
                          icon: const Icon(
                            Icons.group_outlined,
                            color: AppColors.primaryColore,
                          ),
                          text: "متابعيني",
                          onTap: (e) {
                            Get.toNamed(Routes.FOLLOWERS);
                          },
                        ),
                        AccountLinkWidget(
                          icon: const Icon(
                            Icons.favorite_outline,
                            color: AppColors.primaryColore,
                          ),
                          text: "المفضلة",
                          onTap: (e) {
                            Get.toNamed(Routes.LIKEDPOSTS);
                          },
                        ),
                        AccountLinkWidget(
                          icon: const Icon(
                            Icons.bookmark_border_outlined,
                            color: AppColors.primaryColore,
                          ),
                          text: "المحفوظات",
                          onTap: (e) {
                            Get.toNamed(Routes.SAVEDPOSTS);
                          },
                        ),
                        AccountLinkWidget(
                          icon: const Icon(
                            Icons.people_alt_outlined,
                            color: AppColors.primaryColore,
                          ),
                          text: "جميع المشتركين",
                          onTap: (e) {
                            // Get.find<ProfileController>().();
                          },
                        ),
                        AccountLinkWidget(
                          icon: const Icon(
                            Icons.logout,
                            color: AppColors.primaryColore,
                          ),
                          text: "تسجيل الخروج",
                          onTap: (e) async {
                            Get.find<ProfileController>().signout();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}

class ProfileDetailsPage extends StatelessWidget {
  final ProfileResponseModel? profile;
  final storage = GetStorage();
  ProfileDetailsPage({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    // final ProfileController controller = Get.find();

    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.grey.shade300,
          child: profile == null
              ? const Icon(Icons.person, size: 50, color: Colors.white)
              : null,
        ),
        const SizedBox(height: 16),
        if (profile != null) ...[
          Obx(
            ()=> Column(
              children: [
                Text(
                  profile!.username,
                  style:
                      const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  profile!.name,
                  style:
                      const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                Text(
                  profile!.email,
                  style:
                      const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
        ] else ...[
          Container()
          //   MaterialButton(
          //     onPressed: () {
          //       Get.toNamed(Routes.PROFILE);
          //     },
          //     padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 9),
          //     color: AppColors.primaryColore, disabledElevation: 0,
          //     // disabledColor: Get.theme.focusColor,
          //     shape:
          //         RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          //     elevation: 0,
          //     child: Text(
          //       'إنشاء الملف الشخصي',
          //       style:
          //           TextStyleConst.mediumTextStyle(AppColors.whiteTextColor, 20),
          //     ),
          //   ),
        ],
        const SizedBox(height: 16),
      ],
    );
  }
}
