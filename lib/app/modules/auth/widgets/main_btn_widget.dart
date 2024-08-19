import 'package:flutter/material.dart';

class MainBtnWidget extends StatelessWidget {
  final Color? color;
  final Widget? text;
  final VoidCallback? onPressed;

  const MainBtnWidget({super.key, this.color, this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: this.onPressed != null
          ? BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: this.color!.withOpacity(0.3),
                    blurRadius: 40,
                    offset: Offset(0, 15)),
                BoxShadow(
                    color: this.color!.withOpacity(0.2),
                    blurRadius: 13,
                    offset: Offset(0, 3))
              ],
            )
          : null,
      child: MaterialButton(
        onPressed: this.onPressed,
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 18),
        color: this.color,
        disabledElevation: 0,
        // disabledColor: Get.theme.focusColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        child: this.text,
        elevation: 0,
      ),
    );
  }
}
