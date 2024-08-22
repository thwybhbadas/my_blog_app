import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_blog_app/app/constants/conatans.dart';
import 'package:my_blog_app/app/modules/profile/models/profile_request_model.dart';
import 'package:my_blog_app/app/modules/profile/models/profile_respons_model.dart';

class ProfileProvider extends GetConnect {
  final storage = GetStorage();
  final String _contentType = 'application/json';

  Map<String, String> getHeaders() {
    final String authorizationToken = storage.read('jwt_token');
    return {
      'Content-Type': _contentType,
       'Authorization': 'Bearer $authorizationToken',
    };
  }

  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return ProfileRequestModel.fromJson(map);
      if (map is List) return map.map((item) => ProfileResponseModel.fromJson(item)).toList();
    };
    httpClient.baseUrl = AppStrings.baseUrl;
  }

  Future<Response<ProfileResponseModel>> updateProfile(ProfileRequestModel profile) async => 
      await post('profiles', profile.toJson(), contentType: _contentType, decoder: (data) {
        return ProfileResponseModel.fromJson(data);
      });
}