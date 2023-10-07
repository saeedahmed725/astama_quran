import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../../../core/constants/app_assets_image.dart';
import '../../../core/constants/app_color.dart';

class ImagePreview extends StatelessWidget {
  const ImagePreview({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return  Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Container(
          height: size.height * 0.5,
          margin: const EdgeInsetsDirectional.all(20),
          decoration: BoxDecoration(
            color: AppColor.kPrimaryColor.withOpacity(0.5),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(47),
              bottomLeft: Radius.circular(47),
              topRight: Radius.circular(47),
              bottomRight: Radius.circular(120),
            ),
            image: DecorationImage(
                image: AssetImage(AppAssetsImage.onBoardingImage),
                colorFilter: ColorFilter.mode(
                    AppColor.kPrimaryColor.withOpacity(0.5),
                    BlendMode.dstIn),
                fit: BoxFit.cover),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: CircleAvatar(
            radius: 35,
            backgroundColor: AppColor.kPrimaryColor,
            child: SvgPicture.asset(AppAssetsImage.playFilledImage),
          ),
        )
      ],
    );
  }
}
