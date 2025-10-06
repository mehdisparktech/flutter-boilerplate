import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_untitled/core/component/button/common_button.dart';
import 'package:new_untitled/core/component/text/common_text.dart';
import 'package:new_untitled/core/utils/constants/app_colors.dart';

class CustomTimePickerDialog {
  /// Shows a custom time picker dialog with the design matching the provided image
  static void show({
    required BuildContext context,
    TimeOfDay? initialTime,
    required Function(TimeOfDay) onTimeSelected,
  }) {
    final TimeOfDay currentTime = initialTime ?? TimeOfDay.now();
    int selectedHour = currentTime.hour;
    int selectedMinute = currentTime.minute;

    // Controllers for text input
    final TextEditingController hourController = TextEditingController(
      text: selectedHour.toString().padLeft(2, '0'),
    );
    final TextEditingController minuteController = TextEditingController(
      text: selectedMinute.toString().padLeft(2, '0'),
    );

    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: const Color(0xFFEFF7E5), // Light blue background
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: StatefulBuilder(
            builder: (context, setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Hour and Minute input sections
                  Row(
                    children: [
                      // Type Hours section with input field
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 6.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(25.r),
                            border: Border.all(
                              color: const Color(0xFF056B82),
                              width: 2,
                            ),
                          ),
                          child: TextField(
                            controller: hourController,
                            keyboardType: TextInputType.phone,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF666666),
                            ),
                            decoration: const InputDecoration(
                              hintText: 'Type Hours',
                              hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF666666),
                              ),
                              border: InputBorder.none,
                            ),
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                int? hour = int.tryParse(value);
                                if (hour != null && hour >= 0 && hour <= 23) {
                                  setState(() {
                                    selectedHour = hour;
                                  });
                                }
                              }
                            },
                          ),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      // Type Minutes section with input field
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 6.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(25.r),
                            border: Border.all(
                              color: const Color(0xFF056B82),
                              width: 2,
                            ),
                          ),
                          child: TextField(
                            controller: minuteController,
                            keyboardType: TextInputType.phone,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF666666),
                            ),
                            decoration: const InputDecoration(
                              hintText: 'Type Minutes',
                              hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF666666),
                              ),
                              border: InputBorder.none,
                            ),
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                int? minute = int.tryParse(value);
                                if (minute != null &&
                                    minute >= 0 &&
                                    minute <= 59) {
                                  setState(() {
                                    selectedMinute = minute;
                                  });
                                }
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 16.h),

                  // Time display section
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 16.h,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFFEFF7E5),
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        color: const Color(0xFF056B82),
                        width: 2,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Hour picker
                        Expanded(
                          flex: 2,
                          child: GestureDetector(
                            onTap: () {
                              _showNumberPicker(
                                context: context,
                                title: 'Select Hour',
                                value: selectedHour,
                                minValue: 0,
                                maxValue: 23,
                                onChanged: (value) {
                                  setState(() {
                                    selectedHour = value;
                                    hourController.text = value
                                        .toString()
                                        .padLeft(2, '0');
                                  });
                                },
                              );
                            },
                            child: Center(
                              child: CommonText(
                                text: selectedHour.toString().padLeft(2, '0'),
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF056B82),
                              ),
                            ),
                          ),
                        ),

                        // Colon separator
                        CommonText(
                          text: ':',
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF056B82),
                        ),

                        // Minute picker
                        Expanded(
                          flex: 2,
                          child: GestureDetector(
                            onTap: () {
                              _showNumberPicker(
                                context: context,
                                title: 'Select Minute',
                                value: selectedMinute,
                                minValue: 0,
                                maxValue: 59,
                                onChanged: (value) {
                                  setState(() {
                                    selectedMinute = value;
                                    minuteController.text = value
                                        .toString()
                                        .padLeft(2, '0');
                                  });
                                },
                              );
                            },
                            child: Center(
                              child: CommonText(
                                text: selectedMinute.toString().padLeft(2, '0'),
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF056B82),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(width: 4.w),

                        // Uhr text
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: CommonText(
                              text: 'Uhr',
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20.h),

                  // Confirm button
                  Container(
                    width: double.infinity,
                    height: 50.h,
                    decoration: BoxDecoration(
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
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12.r),
                        onTap: () {
                          // Validate and parse input values
                          int? hour = int.tryParse(hourController.text);
                          int? minute = int.tryParse(minuteController.text);

                          // If input values are valid, use them
                          if (hour != null && hour >= 0 && hour <= 23) {
                            selectedHour = hour;
                          }
                          if (minute != null && minute >= 0 && minute <= 59) {
                            selectedMinute = minute;
                          }

                          final TimeOfDay selectedTime = TimeOfDay(
                            hour: selectedHour,
                            minute: selectedMinute,
                          );
                          Get.back();
                          onTimeSelected(selectedTime);
                        },
                        child: Center(
                          child: CommonText(
                            text: 'Confirm',
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  /// Shows a number picker dialog for hour/minute selection
  static void _showNumberPicker({
    required BuildContext context,
    required String title,
    required int value,
    required int minValue,
    required int maxValue,
    required Function(int) onChanged,
  }) {
    int selectedValue = value;

    Get.dialog(
      Dialog(
        child: Container(
          padding: EdgeInsets.all(20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CommonText(
                text: title,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
              SizedBox(height: 20.h),

              Container(
                height: 200.h,
                child: ListWheelScrollView.useDelegate(
                  itemExtent: 40.h,
                  perspective: 0.005,
                  diameterRatio: 1.2,
                  physics: const FixedExtentScrollPhysics(),
                  onSelectedItemChanged: (index) {
                    selectedValue = minValue + index;
                  },
                  childDelegate: ListWheelChildBuilderDelegate(
                    builder: (context, index) {
                      if (index < 0 || index >= (maxValue - minValue + 1)) {
                        return null;
                      }
                      final number = minValue + index;
                      return Center(
                        child: CommonText(
                          text: number.toString().padLeft(2, '0'),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color:
                              number == selectedValue
                                  ? const Color(0xFF056B82)
                                  : AppColors.primaryColor,
                        ),
                      );
                    },
                  ),
                ),
              ),

              SizedBox(height: 20.h),

              Row(
                children: [
                  Expanded(
                    child: CommonButton(
                      titleText: 'Cancel',
                      buttonColor: AppColors.primaryColor,
                      isGradient: false,
                      onTap: () => Get.back(),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: CommonButton(
                      titleText: 'OK',
                      onTap: () {
                        Get.back();
                        onChanged(selectedValue);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
