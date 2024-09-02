import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_blog_app/app/modules/home/widgets/main_drawer_widget.dart';
import 'package:my_blog_app/app/modules/profile/controllers/profile_controller.dart';
import 'package:my_blog_app/app/modules/profile/models/all_profiles_respons_model.dart';

class AllProfilesView extends GetView<ProfileController> {
  const AllProfilesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          'جميع المشتركين',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body:Container(),
      // ListView.builder(
      //     itemCount: controller.profiles.length,
      //     itemBuilder: (context, index) {
      //       Profiles profile = controller.profiles[index];
      //       return ProfileCard(profile: profile);
      //     },
      //   )
        )
        );
        
     
    
  }
}

class ProfileCard extends StatelessWidget {
  final Profiles profile;

  const ProfileCard({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0), // Use ScreenUtil for padding
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(10.0), // Use ScreenUtil for padding
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // CircleAvatar(
              //   radius: 25.r, // Use ScreenUtil for radius
              //   backgroundColor: Colors.blue, // Background color of the circle
              //   child: Icon(
              //     Icons.person, // Icon to display
              //     color: Colors.white, // Color of the icon
              //     size: 40.sp, // Use ScreenUtil for icon size
              //   ),
              // ),
              SizedBox(width: 10.0), // Use ScreenUtil for spacing
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                       profile.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16, // Use ScreenUtil for font size
                      ),
                    ),
                    SizedBox(height: 5.0), // Use ScreenUtil for spacing
                   
                    SizedBox(height: 5.0), // Use ScreenUtil for spacing
                    Text(
                      profile.email,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 5.0), // Use ScreenUtil for spacing
                    Text(
                      profile.createdAt,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
 