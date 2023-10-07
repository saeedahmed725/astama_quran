import 'package:flutter/material.dart';

import '../constants/app_fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      required this.text,
      this.fontWeight = FontWeight.w700, this.fontSize = 12,
      this.color});

  final String text;
  final FontWeight fontWeight;
  final double fontSize;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: AppFont.alfontFonts,
          color: color,
          fontWeight: fontWeight,
          fontSize: fontSize),
    );
  }
}
