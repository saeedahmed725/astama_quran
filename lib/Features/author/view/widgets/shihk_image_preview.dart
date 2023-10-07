
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShihkImagePreview extends StatelessWidget {
  const ShihkImagePreview({
    super.key,
    this.image,
  });

  final String? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      width: double.infinity,
      color: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: image != null ? Image.asset(image!, fit: BoxFit.cover) : null,
      ),
    );
  }
}