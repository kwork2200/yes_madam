import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yes_madam/controller/refer_earn/refer_earn_controller.dart';
import 'package:yes_madam/routes/app_routes.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_dimensions.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/widgets/common/common_text.dart';
import 'package:yes_madam/widgets/components/spacing_widget.dart';

class ReferEarnViewRewardsWidget extends GetView<ReferEarnController> {
  const ReferEarnViewRewardsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top:AppDimensions.paddingXLarge.h ,
        left: AppDimensions.paddingXLarge60.w,
        right: AppDimensions.paddingXLarge60.w,
        bottom: AppDimensions.paddingMedium.h,
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.referEarnJourney);
            },
            child: Container(
              height: 40.h,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.appSoftYellow,
                borderRadius: BorderRadius.circular(AppDimensions.radiusSmall.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonText(
                    text: 'VIEW ALL REWARDS',
                    fontSize: AppFontSizes.fontMedium,
                    fontWeight: AppFontWeights.bold,
                    color: AppColors.blackColor,
                    letterSpacing: 0.5,
                  ),
                  Spacing.width(6),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 18.r,
                    color: AppColors.blackColor,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
