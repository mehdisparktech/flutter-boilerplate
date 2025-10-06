import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_untitled/core/component/button/common_button.dart';
import 'package:new_untitled/core/component/text/common_text.dart';
import 'package:new_untitled/core/utils/constants/app_colors.dart';

class SuccessDialog {
  /// Shows a reusable success dialog with customizable content
  static void show({
    required String message,
    String? buttonText,
    VoidCallback? onTap,
    IconData? icon,
  }) {
    Get.dialog(
      Dialog(
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Container(
          padding: EdgeInsets.all(24.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Icon with circular background
              Container(
                width: 80.w,
                height: 80.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    begin: Alignment(-0.9, 0),
                    end: Alignment(1.0, 0),
                    colors: [
                      Color(0xFF083E4B), // #083E4B
                      Color(0xFF074E5E), // #074E5E
                      Color(0xFF0288A6), // #0288A6
                    ],
                    stops: [0.0, 0.4, 1.0],
                  ),
                ),
                child: Icon(
                  icon ?? Icons.check,
                  color: AppColors.white,
                  size: 40.sp,
                ),
              ),
              SizedBox(height: 24.h),

              // Success message
              CommonText(
                text: message,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
                textAlign: TextAlign.center,
                maxLines: 3,
              ),
              SizedBox(height: 32.h),

              // Action button
              CommonButton(
                titleText: buttonText ?? "OK",
                onTap: onTap ?? () => Get.back(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Shows a success dialog specifically for application submission
  static void showApplicationSuccess({VoidCallback? onBackToHome}) {
    show(
      message: 'Your application has been submitted',
      buttonText: "Back to Home",
      onTap: onBackToHome ?? () => Get.back(),
    );
  }

  /// Shows a success dialog with custom navigation
  static void showWithNavigation({
    required String message,
    required String buttonText,
    required String routeName,
    Map<String, dynamic>? arguments,
    bool offAllNamed = false,
  }) {
    show(
      message: message,
      buttonText: buttonText,
      onTap: () {
        if (offAllNamed) {
          Get.offAllNamed(routeName, arguments: arguments);
        } else {
          Get.toNamed(routeName, arguments: arguments);
        }
      },
    );
  }
}
