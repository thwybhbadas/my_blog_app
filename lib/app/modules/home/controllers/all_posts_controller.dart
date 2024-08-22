import 'package:get/get.dart';
import 'package:my_blog_app/app/modules/home/models/all_posts_respons_model.dart';

class AllPostsController extends GetxController {
  // final PostProvider provider = Get.put(PostProvider());
  
  // final RxList<PostData> posts = <PostData>[].obs;
  final RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  @override
  void onInit() {
    // fetchPosts();
    super.onInit();
  }

  // void fetchPosts() async {
  //   _isLoading(true);
  //   try {
  //     final response = await provider.getAllPosts();
  //     if (response != null ) {
  //       posts.assignAll(response); 
  //     } else {
  //       Get.snackbar('Error', 'Failed to fetch posts');
  //     }
  //   } catch (e) {
  //     print('Error: $e');
  //     Get.snackbar('Error', 'An error occurred: $e');
  //   } finally {
  //     _isLoading(false);
  //   }
  // }
}