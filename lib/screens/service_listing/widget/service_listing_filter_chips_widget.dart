import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yes_madam/controller/service_listing/service_listing_controller.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/widgets/common/common_text.dart';

class ServiceListingFilterChipsWidget extends GetView<ServiceListingController> {
  const ServiceListingFilterChipsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Obx(() => Row(
          children: [
            // Filter button
            _buildFilterButton(),
            SizedBox(width: 8.w),
            // Concerns dropdown
            _buildDropdownChip('Concerns'),
            SizedBox(width: 8.w),
            // Skin Type dropdown
            _buildDropdownChip('Skin Type'),
            SizedBox(width: 8.w),
            // Filter chips
            ...controller.filterChips.map(
                  (chip) => Padding(
                padding: EdgeInsets.only(right: 8.w),
                child: _buildFilterChip(chip),
              ),
            ),
          ],
        )),
      ),
    );
  }

  Widget _buildFilterButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.inputBorderColor),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: [
          Icon(Icons.tune, size: 16.sp, color: AppColors.blackColor),
          SizedBox(width: 4.w),
          CommonText(
            text: 'Filter',
            fontSize: AppFontSizes.fontSmall,
            fontWeight: AppFontWeights.medium,
            color: AppColors.blackColor,
          ),
          SizedBox(width: 4.w),
          Icon(Icons.keyboard_arrow_down, size: 16.sp, color: AppColors.blackColor),
        ],
      ),
    );
  }

  Widget _buildDropdownChip(String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.inputBorderColor),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: [
          CommonText(
            text: label,
            fontSize: AppFontSizes.fontSmall,
            fontWeight: AppFontWeights.medium,
            color: AppColors.blackColor,
          ),
          SizedBox(width: 4.w),
          Icon(Icons.keyboard_arrow_down, size: 16.sp, color: AppColors.blackColor),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String chip) {
    final isSelected = controller.selectedFilterChip.value == chip;
    return GestureDetector(
      onTap: () => controller.selectFilterChip(chip),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.themeColor : AppColors.whiteColor,
          border: Border.all(
            color: isSelected ? AppColors.themeColor : AppColors.inputBorderColor,
          ),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: CommonText(
          text: chip,
          fontSize: AppFontSizes.fontSmall,
          fontWeight: AppFontWeights.medium,
          color: isSelected ? AppColors.whiteColor : AppColors.blackColor,
        ),
      ),
    );
  }
}