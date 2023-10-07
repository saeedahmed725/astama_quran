import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svg_flutter/svg.dart';

import '../bloc/home_bloc.dart';
import '../../../../core/constants/app_assets_image.dart';
import '../../../../core/constants/app_color.dart';


class PlayButton extends StatelessWidget {
  const PlayButton({super.key, required this.index, this.child});

  final int index;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: AppColor.kPrimaryColor,
      child: child,
    );
  }
}
