import 'package:astama/core/shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../core/constants/static.dart';


class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          boxShadow: [BoxShadow(color: Colors.grey.shade400, blurRadius: 5)]),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: Static.iconButtomNavList.length,
        itemBuilder: (context, index) {
          return SizedBox(
            width: 1.sw / 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(Static.iconButtomNavList[index], height: 20),
                const SizedBox(height: 5),
                CustomText(
                    text: Static.nameIconButtomNavList[index],
                    fontSize: 11,
                    color: Colors.grey)
              ],
            ),
          );
        },
      ),
    );
  }
}
