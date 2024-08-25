import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_blog_app/app/constants/colors.dart';
import 'package:my_blog_app/app/constants/conatans.dart';

class AccountLinkWidget extends StatelessWidget {
  final Icon? icon;
  final String? text;
  final ValueChanged<void>? onTap;

  const AccountLinkWidget({
    Key? key,
    this.icon,
    this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap!('');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: [
            icon!,
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
              width: 1,
              height: 24,
              color: Get.theme.focusColor.withOpacity(0.3),
            ),
            Expanded(
              child:Text(text!,style: TextStyleConst.forgotTextStyle(
                            AppColors.blackTextColor, 18),) 
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 12,
              color: AppColors.primaryColore,
            ),
          ],
        ),
      ),
    );
  }
}
