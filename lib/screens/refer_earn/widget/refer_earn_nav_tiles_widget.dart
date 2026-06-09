import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yes_madam/routes/app_routes.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_dimensions.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/widgets/common/common_text.dart';
import 'package:yes_madam/widgets/components/spacing_widget.dart';

class ReferEarnNavTilesWidget extends StatelessWidget {
  const ReferEarnNavTilesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingMedium.w,
        vertical: AppDimensions.paddingSmall.h,
      ),
      child: Column(
        children: [
          _NavTile(
            title: 'Frequently asked questions',
            onTap: () => Get.toNamed(AppRoutes.referEarnFaq),
          ),
          Spacing.height(16),
          _NavTile(
            title: 'Terms & conditions',
            onTap: () => Get.toNamed(AppRoutes.termsConditions),
          ),
        ],
      ),
    );
  }
}

class _NavTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _NavTile({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h,
        horizontal: 16.w),
        decoration: BoxDecoration(
            color:  Color(0xFF8389e3),
          borderRadius:
              BorderRadius.circular(AppDimensions.radiusXLarge.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonText(
              text: title,
              fontSize: AppFontSizes.fontMedium,
              fontWeight: AppFontWeights.medium,
              color: AppColors.whiteColor,
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: AppDimensions.iconSmall,
              color: AppColors.whiteColor,
            ),
          ],
        ),
      ),
    );
  }
}
