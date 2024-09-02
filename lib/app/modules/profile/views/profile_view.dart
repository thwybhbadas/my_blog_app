import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_blog_app/app/constants/conatans.dart';
import 'package:my_blog_app/app/modules/auth/widgets/widgets.dart';
import 'package:my_blog_app/app/modules/profile/controllers/profile_controller.dart';
import 'package:my_blog_app/app/modules/profile/models/all_profiles_respons_model.dart';
import 'package:my_blog_app/app/modules/profile/models/profile_request_model.dart';
import 'package:my_blog_app/app/modules/profile/models/profile_respons_model.dart';

class ProfileView extends GetView<ProfileController> {
final _formKey = GlobalKey<FormState>();
 final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final storage = GetStorage();
   ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ملفي الشخصي',
          style: TextStyleConst.boldTextStyle(AppColors.primaryColore, 20),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child:
             Form(
               key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'إسم المستخدم',
                    style: TextStyleConst.mediumTextStyle(Colors.black, 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: usernameController,
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'هذا الحقل مطلوب';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  Text(
                    'الإسم',
                    style: TextStyleConst.mediumTextStyle(Colors.black, 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller:nameController,
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'هذا الحقل مطلوب';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  Text(
                    'الإيميل',
                    style: TextStyleConst.mediumTextStyle(Colors.black, 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: emailController,
                    minLines: 1,
                    maxLines: 1,
                    keyboardType: TextInputType.emailAddress,
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'هذا الحقل مطلوب';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.0),
                  
                       
                       MainBtnWidget(
                          color: AppColors.primaryColore,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                      final newProfile = ProfileRequestModel(
                        username: usernameController.text,
                        name: nameController.text,
                        email: emailController.text,
                      );
                      controller.createProfile(newProfile);
                    }
                  },
                          text: Text(
                            'تحديث الملف السخصي',
                            style: TextStyleConst.mediumTextStyle(
                                AppColors.whiteTextColor, 20),
                          ),
                        )
                ],
              ),
             ),
        ),
      ),
    );
  }
}
class EditProfilePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.find();
    final profile = controller.profile.value;

    if (profile != null) {
      _nameController.text = profile.name;
      _emailController.text = profile.email;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('تعديل الملف الشخصي'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildTextField('الاسم', _nameController, Icons.badge),
              const SizedBox(height: 20),
              _buildTextField(
                  'البريد الإلكتروني', _emailController, Icons.email),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final updatedProfile = ProfileRequestModel(
                      username: profile?.username ?? '',
                      name: _nameController.text,
                      email: _emailController.text,
                    );
                    controller.updateProfile(1, updatedProfile);
                    Get.back();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'حفظ التغييرات',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      String label, TextEditingController controller, IconData icon) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.blueAccent),
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'يرجى إدخال $label';
        }
        return null;
      },
    );
  }
}
