import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yes_madam/controller/splash/splash_controller.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_dimensions.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/utils/app_texts.dart';
import 'package:yes_madam/widgets/common/common_text.dart';
import 'package:yes_madam/widgets/components/spacing_widget.dart';
import 'package:yes_madam/widgets/yes_madam_logo.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.navigateToLogin();

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.lightPinkColor,
              AppColors.whiteColor,
              AppColors.whiteColor,
              AppColors.lightPinkColor,
            ],
            stops: [0.0, 0.35, 0.80, 1.0],
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimensions.paddingXLarge40.w,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                YesMadamLogo(width: double.infinity,),
                Spacing.height(AppDimensions.paddingSmall - 7),
                CommonText(
                  text: AppTexts.splashTitle,
                  textAlign: TextAlign.center,
                  color: AppColors.blackColor,
                  fontSize: AppFontSizes.fontXMedium+ 2.sp,
                  fontWeight: AppFontWeights.normal,
                  fontStyle: FontStyle.italic,
                  letterSpacing: 0.5,
                ),
                Spacing.height(AppDimensions.paddingLarge-2),
                Container(
                  height: 1.6.h,
                  width: 200.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      AppDimensions.radiusMedium.r,
                    ),
                    gradient: LinearGradient(
                      colors: [
                        AppColors.greyColor.withOpacity(0.05),
                        AppColors.greyColor.withOpacity(0.8),
                        AppColors.greyColor.withOpacity(0.05),
                      ],
                    ),
                  ),
                ),
                Spacing.height(AppDimensions.paddingLarge-2),
                CommonText(
                  text: AppTexts.splashCustomers,
                  color: AppColors.blackColor,
                  fontSize: AppFontSizes.fontXMedium + 2.sp,
                  fontWeight: AppFontWeights.bold,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
