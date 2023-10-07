import 'package:astama/core/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';

import '../../../core/bloc/theme/theme_bloc.dart';
import '../../../core/constants/app_assets_image.dart';
import '../../../core/shared/custom_text.dart';

class PlayerSliverAppbar extends StatelessWidget {
  const PlayerSliverAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: const CustomText(text: 'المشغل الان', fontSize: 20),
      toolbarHeight: 56,
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          onPressed: context.back,
          highlightColor: Colors.transparent,
          icon: BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              if (state is LoadedThemeState) {
                return SvgPicture.asset(AppAssetsImage.arrowBackImage,
                    color: state.themeValue ? Colors.white : Colors.black,
                    height: 14);
              } else {
                return Container();
              }
            },
          ),
        )
      ],
      pinned: true,
      floating: false,
      snap: false,
    );
  }
}
