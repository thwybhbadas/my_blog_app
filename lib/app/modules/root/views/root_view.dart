
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_blog_app/app/constants/colors.dart';
import '../controllers/root_controller.dart';

class RootView extends GetView<RootController> {
  const RootView({super.key});
// @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Obx(() {
//         return IndexedStack(
//           index: controller.selectedIndex,
//           children: [
//             Center(child: Text('Home Page')),
//             Center(child: Text('Fire Page')),
//             Center(child: Text('Settings Page')),
//           ],
//         );
//       }),
//       bottomNavigationBar: Obx(() {
//         return BottomNavigationBar(
//           backgroundColor: Colors.black,
//           selectedItemColor: Colors.white,
//           unselectedItemColor: Colors.grey,
//           currentIndex: controller.selectedIndex,
//           onTap: (index) {
//             controller.onTap(index);
//           },
//           items: [
//             BottomNavigationBarItem(
//               icon: Container(
//                 decoration: BoxDecoration(
//                   color: controller.selectedIndex == 0
//                       ? Colors.white
//                       : Colors.transparent,
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//                 padding: EdgeInsets.all(8),
//                 child: Icon(Icons.home,
//                     color: controller.selectedIndex == 0
//                         ? Colors.black
//                         : Colors.white),
//               ),
//               label: '',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.local_fire_department,
//                 color: controller.selectedIndex == 1
//                     ? Colors.white
//                     : Colors.grey,
//               ),
//               label: '',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.settings,
//                 color: controller.selectedIndex == 2
//                     ? Colors.white
//                     : Colors.grey,
//               ),
//               label: '',
//             ),
//           ],
//         );
//       }),
//     );
//   }
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Obx(
        () => controller.screens[controller.selectedIndex],
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: const BoxDecoration(
          // color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Obx(
          () => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.primaryColore,
            unselectedItemColor: AppColors.secondaryColor,
            selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            currentIndex: controller.selectedIndex,
            onTap: controller.onTap,
            items: [
              BottomNavigationBarItem(
                  icon: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: controller.selectedIndex == 0
                            ? AppColors.secondaryColor
                            : null,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.home_outlined)),
                  label: 'الصفحة الرئيسية'),
              BottomNavigationBarItem(
                  icon: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: controller.selectedIndex == 1
                            ? AppColors.secondaryColor
                            : null,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.post_add)),
                  label: 'منشور جديد'),
              BottomNavigationBarItem(
                  icon: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: controller.selectedIndex == 2
                            ? AppColors.secondaryColor
                            : null,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.person_outline)),
                  label: 'حسابي'),
            ],
          ),
        ),
      ),
    );
  }
}
