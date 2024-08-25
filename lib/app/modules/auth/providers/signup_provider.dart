import 'package:get/get.dart'; 
import 'package:get_storage/get_storage.dart';
import 'package:my_blog_app/app/constants/conatans.dart';
import 'package:my_blog_app/app/modules/auth/models/signup_request_model.dart';
import 'package:my_blog_app/app/modules/auth/models/signup_response_model.dart'; 

class SignupProvider extends GetConnect { 
  final storage = GetStorage(); 
  final String _contentType = 'application/json'; 
 
  Map<String, String> getHeaders() { 
    storage.read('jwt_token'); 
    Map<String, String> headers = <String, String>{}; 
 
    headers.assign('Content-Type', _contentType); 
    return headers; 
  } 
 
  @override 
  void onInit() { 
    httpClient.defaultDecoder = (map) { 
      if (map is Map<String, dynamic>) return SignupRequestModel.fromJson(map); 
      if (map is List) return map.map((item) => SignupRequestModel.fromJson(item)).toList(); 
    }; 
    httpClient.baseUrl = AppStrings.baseUrl; 
  } 
 
  // Future<SignupRequestModel?> getSignup(int id) async { 
  //   final response = await get('signup/$id'); 
  //   return response.body; 
  // } 
 
  Future<Response<SignupResponseModel>> postSignup(SignupRequestModel signup) async => 
      await post('signup', signup.toJson(), contentType: _contentType, decoder: (data) { 
        return SignupResponseModel.fromJson(data); 
      }); 
 
  // Future<Response> deleteSignup(int id) async => await delete('signup/$id'); 
}