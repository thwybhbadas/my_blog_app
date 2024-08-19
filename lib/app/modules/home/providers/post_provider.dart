import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_blog_app/app/modules/home/models/post_request_model.dart';
import 'package:my_blog_app/app/modules/home/models/posts_respons_model.dart';

class PostProvider extends GetConnect {
  final String _contentType = 'application/json';
  
  final storage = GetStorage(); // Instance for accessing storage

  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return PostsResponsModel.fromJson(map);
      return null;
    };
    httpClient.baseUrl = 'https://myblog.mobaen.com/api/'; // Your API base URL
  }

  // Fetch the token from local storage
  Map<String, String> getHeaders() {
    final String? token = storage.read('jwt_token');
    return {
      'Content-Type': _contentType,
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  Future<PostsResponsModel?> createPost(PostReauestModel postRequestModel) async {
    final response = await post(
      'posts', 
      postRequestModel.toJson(),
      headers: getHeaders(),
    );
    if (response.isOk) {
      return PostsResponsModel.fromJson(response.body);
    } else {
      throw Exception('Failed to create post: ${response.statusText}');
    }
  }
}