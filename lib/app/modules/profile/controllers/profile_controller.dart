import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_blog_app/app/modules/profile/models/profile_request_model.dart';
import 'package:my_blog_app/app/modules/profile/provides/profile_provider.dart';

class ProfileController extends GetxController {

   final storage = GetStorage();
  final ProfileProvider provider = ProfileProvider();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
    final RxBool _isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
        loadProfile(); // Load existing profile data

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
      usernameController.dispose();
    nameController.dispose();
    emailController.dispose();
    super.onClose();
  }

 void loadProfile() {
    // Here, load existing profile data into the controllers
    usernameController.text = storage.read('username') ?? '';
    nameController.text = storage.read('name') ?? '';
    emailController.text = storage.read('email') ?? '';
  }

  void updateProfile() {
    ProfileRequestModel profileModel = ProfileRequestModel(
      username: usernameController.text,
      name: nameController.text,
      email: emailController.text,
    );

    _isLoading.value = true;

    provider.updateProfile(profileModel).then((response) {
      if (response.isOk) {
        storage.write('username', profileModel.username);
        storage.write('name', profileModel.name);
        storage.write('email', profileModel.email);
        Get.snackbar('Success', 'Profile updated successfully!');
      } else {
        Get.snackbar('Error', response.body?.message ?? 'Unknown error');
      }
    }).catchError((error) {
      Get.snackbar('Error', error.toString());
    }).whenComplete(() {
      _isLoading.value = false;
    });
  }

  bool get isLoading => _isLoading.value;
}