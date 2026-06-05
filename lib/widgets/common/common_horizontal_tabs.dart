import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_dimensions.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/widgets/common/common_text.dart';

class CommonHorizontalTabs extends StatelessWidget {
  final List<String> tabs;
  final int selectedIndex;
  final Function(int index) onTap;

  const CommonHorizontalTabs({
    super.key,
    required this.tabs,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.spacingXXLarge.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.paddingMedium.w,
        ),
        itemCount: tabs.length,
        itemBuilder: (_, i) {
          final selected = selectedIndex == i;

          return GestureDetector(
            onTap: () => onTap(i),
            child: Container(
              margin: EdgeInsets.only(right: AppDimensions.spacingMedium.w),
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.paddingMedium.w,
                vertical: AppDimensions.spacingSmall.h,
              ),
              decoration: BoxDecoration(
                color: selected ? AppColors.themeColor : Colors.transparent,
                borderRadius: BorderRadius.circular(
                  AppDimensions.radiusLarge.r,
                ),
                border: Border.all(
                  color: selected ? AppColors.themeColor : Colors.grey,
                ),
              ),
              child: Center(
                child: CommonText(
                  text: tabs[i],
                  fontSize: AppFontSizes.fontNenoSmall,
                  fontWeight: AppFontWeights.semiBold,
                  color: selected ? AppColors.whiteColor : AppColors.blackColor,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
