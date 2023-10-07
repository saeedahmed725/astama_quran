import 'package:astama/core/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../Features/author/view/bloc/percent/percent_bloc.dart';
import '../constants/app_assets_image.dart';
import 'custom_text.dart';

class SoundCardInfo extends StatelessWidget {
  const SoundCardInfo(
      {super.key,
      required this.name,
      required this.rowyaName,
      this.child,
      this.onTap,
      this.imagePath,
      this.index = -1});

  final String name;
  final String rowyaName;
  final String? imagePath;
  final Widget? child;
  final GestureTapCallback? onTap;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 8.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 65.h,
                  width: 85.h,
                  color: Colors.transparent,
                  margin: const EdgeInsetsDirectional.only(end: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(imagePath ?? AppAssetsImage.alafasyImage,
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  constraints: BoxConstraints(maxWidth: 150.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(text: name, fontSize: 16),
                      const SizedBox(height: 5),
                      CustomText(
                          text: rowyaName, color: Colors.grey, fontSize: 10),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 10),
                  child: SizedBox(child: child),
                )
              ],
            ),
            if (index != -1)
              BlocBuilder<PercentBloc, PercentState>(
                builder: (context, state) {
                  if (index == state.index) {
                    debugPrint('index ${state.index}');
                    return LinearPercentIndicator(
                      isRTL: true,
                      percent: state.percent,
                      progressColor: AppColor.kPrimaryColor,
                      padding: const EdgeInsets.only(top: 1.5),
                    );
                  } else {
                    return Container();
                  }
                },
              )
          ],
        ),
      ),
    );
  }
}
