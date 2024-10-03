import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_blog_app/app/modules/home/models/all_posts_respons_model.dart';
import 'package:my_blog_app/app/modules/profile/models/profile_request_model.dart';
import 'package:my_blog_app/app/modules/profile/models/profile_respons_model.dart';
import 'package:my_blog_app/app/modules/profile/provides/profile_provider.dart';
import 'package:my_blog_app/app/routes/routes.dart';

class ProfileController extends GetxController {
  var profile = Rxn<ProfileRequestModel>();
  var profileResponse = Rxn<ProfileResponseModel>();
  var isLoading = true.obs;
  var hasProfile = false.obs;
  var likedPosts = <LikePost>[].obs;
  var savedPosts = <LikePost>[].obs;
  var posts = <Post>[].obs;
  var followerProfiles = <ProfileResponseModel?>[].obs;
  var all_Profiles = <ProfileResponseModel?>[].obs;
  var currentPage = 1;
  var lastPage = 1;
  var image = Rxn<File>();
  var followersCount = 0.obs;
  var followingCount = 0.obs;
  var followingProfiles = <ProfileResponseModel?>[].obs;
  var followersProfiles = <ProfileResponseModel?>[].obs;
  var profileImagePath = ''.obs; // مسار الصورة
  final ProfileProvider profileProvider;
  final GetStorage storage = GetStorage();
  final ImagePicker picker = ImagePicker();

 
  ProfileController({required this.profileProvider});


  @override
  void onInit() {
    super.onInit();
    fetchFollowing();
    loadProfileImage();
    fetchFollowers();
    fetchLikedPosts();
    fetchSavedPosts();
    fetchPosts();
    fetchAllProfiles();
    if (storage.read('user_id') != null) {
      fetchProfileByUserId(storage.read('user_id'));
    }
  }
 void loadProfileImage() {
    final storage = GetStorage();
    profileImagePath.value = storage.read('profile_image') ?? '';
  }
   Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    
    if (pickedFile != null) {
      profileImagePath.value = pickedFile.path;
      storage.write('profile_image', pickedFile.path); // حفظ المسار في التخزين
    }
  }

  void fetchProfileByUserId(int userId) async {
    isLoading(true);
    try {
      final fetchedProfile = await profileProvider.fetchProfileByUserId(userId);
      if (fetchedProfile != null) {
        profileResponse.value = fetchedProfile;
        hasProfile(true);
      } else {
        hasProfile(false);
      }
    } finally {
      isLoading(false);
    }
  }

  void createProfile(ProfileRequestModel profileData) async {
    isLoading(true);
    try {
      final response = await profileProvider.createProfile(profileData);
      if (response.isOk) {
        fetchProfileByUserId(storage.read('user_id'));
        Get.snackbar('ناجح', "تم انشاء البروفايل بنجاح");
        Get.back();
        // Fetch profile after creation
      } else {
        Get.snackbar('فشل', "فشل إنشاء البروفايل");
      }
    } finally {
      isLoading(false);
    }
  }

  // void createProfile(ProfileRequestModel profileData) async {
  //   isLoading(true);
  //   try {
  //     final response = await profileProvider.createProfile(profileData);
  //     print(response.body);
  //     if (response.isOk) {
  //       print("create profilllllllllllllle");
  //       fetchProfileByUserId(storage.read('user_id'));
  //       Get.snackbar('ناجح', "تم انشاء البروفايل بنجاح");
  //       Get.back();
  //       // Fetch profile after creation
  //     } else {
  //       Get.snackbar('فشل', "فشل إنشاء البروفايل");
  //     }
  //   } finally {
  //     isLoading(false);
  //   }
  // }

  void updateProfile(int id, ProfileRequestModel profileData) async {
    isLoading(true);
    try {
      final response = await profileProvider.updateProfile(
          storage.read('profile_id'), profileData);
      if (response.statusCode == 200) {
        fetchProfileByUserId(
            storage.read('user_id')); // Fetch profile after update
      }
    } finally {
      isLoading(false);
    }
  }

  // Future<void> fetchProfiles() async {
  //   try {
  //     isLoading(true);
  //     var profileResult = await profileProvider.fetchedProfile();
  //     all_Profiles.assignAll(profileResult);
  //   } catch (e) {
  //     print("Failed to load profiles: $e");
  //   } finally {
  //     isLoading(false);
  //   }
  // }

  Future<void> fetchLikedPosts() async {
    isLoading(true);
    try {
      final posts = await profileProvider.fetchLikedPosts();
      likedPosts.value = posts;
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchSavedPosts() async {
    isLoading(true);
    try {
      final posts = await profileProvider.fetchSavePosts();
      savedPosts.value = posts;
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchFollowers() async {
    isLoading(true);
    try {
      final followers = await profileProvider.fetchFollows();
      followersCount.value = followers.length;
      followersProfiles.clear();
      for (int id in followers) {
        final followerProfile = await profileProvider.fetchProfileByUserId(id);
        followersProfiles.add(followerProfile);
      }
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchFollowing() async {
    isLoading(true);
    try {
      final following = await profileProvider.fetchFollowing();
      followingCount.value = following.length;
      for (int id in following) {
        final followingProfile = await profileProvider.fetchProfileByUserId(id);
        followingProfiles.add(followingProfile);
      }
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchAllProfiles() async {
    isLoading(true);
    try {
      final allProfiles = await profileProvider.fetchAllProfiles();
      all_Profiles.assignAll(allProfiles);
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchPosts() async {
    try {
       var allPosts = await profileProvider.fetchPosts();
      var userPosts = allPosts
          .where((post) => post.user.id == storage.read('user_id'))
          .toList();
      posts.assignAll(userPosts);
    } catch (e) {
    }
  }
   Future<void> deletePost(int id) async {
    try {
      // حذف المنشور
      var response = await profileProvider.deletePost(id);
      
      if (response.statusCode == 200) {
        // حذف المنشور من القائمة 
        posts.removeWhere((post) => post.id == id);
      } else {
      }
    } catch (e) {
    }
  }

  void signout() {
    storage.erase();
    Get.offAllNamed(Routes.SIGNIN);
  }

  void allProfiles() {
    Get.toNamed(Routes.ALLPROFILES);
  }

  void myPosts() {
    Get.toNamed(Routes.MYPOSTS);
  }
  
}

