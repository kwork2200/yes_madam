import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_dimensions.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/utils/app_texts.dart';
import 'package:yes_madam/widgets/common/common_text.dart';
import 'package:yes_madam/widgets/components/spacing_widget.dart';

class HomeKoreanWaxRitualBanner extends StatelessWidget {
  const HomeKoreanWaxRitualBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.h,
      margin: EdgeInsets.fromLTRB(
        AppDimensions.paddingMedium.w,
        AppDimensions.spacingXXLarge.h - 15.h,
        AppDimensions.paddingMedium.w,
        0,
      ),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: const Color(0xFFF1B678),
        borderRadius: BorderRadius.circular(AppDimensions.radiusLarge.r),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              'https://images.unsplash.com/photo-1556228720-195a672e8a03?w=900',
              fit: BoxFit.cover,
              color: const Color(0xFFF1B678).withValues(alpha: 0.76),
              colorBlendMode: BlendMode.srcATop,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
              decoration: BoxDecoration(
                color: Color(0xFFa95d22),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(AppDimensions.radiusLarge.r),
                ),
              ),
              child: CommonText(
                text: AppTexts.koreanWaxArea,
                fontSize: AppFontSizes.fontNenoSmall,
                fontWeight: AppFontWeights.extraBold,
                color: AppColors.whiteColor,
              ),
            ),
          ),
          Positioned(
            left: 26.w,
            top: 50.h,
            width: 160.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: AppTexts.koreanWaxTitle,
                  fontSize: AppFontSizes.fontLarge,
                  fontWeight: AppFontWeights.extraBold,
                  color: AppColors.blackColor,
                  softWrap: true,
                ),
                CommonText(
                  text: AppTexts.koreanWaxSubtitle,
                  fontSize: AppFontSizes.fontNenoSmall,
                  fontWeight: AppFontWeights.bold,
                  color: Color(0xFFa95d22),
                ),
                CommonText(
                  text: AppTexts.koreanWaxPrice,
                  fontSize: AppFontSizes.fontMedium,
                  fontWeight: AppFontWeights.extraBold,
                  color: AppColors.blackColor,
                ),
                Spacing.height(AppDimensions.spacingXLarge),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 5.h,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFFa95d22),
                    borderRadius: BorderRadius.circular(
                      AppDimensions.radiusSmall.r -2.r,
                    ),
                  ),
                  child: CommonText(
                    text: AppTexts.bookNowTitleCase,
                    fontSize: AppFontSizes.fontMedium,
                    fontWeight: AppFontWeights.extraBold,
                    color: AppColors.whiteColor,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: -10.w,
            bottom: -4.h,
            width: 190.w,
            height: 168.h,
            child: Image.network(
              'https://images.unsplash.com/photo-1580618672591-eb180b1a973f?w=700',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
