import 'package:astama/core/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../core/constants/app_assets_image.dart';
import '../../../../core/shared/custom_text.dart';
import '../../../home/data/model/api/reciters_model.dart';


class AuthorSliverAppbar extends StatelessWidget {
  const AuthorSliverAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as ReciterModel;
    return SliverAppBar(
      title: CustomText(text: data.name, fontSize: 18),
      centerTitle: true,
      toolbarHeight: 75.h,
      automaticallyImplyLeading: false,
      // leading: Padding(
      //   padding: const EdgeInsetsDirectional.only(start: 0.0),
      //   child: IconButton(
      //     onPressed: () {},
      //     highlightColor: Colors.transparent,
      //     icon: SvgPicture.asset(AppAssetsImage.menuVerticalImage, height: 16),
      //   ),
      // ),
      actions: [
        IconButton(
          onPressed: context.back,
          highlightColor: Colors.transparent,
          icon: SvgPicture.asset(AppAssetsImage.arrowBackImage, height: 16),
        )
      ],
      pinned: true,
      floating: false,
      snap: false,
    );
  }
}
