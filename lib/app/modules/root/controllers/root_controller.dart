import 'package:get/get.dart';
import 'package:my_blog_app/app/modules/create_post/views/create_post_view.dart';
import 'package:my_blog_app/app/modules/home/views/views.dart';
import 'package:my_blog_app/app/modules/profile/controllers/profile_controller.dart';
import 'package:my_blog_app/app/modules/profile/views/account_view.dart';

class RootController extends GetxController {
  final RxInt _selectedIndex = 0.obs;
  final ProfileController controller = Get.find<ProfileController>();

  int get selectedIndex => _selectedIndex.value;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onTap(int index) {
    _selectedIndex.value = index;
  }

  final screens = [
    //home screen
    const HomeView(),
    //explor screen
    CreatePostView(),
    //favorite screen
    AccountView(),
  ];
}
