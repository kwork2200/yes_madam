import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yes_madam/controller/search/search_controller.dart' as search;
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_dimensions.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/widgets/common/common_text.dart';
import 'package:yes_madam/widgets/components/spacing_widget.dart';
import 'search_service_card.dart';

class RecentChipCard extends StatelessWidget {
  final Map<String, String> item;
  final VoidCallback onTap;

  const RecentChipCard({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final image = item['image']!;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
          color: const Color(0xFFfff8f8),
          borderRadius: BorderRadius.circular(AppDimensions.radiusSmall.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.grey400,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            if (image.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(5.r),
                child: Image.network(
                  image,
                  width: 24.w,
                  height: 24.w,
                  fit: BoxFit.cover,
                ),
              )
            else
              Icon(Icons.history, size: 22.sp, color: AppColors.grey),
            Spacing.width(AppDimensions.spacingMedium),
            CommonText(
              text: item['title']!,
              fontSize: AppFontSizes.fontMedium,
              fontWeight: AppFontWeights.medium,
              color: AppColors.blackColor,
            ),
          ],
        ),
      ),
    );
  }
}

class TrendingChipCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const TrendingChipCard({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 5.h),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(AppDimensions.radiusSmall.r),
          border: Border.all(color: AppColors.grey),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.trending_up, color: AppColors.grey, size: 16.sp),
            Spacing.width(AppDimensions.spacingSmall),
            CommonText(
              text: title,
              fontSize: AppFontSizes.fontMedium,
              fontWeight: AppFontWeights.normal,
              color: AppColors.blackColor,
            ),
          ],
        ),
      ),
    );
  }
}
