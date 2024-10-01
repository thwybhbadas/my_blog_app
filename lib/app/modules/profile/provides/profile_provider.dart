import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_blog_app/app/modules/auth/controllers/refresh_token_controller.dart';
import 'package:my_blog_app/app/modules/home/models/all_posts_respons_model.dart';
import 'package:my_blog_app/app/modules/home/models/posts_respons_model.dart';
import 'package:my_blog_app/app/modules/profile/models/all_profiles_respons_model.dart';
import 'package:my_blog_app/app/modules/profile/models/profile_request_model.dart';
import 'package:my_blog_app/app/modules/profile/models/profile_respons_model.dart';

class ProfileProvider extends GetConnect {
  final storage = GetStorage();
  final RefreshTokenController tokenController = Get.find();

Future<List<ProfileResponseModel>> fetchAllProfiles() async {
    await tokenController.refreshToken();
    final response = await get(
      'http://myblog.mobaen.com/api/profiles',
      headers: {'Authorization': 'Bearer ${storage.read("jwt_token")}'},
    );
    if (response.statusCode == 200) {
      final data = response.body['data']['data'];
      return data;
    } else {
      throw Exception('Failed to load profiles');
    }
  }
  Future<List<AllProfilesModelResponse>> fetchedProfile() async {
    await tokenController.refreshToken();
     List<AllProfilesModelResponse> allProfiles = [];
    int currentPage = 1;
    bool hasMorePages = true;
    while (hasMorePages){
 final response = await get(
        'http://myblog.mobaen.com/api/profiles?page=$currentPage',
        headers: {'Authorization': 'Bearer ${storage.read("jwt_token")}'},
      );

    if (response.statusCode == 200) {
      final data = response.body['data'];
     allProfiles.addAll(List<AllProfilesModelResponse>.from(data.map((item) => Post.fromJson(item))));
       // Check if there are more pages
        int lastPage = response.body['data']['last_page'];
        hasMorePages = currentPage < lastPage;
        currentPage++;
    } else {
      throw Exception('Failed to load profiles');
    }
  }
  return allProfiles.reversed.toList();
  }

  Future<ProfileResponseModel?> fetchProfileByUserId(int userId) async {
    await tokenController.refreshToken();
    final response = await get('http://myblog.mobaen.com/api/profiles',
        headers: {'Authorization': 'Bearer ${storage.read("jwt_token")}'});
    if (response.statusCode == 200) {
      if (response.body is Map<String, dynamic>) {
        final data = response.body['data'];
        if (data is Map<String, dynamic>) {
          final profiles = data['data'] as List;

          final userProfile = profiles.firstWhere(
            (profile) => profile['user_id'] == userId,
            orElse: () => null,
          );

          if (userProfile != null) {
            print("Profile found");
            print(userProfile['id']);
            storage.write("profile_id", userProfile['id']);
            return ProfileResponseModel.fromJson(userProfile);
          }
        }
      }
    }

    return null;
  }

// Create Profile
  Future<Response<ProfileResponseModel>> createProfile(ProfileRequestModel profile ) async {
    await tokenController.refreshToken();
    return await post(
      'http://myblog.mobaen.com/api/profiles',
      profile.toJson(),
      contentType: "application/json",
      headers: {
        'Authorization': 'Bearer ${storage.read("jwt_token")}',
      }
    );
  }
    // print("in createProfile provider");
    // return await post(
    //   'http://myblog.mobaen.com/api/profiles',
    //   profile.toJson(),
    //   contentType: "application/json",
    //   headers: {
    //     'Authorization': 'Bearer ${storage.read("jwt_token")}',
    //   },
    // );
  

 // Update Profile
  Future<Response> updateProfile(int id, ProfileRequestModel profile) async {
    await tokenController.refreshToken();
    return put(
      'http://myblog.mobaen.com/api/profiles/$id',
      profile.toJson(),
      contentType: "application/json",
      headers: {
        'Authorization': 'Bearer ${storage.read("jwt_token")}',
      },
    );
  }
   Future<Response<Posts>> deletePost(int id) async {
    await tokenController.refreshToken();
    return delete(
      'http://myblog.mobaen.com/api/posts/$id',
     
      contentType: "application/json",
      headers: {
        'Authorization': 'Bearer ${storage.read("jwt_token")}',
      },
    );
  }

