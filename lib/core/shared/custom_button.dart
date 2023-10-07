import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      this.fontWeight = FontWeight.w700,
      this.fontSize = 12,
      this.onTap,
      this.height = 90,
      required this.color,
      this.width = 1,
      this.textColor = Colors.white});

  final String text;
  final FontWeight fontWeight;
  final double fontSize;
  final GestureTapCallback? onTap;
  final double height;
  final double width;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width.sw,
        constraints: BoxConstraints(
          maxWidth: 1.sw,
          minWidth: 0.2.sw,
        ),
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(30)),
        alignment: Alignment.center,
        child: CustomText(
          text: text,
          color: textColor,
          fontWeight: fontWeight,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
