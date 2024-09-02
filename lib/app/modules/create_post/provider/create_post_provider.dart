import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_blog_app/app/modules/auth/controllers/refresh_token_controller.dart';
import 'package:my_blog_app/app/modules/create_post/model/post_create_model.dart';

class PostProvider extends GetConnect {
   final GetStorage storage = GetStorage();
  final RefreshTokenController tokenController = Get.find();

   @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) {
        return PostCreateModel.fromJson(map);
      }
      return null;
    };
     httpClient.baseUrl = 'https://myblog.mobaen.com/api/';
    super.onInit(); // Ensure that super.onInit() is called
  }

  
  Future<Response<PostCreateModel>> createPost(FormData postcreate) async {
     Response<PostCreateModel> response = await post(
      'https://myblog.mobaen.com/api/posts',
      postcreate,
      contentType: 'multipart/form-data',
      headers: {
        'Authorization': 'Bearer ${storage.read("jwt_token")}',
      },
      decoder: (data) => PostCreateModel.fromJson(data),
    );
    return response;
  }
}
