import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_blog_app/app/constants/colors.dart';
import '../controllers/root_controller.dart';

class RootView extends GetView<RootController> {
  RootView({super.key});
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Obx(
        () => controller.screens[controller.selectedIndex],
      ),
      bottomNavigationBar: Container(
        height: size.height * .080,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(.15),
                  blurRadius: 30,
                  offset: const Offset(0, 10))
            ],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30)
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround, // توزيع الأيقونات بالتساوي
          children: List.generate(3, (index) => 
            InkWell(
              onTap: () {
                controller.onTap(index);
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      AnimatedContainer(
                            duration: const Duration(milliseconds: 1500),
                            curve: Curves.fastLinearToSlowEaseIn,
                            margin: EdgeInsets.only(
                                bottom: index != controller.selectedIndex
                                    ? size.width * .024
                                    : 0),
                            decoration: const BoxDecoration(
                                color: AppColors.primaryColore,
                                borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(10),
                                )),
                          ),
                    Container(
                      width: size.width * .086 + 40,
                      height: size.width * .086 + 10,
                      decoration: BoxDecoration(
                        color: controller.selectedIndex == index
                            ? AppColors.primaryColore
                            : Colors.transparent,
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

  List<IconData> listOfIcons = [
    Icons.home_outlined,
    Icons.post_add,
    Icons.person_outline,
  ];
}
//          ListView.builder(
//             itemCount: 3,
//             scrollDirection: Axis.horizontal,
//             padding: EdgeInsets.symmetric(horizontal: size.width * .024),
//             itemBuilder: (context, index) => Padding(
//    padding:  EdgeInsets.symmetric(horizontal: size.width * .117), // Add horizontal padding
//                  child: InkWell(
//                     onTap: () {
//                       controller.onTap(index);
//                     },
//                     splashColor: Colors.transparent,
//                     highlightColor: Colors.transparent,
//                     child:Obx(
//                       () =>    Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
                          // AnimatedContainer(
                          //   duration: const Duration(milliseconds: 1500),
                          //   curve: Curves.fastLinearToSlowEaseIn,
                          //   margin: EdgeInsets.only(
                          //       bottom: index != controller.selectedIndex
                          //           ? size.width * .024
                          //           : 0),
                          //   decoration: const BoxDecoration(
                          //       color: AppColors.primaryColore,
                          //       borderRadius: BorderRadius.vertical(
                          //         bottom: Radius.circular(10),
                          //       )),
                          // ),
//                           Container(
//                               width: size.width * .086 + 10, // Width for the circle
//                       height: size.width * .086 + 10, // Height for the circle
//                       decoration: BoxDecoration(
//                         color: controller.selectedIndex == index
//                             ? Colors.purple // Circular background color
//                             : Colors.transparent,
//                         shape: BoxShape.circle,
//                       ),
//                             child: Icon(
//                               listOfIcons[index],
//                               size: size.width * .076,
//                               color: index == controller.selectedIndex
//                                   ? AppColors.primaryColore
//                                   : AppColors.blackTextColor,
//                             ),
//                           ),
//                           SizedBox(
//                             height: size.width * .03,
//                           )
//                         ],
//                       ),
                    
                 
//                     ),
//                   ),
//             )),
//       ),
//       // bottomNavigationBar: Container(
//       //   height: 80,
//       //   decoration: const BoxDecoration(
//       //     // color: Color(0xFFFFFFFF),
//       //     borderRadius: BorderRadius.only(
//       //       topLeft: Radius.circular(20),
//       //       topRight: Radius.circular(20),
//       //     ),
//       //   ),
//       //   child: Obx(
//       //     () => BottomNavigationBar(
//       //       type: BottomNavigationBarType.fixed,
//       //       selectedItemColor: AppColors.primaryColore,
//       //       unselectedItemColor: AppColors.secondaryColor,
//       //       selectedLabelStyle: const TextStyle(
//       //         fontWeight: FontWeight.bold,
//       //         fontSize: 15,
//       //       ),
//       //       currentIndex: controller.selectedIndex,
//       //       onTap: controller.onTap,
//       //       items: [
//       //         BottomNavigationBarItem(
//       //             icon: Container(
//       //                 padding: const EdgeInsets.all(10),
//       //                 decoration: BoxDecoration(
//       //                   color: controller.selectedIndex == 0
//       //                       ? AppColors.secondaryColor
//       //                       : null,
//       //                   shape: BoxShape.circle,
//       //                 ),
//       //                 child: const Icon(Icons.home_outlined)),
//       //             label: 'الصفحة الرئيسية'),
//       //         BottomNavigationBarItem(
//       //             icon: Container(
//       //                 padding: const EdgeInsets.all(10),
//       //                 decoration: BoxDecoration(
//       //                   color: controller.selectedIndex == 1
//       //                       ? AppColors.secondaryColor
//       //                       : null,
//       //                   shape: BoxShape.circle,
//       //                 ),
//       //                 child: const Icon(Icons.post_add)),
//       //             label: 'منشور جديد'),
//       //         BottomNavigationBarItem(
//       //             icon: Container(
//       //                 padding: const EdgeInsets.all(10),
//       //                 decoration: BoxDecoration(
//       //                   color: controller.selectedIndex == 2
//       //                       ? AppColors.secondaryColor
//       //                       : null,
//       //                   shape: BoxShape.circle,
//       //                 ),
//       //                 child: const Icon(Icons.person_outline)),
//       //             label: 'حسابي'),
//       //       ],
//       //     ),
//       //   ),
//       // ),
//     );
//   }

//   List<IconData> listOfIcons = [
//     Icons.home_outlined,
//     Icons.post_add,
//     Icons.person_outline
//   ];
// }
