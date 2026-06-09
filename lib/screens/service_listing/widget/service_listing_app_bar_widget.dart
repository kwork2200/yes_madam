import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/widgets/common/common_text.dart';
import 'package:yes_madam/widgets/components/spacing_widget.dart';

class ServiceListingAppBarWidget extends StatelessWidget {
  const ServiceListingAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.whiteColor,
      elevation: 0,
      scrolledUnderElevation: 0,
      leadingWidth: 44.w,
      titleSpacing: 0,
      leading: GestureDetector(
        onTap: () => Get.back(),
        child: Icon(
          Icons.arrow_back_ios,
          size: 20.sp,
          color: AppColors.blackColor,
        ),
      ),
      title: CommonText(
        text: 'Beauty - Salon At H...',
        fontSize: AppFontSizes.fontXMedium,
        fontWeight: AppFontWeights.semiBold,
        color: AppColors.blackColor,
      ),
      centerTitle: false,
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 6.h,
            ),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(25.r),
              border: Border.all(
                color: AppColors.grey200,
                width: 1.w,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.search,
                  size: 18.sp,
                  color: AppColors.blackColor,
                ),
                Spacing.width(4),
                CommonText(
                  text: 'Search',
                  fontSize: AppFontSizes.fontSmall,
                  fontWeight: AppFontWeights.normal,
                  color: AppColors.blackColor,
                ),
              ],
            ),
          ),
        ),
        Spacing.width(12),
        Container(
          padding: EdgeInsets.all(4.w),
          decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.grey200,
              width: 1.w,
            ),
          ),
          child: Icon(
            Icons.share_outlined,
            size: 20.sp,
            color: AppColors.greyColor,
          ),
        ),
        Spacing.width(12),
      ],
    );
  }
}
