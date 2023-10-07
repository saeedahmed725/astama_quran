import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../core/constants/app_assets_image.dart';
import '../../../../core/shared/custom_text.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({super.key, required this.text, this.onTap});

  final String text;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 25.0.h),
      child: Row(
        children: [
          CustomText(text: text, fontSize: 18),
          const Spacer(),
         // InkWell(onTap: onTap, child: SvgPicture.asset(AppAssetsImage.menuImage))
        ],
      ),
    );
  }
}
