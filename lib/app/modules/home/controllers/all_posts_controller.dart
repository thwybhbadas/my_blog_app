import 'package:get/get.dart';
import 'package:my_blog_app/app/modules/home/models/all_posts_respons_model.dart';
import 'package:my_blog_app/app/modules/home/providers/all_posts_provider.dart';

class AllPostsController extends GetxController {
  final AllPostsProvider provider = Get.put(AllPostsProvider());
  
  final RxList<Post> posts = <Post>[].obs;
  final RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  @override
  void onInit() {
    allPosts();
    super.onInit();
  }

  void allPosts() async {
    _isLoading(true);
    try {
      final response = await provider.allPosts();
      posts.assignAll(response); 
        } catch (e) {
      print('Error: $e');
      Get.snackbar('Error', 'An error occurred: $e');
    } finally {
      _isLoading(false);
    }
  }
}