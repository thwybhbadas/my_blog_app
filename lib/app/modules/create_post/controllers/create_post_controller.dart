import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_blog_app/app/modules/create_post/provider/create_post_provider.dart';
import 'package:my_blog_app/app/routes/routes.dart';

class CreatePostController extends GetxController {
  var title = ''.obs;
  var content = ''.obs;
  var isLoading = true.obs;
var image = Rxn<File>();
  final ImagePicker _picker = ImagePicker();
  final PostProvider postProvider;
 CreatePostController({required this.postProvider});
  void pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image.value = File(pickedFile.path);
    }
  }
 Future<void>  createPosts() async {
   if (title.value.isEmpty || content.value.isEmpty) {
      Get.snackbar('خطأ', 'لا يمكن للعنوان والمحتوى ان يكونوا فارغين');
      return;
    }
    try {
        FormData formData = FormData({
        'title': title.value,
        'content': content.value,
        if (image.value != null)
          'image': MultipartFile(image.value!,
              filename: image.value!.path.split('/').last),
      });
      isLoading(true);
      var response = await postProvider.createPost(formData);
      // print(post);
      // print(respons.body);
      if (response.status.isOk) {
        Get.offAllNamed(Routes.HOME);
        Get.snackbar('ناجح', 'تم إنشاء المنشور بنجاح');
      } else {
        Get.snackbar('خطأ', 'فشل في إنشاء المنشور');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
    }finally {
      isLoading(false);
    }
  }

  
}
