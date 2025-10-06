import 'package:flutter/material.dart';
import 'package:new_untitled/core/utils/extensions/extension.dart';
import '../../core/config/route/app_routes.dart';
import 'package:get/get.dart';
import '../../core/utils/constants/app_images.dart';
import '../../core/component/image/common_image.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      // if (LocalStorage.isLogIn) {
      //   if (LocalStorage.myRole == 'consultant') {
      //     Get.offAllNamed(AppRoutes.doctorHome);
      //   } else {
      //     Get.offAllNamed(AppRoutes.patientsHome);
      //   }
      // } else {
      Get.offAllNamed(AppRoutes.onboarding);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CommonImage(imageSrc: AppImages.noImage, size: 70).center,
    );
  }
}
