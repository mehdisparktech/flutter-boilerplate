import 'package:flutter/material.dart';
import '../../core/config/route/app_routes.dart';
import '../../core/utils/extensions/extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../core/utils/constants/app_images.dart';
import '../../core/utils/constants/app_string.dart';
import '../../core/component/button/common_button.dart';
import '../../core/component/image/common_image.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Column(
          children: [
            180.height,
            const Center(
              child: CommonImage(imageSrc: AppImages.noImage, size: 70),
            ),
            120.height,
            CommonButton(
              titleText: AppString.signIn,
              onTap: () => Get.toNamed(AppRoutes.signIn),
            ),
            24.height,
            CommonButton(
              titleText: AppString.signUp,
              onTap: () => Get.toNamed(AppRoutes.signUp),
            ),
          ],
        ),
      ),
    );
  }
}
