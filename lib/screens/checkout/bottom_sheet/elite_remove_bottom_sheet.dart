import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/widgets/common/common_button.dart';
import 'package:yes_madam/widgets/common/common_text.dart';
import 'package:yes_madam/widgets/components/spacing_widget.dart';

class EliteRemoveBottomSheet {
  static Future<void> show(
      BuildContext context, {
        required VoidCallback onRemove,
      }) {
    return Get.bottomSheet(
      Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            margin: EdgeInsets.only(top: 30.h),
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(24.r),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Spacing.height(20),

                /// Title
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 22.sp,
                      color: AppColors.blackColor,
                    ),
                    children: [
                      TextSpan(
                        text: 'Are you sure you want to pay\n',
                        style: TextStyle(
                          fontWeight: AppFontWeights.regular,
                        ),
                      ),
                      TextSpan(
                        text: '₹100 more',
                        style: TextStyle(
                          fontWeight: AppFontWeights.bold,
                        ),
                      ),
                      TextSpan(
                        text: ' on this booking?',
                        style: TextStyle(
                          fontWeight: AppFontWeights.regular,
                        ),
                      ),
                    ],
                  ),
                ),

                Spacing.height(24),

                /// Save Card
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    color: const Color(0xffFEF9ED),
                    border: Border.all(
                      color: AppColors.goldColor,
                    ),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: AppFontSizes.fontMedium + 2.sp,
                        fontWeight: AppFontWeights.bold,
                        color: AppColors.blackColor,
                      ),
                      children: [
                        const TextSpan(text: 'You can '),
                        TextSpan(
                          text: 'save ₹1000',
                          style: TextStyle(
                            color: AppColors.goldColor,
                          ),
                        ),
                        const TextSpan(
                          text: ' in next 6 months\nwith ',
                        ),
                        TextSpan(
                          text: 'Elite',
                          style: TextStyle(
                            color: AppColors.goldColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Spacing.height(24),

                /// Keep Elite Button
                CommonButton(
                  text: 'Keep Elite',
                  width: double.infinity,
                  height: 52.h,
                  backgroundColor: AppColors.blackColor,
                  textColor: AppColors.whiteColor,
                  fontWeight: AppFontWeights.bold,
                  onPressed: () {
                    Get.back();
                  },
                ),

                Spacing.height(16),

                /// Remove Membership
                GestureDetector(
                  onTap: () {
                    Get.back();
                    onRemove();
                  },
                  child: CommonText(
                    text: 'I WANT TO PAY MORE',
                    color: AppColors.goldColor,
                    fontWeight: AppFontWeights.bold,
                    fontSize: AppFontSizes.fontSmall,
                  ),
                ),

                Spacing.height(20),
              ],
            ),
          ),
          Positioned(
            right: 16.w,
            top: -10.h,
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                height: 35.h,
                width: 35.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.12),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.close,
                  color: Colors.black,
                  size: 22.sp,
                ),
              ),
            ),
          ),
        ],
      ),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
    );
  }
}