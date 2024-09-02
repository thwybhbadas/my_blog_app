import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_blog_app/app/constants/conatans.dart';
import 'package:my_blog_app/app/modules/auth/widgets/widgets.dart';
import 'package:my_blog_app/app/modules/create_post/controllers/create_post_controller.dart';
import 'package:my_blog_app/app/modules/create_post/model/post_create_model.dart';

class CreatePostView extends GetView<CreatePostController> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  CreatePostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'إنشاء منشور',
          style: TextStyleConst.boldTextStyle(AppColors.primaryColore, 25),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'العنوان',
                style: TextStyleConst.mediumTextStyle(Colors.black, 16),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: titleController,
                minLines: 1,
                maxLines: 1,
                keyboardType: TextInputType.name,
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
                ),
                onChanged: (value) => controller.title.value = value,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'هذا الحقل مطلوب';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'المحتوى',
                style: TextStyleConst.mediumTextStyle(Colors.black, 16),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: contentController,
                minLines: 3,
                maxLines: 20,
                keyboardType: TextInputType.multiline,
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
                ),
                onChanged: (value) => controller.content.value = value,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'هذا الحقل مطلوب';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'اختر صورة',
                    style: TextStyleConst.mediumTextStyle(Colors.black, 16),
                  ),
                  InkWell(
                    onTap: () {
                      controller.pickImage();
                    },
                    child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          color: AppColors.secondaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        ),
                        child: const Icon(
                          Icons.image_outlined,
                          color: AppColors.primaryColore,
                        )),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Obx(() => controller.image.value != null
                    ? Container(
                        child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(6.0)),
                            child: Image.file(
                              controller.image.value!,
                              fit: BoxFit.fill,
                            )))
                    : const Text('لم يتم اختيار صورة')),
              ),
              const SizedBox(height: 20),
              MainBtnWidget(
                color: AppColors.primaryColore,
                onPressed: () async {
                  await controller.createPosts();
                },
                text: Text(
                  'إنشاء منشور',
                  style: TextStyleConst.mediumTextStyle(
                      AppColors.whiteTextColor, 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
