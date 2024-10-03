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
      decoration: onPressed != null
          ? BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: color!.withOpacity(0.3),
                    blurRadius: 40,
                    offset: const Offset(0, 15)),
                BoxShadow(
                    color: color!.withOpacity(0.2),
                    blurRadius: 13,
                    offset: const Offset(0, 3))
              ],
            )
          : null,
      child: MaterialButton(
        onPressed: onPressed,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 18),
        color: color,
        disabledElevation: 0,
        // disabledColor: Get.theme.focusColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        child: text,
        elevation: 0,
      ),
    );
  }
}
