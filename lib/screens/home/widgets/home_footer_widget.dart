import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_dimensions.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/utils/app_texts.dart';
import 'package:yes_madam/widgets/common/common_text.dart';
import 'package:yes_madam/widgets/components/spacing_widget.dart';
import 'package:yes_madam/widgets/yes_madam_logo.dart';

class HomeFooterWidget extends StatelessWidget {
  const HomeFooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFFF1F0F5),
      padding: EdgeInsets.fromLTRB(
        AppDimensions.paddingXMedium.w,
        40.h,
        AppDimensions.paddingXMedium.w,
        52.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: AppTexts.indiasMostLovedApp,
            fontSize: AppFontSizes.fontXLarge26,
            fontWeight: AppFontWeights.black,
            color: const Color(0xFFC4C2C8),
            textHeight: 1.35,
            softWrap: true,
          ),
          Spacing.height(AppDimensions.spacingLarge),
          Divider(color: AppColors.grey400, thickness: 1.h),
          Spacing.height(AppDimensions.spacingLarge),
          Row(
            children: [
              CommonText(
                text: AppTexts.craftedWith,
                fontSize: AppFontSizes.fontSmall,
                fontWeight: AppFontWeights.semiBold,
                color: const Color(0xFF9C9AA1),
              ),
              Icon(Icons.favorite, color: AppColors.themeColor, size: 18.sp),
              CommonText(
                text: AppTexts.byTeam,
                fontSize: AppFontSizes.fontSmall,
                fontWeight: AppFontWeights.semiBold,
                color: const Color(0xFF9C9AA1),
              ),
              YesMadamLogo(color: AppColors.greyColor,height: 30.h,width: 100.w),
            ],
          ),
          Spacing.height(100),

        ],
      ),
    );
  }
}
