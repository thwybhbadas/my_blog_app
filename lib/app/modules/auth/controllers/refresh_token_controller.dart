import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_blog_app/app/modules/auth/models/refresh_token_model.dart';
import 'package:my_blog_app/app/modules/auth/providers/refresh_token_provider.dart';

class RefreshTokenController extends GetxController {
  final RefreshProvider provider = RefreshProvider();
  final GetStorage _storage = GetStorage();
  var token = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _loadToken();
  }

  void _loadToken() {
    final storedToken = _storage.read<String>('jwt_token');
    if (storedToken != null) {
      token.value = storedToken;
    }
  }

  Future<void> refreshToken() async {
    final RefreshTokenModel? newTokenModel = await provider.refreshToken();
    if (newTokenModel != null) {
      token.value = newTokenModel.token;
      _storage.write('jwt_token', newTokenModel.token);
    } else {
      // Handle error (e.g., log out user)
    }
  }
}
