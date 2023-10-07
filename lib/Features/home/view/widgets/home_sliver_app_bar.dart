import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/shared/custom_text.dart';

class HomeSliverAppbar extends StatelessWidget {
  const HomeSliverAppbar({super.key, required this.scaffoldKey});

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: const CustomText(text: 'الرئيسية', fontSize: 20),
      centerTitle: false,
      toolbarHeight: 60.h,
      pinned: true,
      floating: false,
      snap: false,
    );
  }
}
