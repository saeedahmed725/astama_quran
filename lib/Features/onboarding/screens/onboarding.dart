import 'package:flutter/material.dart';

import '../../../core/constants/app_color.dart';
import '../../../core/shared/custom_button.dart';
import '../../../core/shared/custom_text.dart';
import '../widgets/image_preview.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //Widget
            const ImagePreview(),
            const CustomText(
                text: 'قارئ القران', fontWeight: FontWeight.w700, fontSize: 35),
            const SizedBox(height: 15),
            const CustomText(
                text: 'استمع الى افضل قارئ القران\n في أي وقت وأي مكان',
                color: Colors.grey,
                fontWeight: FontWeight.w400,
                fontSize: 14),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CustomButton(text: 'دخول', fontSize: 20,color: AppColor.kPrimaryColor),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