  Future<List<LikePost>> fetchLikedPosts() async {
    await tokenController.refreshToken();

    final response = await get(
      'http://myblog.mobaen.com/api/likes',
      headers: {'Authorization': 'Bearer ${storage.read("jwt_token")}'},
    );

    if (response.statusCode == 200) {
      final data = response.body['data']['data'];

      return List<LikePost>.from(data.map((item) => LikePost.fromJson(item)));
    } else {
      throw Exception('Failed to load liked posts');
    }
  }

  Future<List<LikePost>> fetchSavePosts() async {
    await tokenController.refreshToken();

    final response = await get(
      'http://myblog.mobaen.com/api/favorites',
      headers: {'Authorization': 'Bearer ${storage.read("jwt_token")}'},
    );

    if (response.statusCode == 200) {
      final data = response.body['data']['data'];

      return List<LikePost>.from(data.map((item) => LikePost.fromJson(item)));
    } else {
      throw Exception('Failed to load liked posts');
    }
  }
   Future<List<int>> fetchFollows() async {
    await tokenController.refreshToken();
    final response = await get(
      'http://myblog.mobaen.com/api/follows?followers=true',
      headers: {'Authorization': 'Bearer ${storage.read("jwt_token")}'},
    );
    if (response.statusCode == 200) {
      final data = response.body['data']['data'];
      return List<int>.from(data.map((item) => item['pivot']['followed_id']));
    } else {
      throw Exception('Failed to load follows');
    }
  }
    Future<List<int>> fetchFollowing() async {
    await tokenController.refreshToken();
    final response = await get(
      'http://myblog.mobaen.com/api/follows',
      headers: {'Authorization': 'Bearer ${storage.read("jwt_token")}'},
    );
    if (response.statusCode == 200) {
      final data = response.body['data']['data'];
      return List<int>.from(data.map((item) => item['pivot']['followed_id']));
    } else {
      throw Exception('Failed to load following');
    }
  }
  Future<List<Post>> fetchPosts() async {
    await tokenController.refreshToken();
    List<Post> allPosts = [];
    int currentPage = 1;
    bool hasMorePages = true;

    while (hasMorePages) {
      final response = await get(
        'http://myblog.mobaen.com/api/posts?page=$currentPage',
        headers: {'Authorization': 'Bearer ${storage.read("jwt_token")}'},
      );

      if (response.statusCode == 200) {
        final data = response.body['data']['data'];
        allPosts
            .addAll(List<Post>.from(data.map((item) => Post.fromJson(item))));

        // Check if there are more pages
        int lastPage = response.body['data']['last_page'];
        hasMorePages = currentPage < lastPage;
        currentPage++;
      } else {
        throw Exception('Failed to load posts');
      }
    }

    // Reverse the list to show newest posts first
    return allPosts.reversed.toList();
  }
   Future<Response> likePost(int postId) async {
    await tokenController.refreshToken();
    return await post(
      'http://myblog.mobaen.com/api/likes',
      {'post_id': postId},
      contentType: "application/json",
      headers: {'Authorization': 'Bearer ${storage.read("jwt_token")}'},
    );
  }

  Future<Response> unlikePost(int postId) async {
    await tokenController.refreshToken();
    return await delete(
      'http://myblog.mobaen.com/api/likes/$postId',
      contentType: "application/json",
      headers: {'Authorization': 'Bearer ${storage.read("jwt_token")}'},
    );
  }

  Future<Response> savePost(int postId) async {
    await tokenController.refreshToken();
    return await post(
      'http://myblog.mobaen.com/api/favorites',
      {'post_id': postId},
      contentType: "application/json",
      headers: {'Authorization': 'Bearer ${storage.read("jwt_token")}'},
    );
  }

  Future<Response> unsavePost(int postId) async {
    await tokenController.refreshToken();
    return await delete(
      'http://myblog.mobaen.com/api/favorites/$postId',
      contentType: "application/json",
      headers: {'Authorization': 'Bearer ${storage.read("jwt_token")}'},
    );
  }
}
