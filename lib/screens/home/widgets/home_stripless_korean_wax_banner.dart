import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_dimensions.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/utils/app_texts.dart';
import 'package:yes_madam/widgets/common/common_text.dart';
import 'package:yes_madam/widgets/components/spacing_widget.dart';

class HomeStriplessKoreanWaxBanner extends StatelessWidget {
  const HomeStriplessKoreanWaxBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.h,
      margin: EdgeInsets.fromLTRB(
        AppDimensions.paddingMedium.w,
        AppDimensions.spacingXXLarge.h,
        AppDimensions.paddingMedium.w,
        0,
      ),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.lightPink,
        borderRadius: BorderRadius.circular(AppDimensions.radiusLarge.r),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -18.w,
            top: -8.h,
            bottom: -8.h,
            width: 178.w,
            child: Image.network(
              'https://images.unsplash.com/photo-1596462502278-27bfdc403348?w=700',
              fit: BoxFit.cover,
              color: AppColors.lightPink.withValues(alpha: 0.28),
              colorBlendMode: BlendMode.lighten,
            ),
          ),
          Positioned(
            left: 34.w,
            top: 15.h,
            width: 210.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF98229D),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4.r),
                      bottomRight: Radius.circular(4.r),
                    ),
                  ),
                  child: CommonText(
                    text: AppTexts.newText.toUpperCase(),
                    fontSize: AppFontSizes.fontNenoSmall,
                    fontWeight: AppFontWeights.extraBold,
                    color: AppColors.whiteColor,
                  ),
                ),
                Spacing.height(AppDimensions.spacingSmall),
                CommonText(
                  text: AppTexts.striplessKoreanWaxTitle,
                  fontSize: AppFontSizes.fontXMedium,
                  fontWeight: AppFontWeights.extraBold,
                  color: const Color(0xFF98229D),
                  textHeight: 1.2,
                  softWrap: true,
                ),
                Spacing.height(34),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF98229D),
                    borderRadius: BorderRadius.circular(
                      AppDimensions.radiusSmall.r + 2.r,
                    ),
                  ),
                  child: CommonText(
                    text: AppTexts.bookNowTitleCase,
                    fontSize: AppFontSizes.fontSmall,
                    fontWeight: AppFontWeights.bold,
                    color: AppColors.whiteColor,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 26.w,
            bottom: 22.h,
            child: Container(
              width: 74.w,
              height: 100.h,
              padding: EdgeInsets.all(AppDimensions.spacingMedium.w),
              decoration: BoxDecoration(
                color: const Color(0xFFD87FE1),
                borderRadius: BorderRadius.circular(
                  AppDimensions.radiusSmall.r,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x33000000),
                    blurRadius: 12,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  CommonText(
                    text: 'SOKORA',
                    fontSize: AppFontSizes.fontNenoSmall,
                    fontWeight: AppFontWeights.extraBold,
                    color: AppColors.whiteColor,
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(),
                  CommonText(
                    text: 'KOREAN\nWAX',
                    fontSize: AppFontSizes.fontSmall,
                    fontWeight: AppFontWeights.black,
                    color: const Color(0xFF98229D),
                    textAlign: TextAlign.center,
                    textHeight: 1.05,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
