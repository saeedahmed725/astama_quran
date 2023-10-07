import 'package:flutter/material.dart';
import '../../../../core/constants/app_color.dart';


class DownloadButton extends StatelessWidget {
  const DownloadButton({super.key, this.onTap});

  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 20,
        backgroundColor: AppColor.kPrimaryColor,
        child: const Icon(Icons.download,color: Colors.white),
      ),
    );
  }
}
