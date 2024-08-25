import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_blog_app/app/modules/auth/controllers/refresh_token_controller.dart';
import 'package:my_blog_app/app/modules/home/models/all_posts_respons_model.dart';

class AllPostsProvider extends GetConnect {
  final storage = GetStorage();
  final RefreshTokenController tokenController = Get.find();
  Future<List<Post>> allPosts() async {
    await tokenController.refreshToken();
    final response = await get('http://myblog.mobaen.com/api/posts',
        headers: {'Authorization': 'Bearer ${storage.read("jwt_token")}'});

    if (response.statusCode == 200) {
      final data = response.body;
      return (data['data']['data'] as List)
          .map((post) => Post.fromJson(post))
          .toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
