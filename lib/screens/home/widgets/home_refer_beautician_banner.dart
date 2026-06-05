import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_dimensions.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/utils/app_texts.dart';
import 'package:yes_madam/widgets/common/common_text.dart';

class HomeReferBeauticianBanner extends StatelessWidget {
  const HomeReferBeauticianBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96.h,
      margin: EdgeInsets.fromLTRB(
        AppDimensions.paddingMedium.w,
        AppDimensions.spacingXXLarge.h,
        AppDimensions.paddingMedium.w,
        AppDimensions.spacingXXLarge.h,
      ),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.creamBackground,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium.r),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 18.w,
            right: 30.w,
            top: 18.h,
            height: 52.h,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.themeColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppDimensions.radiusSmall.r),
                  topRight: Radius.circular(AppDimensions.radiusXLarge.r),
                  bottomLeft: Radius.circular(AppDimensions.radiusSmall.r),
                  bottomRight: Radius.circular(AppDimensions.radiusXLarge.r),
                ),
              ),
            ),
          ),
          Positioned(
            left: 30.w,
            top: 27.h,
            width: 230.w,
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: AppFontSizes.fontMedium,
                  fontWeight: AppFontWeights.extraBold,
                  height: 1.18,
                ),
                children: [
                  const TextSpan(text: AppTexts.referBeauticianPrefix),
                  TextSpan(
                    text: AppTexts.referBeauticianAmount,
                    style: TextStyle(color: const Color(0xFFFFC85A)),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 30.w,
            bottom: 16.h,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: const Color(0xFFFFC85A),
                borderRadius: BorderRadius.circular(
                  AppDimensions.radiusSmall.r,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.person_add_alt_1,
                    size: AppDimensions.iconSmall.sp,
                    color: const Color(0xFF7C2442),
                  ),
                  SizedBox(width: AppDimensions.spacingSmall.w),
                  CommonText(
                    text: AppTexts.referNow,
                    fontSize: AppFontSizes.fontSmall,
                    fontWeight: AppFontWeights.extraBold,
                    color: const Color(0xFF7C2442),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 18.w,
            top: 14.h,
            child: Transform.rotate(
              angle: -0.18,
              child: Icon(
                Icons.campaign,
                size: 80.sp,
                color: const Color(0xFFB72A5A),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
