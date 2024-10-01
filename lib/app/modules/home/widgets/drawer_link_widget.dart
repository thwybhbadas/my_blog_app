import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_blog_app/app/constants/conatans.dart';

class DrawerLinkWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final ValueChanged<void> onTap;
  const DrawerLinkWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap('');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Row(
          children: [
            Icon(
              icon,
              color: AppColors.primaryColore,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: Text(
              text,
              style:
                  TextStyleConst.forgotTextStyle(AppColors.blackTextColor, 18),
            )),
          ],
        ),
      ),
    );
  }
}
