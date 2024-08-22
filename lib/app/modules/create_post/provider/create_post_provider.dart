import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_blog_app/app/modules/auth/controllers/refresh_token_controller.dart';
import 'package:my_blog_app/app/modules/create_post/model/post_create_model.dart';

class PostProvider extends GetConnect {
  final String baseUrl = 'http://myblog.mobaen.com/api';
  final storage = GetStorage();
  final RefreshTokenController tokenController = Get.find();
  Future<Response> createPost(PostCreateModel postcreate) async {
    await tokenController.refreshToken();
    final form = FormData({
      'title': postcreate.title,
      'content': postcreate.content,
      'image': postcreate.image,
    });

    final response = await post('$baseUrl/posts', form,
        headers: {'Authorization': 'Bearer ${storage.read("jwt_token")}'});

    return response;
  }
}
