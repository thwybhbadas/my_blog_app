import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_blog_app/app/modules/auth/models/phone_verification_request_model.dart';
import 'package:my_blog_app/app/modules/auth/models/phone_verification_response_model.dart';

class PhoneVerificationProvider extends GetConnect {
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
      if (map is Map<String, dynamic>) return VerifyRequestModel.fromJson(map);
      if (map is List) {
        return map.map((item) => VerifyRequestModel.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = 'https://myblog.mobaen.com/api/';
  }

  Future<VerifyRequestModel?> getVerify(int id) async {
    final response = await get('phone/verify$id');
    return response.body;
  }

  Future<Response<VerificationResponseModel>> postVerify(
        String phone, String code) async {
    final data = {'phone': phone, 'code': code};
    return await post('phone/verify' ,data,
    contentType: _contentType,
      decoder: (data) => VerificationResponseModel.fromJson(data));
      }}
  
          
      
  
