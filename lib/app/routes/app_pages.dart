import 'package:get/get.dart';
import 'package:my_blog_app/app/modules/create_post/bindings/create_post_binding.dart';
import 'package:my_blog_app/app/modules/create_post/views/create_post_view.dart';
import 'package:my_blog_app/app/modules/profile/views/all_profiles_view.dart';
import 'package:my_blog_app/app/modules/profile/views/followers_list_page.dart';
import 'package:my_blog_app/app/modules/profile/views/liked_posts_page.dart';
import 'package:my_blog_app/app/modules/profile/views/my_posts_view.dart';
import 'package:my_blog_app/app/modules/profile/views/saved_posts_page.dart';
import 'package:my_blog_app/app/modules/profile/views/settings_view.dart';
import '../modules/auth/bindings/bindings.dart';
import '../modules/auth/views/views.dart';
import '../modules/home/bindings/bindings.dart';
import '../modules/home/views/views.dart';
import '../modules/onboarding/bindings/bindings.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/root/bindings/root_binding.dart';
import '../modules/root/views/root_view.dart';
import '../modules/splash/bindings/bindings.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    // Home
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    // Auth
    GetPage(
      name: _Paths.SIGNIN,
      page: () => const SigninView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: AuthBinding(),
    ),
      GetPage(
      name: _Paths.FOLLOWERS,
      page: () => const FollowersListPage(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.PHONE_VERIFICATION,
      page: () => const PhoneVerificationView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.ROOT,
      page: () => const RootView(),
      binding: RootBinding(),
    ),
    GetPage(
      name: _Paths.CREATEPOST,
      page: () => CreatePostView(),
      binding: CreatePostBinding(),
    ),
    GetPage(
      name: _Paths.GETALLPOST,
      page: () => const AllProfilesView(),
      binding: ProfileBinding(),
    ),
     GetPage(
      name: _Paths.MYPOSTS,
      page: () => const MyPostsView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () =>  ProfileView(),
      binding: ProfileBinding(),
    ),
     GetPage(
      name: _Paths.LIKEDPOSTS,
      page: () =>  const LikedPostsPage(),
      binding: ProfileBinding(),
    ),
     GetPage(
      name: _Paths.SAVEDPOSTS,
      page: () =>  const SavedPostsPage(),
      binding: ProfileBinding(),
    ),
     GetPage(
      name: _Paths.SETTINGS,
      page: () =>  const SettingsView(),
      binding: ProfileBinding(),
    ),
    
  ];
}
