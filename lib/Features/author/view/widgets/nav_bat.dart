import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_color.dart';
import '../../../../core/shared/custom_button.dart';
import '../bloc/author/author_bloc.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        children: [
          CustomButton(
            width: 0.4,
            height: 40,
            fontSize: 14,
            text: 'عرض الكل',
            textColor: isSelected ? Colors.black : Colors.white,
            color:
                isSelected ? AppColor.kSPrimaryColor : AppColor.kPrimaryColor,
            onTap: () {
              context.read<AuthorBloc>().add(LoadingPlayListReciter());
              setState(() {
                isSelected = false;
              });
            },
          ),
          const Spacer(),
          CustomButton(
            width: 0.4,
            height: 40,
            fontSize: 14,
            text: 'التحميلات',
            textColor: isSelected ? Colors.white : Colors.black,
            color:
                isSelected ? AppColor.kPrimaryColor : AppColor.kSPrimaryColor,
            onTap: () {
              context.read<AuthorBloc>().add(DownloadedPlayListReciter());
              setState(() {
                isSelected = true;
              });
            },
          ),
        ],
      ),
    );
  }
}
