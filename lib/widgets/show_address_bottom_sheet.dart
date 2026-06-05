import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yes_madam/controller/account/account_controller.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_dimensions.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/widgets/common/common_text.dart';

// TODO: Import your project files here
// import 'package:your_app/controllers/account_controller.dart';
// import 'package:your_app/utils/app_colors.dart';
// import 'package:your_app/utils/app_dimensions.dart';
// import 'package:your_app/widgets/common_text.dart';

/// Helper function to open the Bottom Sheet from anywhere in the app
void showAddressBottomSheet() {
  Get.bottomSheet(
    AddressBottomSheet(), // Made this a public class
    backgroundColor: AppColors.whiteColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(AppDimensions.paddingMedium.r),
      ),
    ),
    isScrollControlled: true,
  );
}

class AddressBottomSheet extends StatelessWidget {
  AddressBottomSheet({super.key});

  final ctrl = Get.find<AccountController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppDimensions.paddingMedium.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: AppColors.accentColor,
                        size: AppFontSizes.fontLarge.sp,
                      ),
                      SizedBox(width: 6.w),
                      CommonText(
                        text: 'Add New Address',
                        fontSize: 15.sp,
                        color: AppColors.accentColor,
                        fontWeight: AppFontWeights.semiBold,
                      ),
                    ],
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: AppColors.accentColor,
                size: AppFontSizes.fontMedium.sp,
              ),
              SizedBox(width: AppDimensions.spacingMedium.w),
              GestureDetector(
                onTap: () => Get.back(),
                child: Container(
                  width: 32.w,
                  height: 32.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.darkColor,
                  ),
                  child: Icon(
                    Icons.close,
                    color: AppColors.whiteColor,
                    size: AppDimensions.iconSmall.sp,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: AppDimensions.spacingXLarge.h),

          CommonText(
            text: 'Saved Addresses',
            fontSize: 15.sp,
            fontWeight: AppFontWeights.bold,
            color: AppColors.darkColor,
          ),
          SizedBox(height: AppDimensions.spacingMedium.h),
          Obx(
                () => Column(
              children: ctrl.savedAddresses.asMap().entries.map((entry) {
                final addr = entry.value;
                return Container(
                  margin: EdgeInsets.only(
                    bottom: AppDimensions.spacingMedium.h,
                  ),
                  padding: EdgeInsets.all(AppDimensions.spacingLarge.w),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.grey200),
                    borderRadius: BorderRadius.circular(
                      AppDimensions.radiusSmall.r,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: AppDimensions.iconSmall.sp,
                        color: AppColors.accentColor,
                      ),
                      SizedBox(width: AppDimensions.spacingMedium.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                              text: addr['title'] ?? '',
                              fontSize: 13.sp,
                              fontWeight: AppFontWeights.semiBold,
                              color: AppColors.darkColor,
                            ),
                            CommonText(
                              text: addr['address'] ?? '',
                              fontSize: 11.sp,
                              color: AppColors.greyColor,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () => ctrl.deleteAddress(entry.key),
                        icon: Icon(
                          Icons.delete_outline,
                          size: 18.sp,
                          color: AppColors.greyColor,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),

          SizedBox(height: AppDimensions.spacingMedium.h),

          // Present address
          CommonText(
            text: 'Present address',
            fontSize: 15.sp,
            fontWeight: AppFontWeights.bold,
            color: AppColors.darkColor,
          ),
          SizedBox(height: AppDimensions.spacingMedium.h),

          Container(
            padding: EdgeInsets.all(AppDimensions.spacingLarge.w),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.accentColor, width: 1.5),
              borderRadius: BorderRadius.circular(AppDimensions.radiusSmall.r),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.access_time,
                  size: AppDimensions.iconSmall.sp,
                  color: AppColors.greyColor,
                ),
                SizedBox(width: AppDimensions.spacingMedium.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: ctrl.presentAddress['title'] ?? '',
                        fontSize: 13.sp,
                        fontWeight: AppFontWeights.semiBold,
                        color: AppColors.darkColor,
                      ),
                      CommonText(
                        text: ctrl.presentAddress['address'] ?? '',
                        fontSize: 11.sp,
                        color: AppColors.greyColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: AppDimensions.radiusXLarge.h),
        ],
      ),
    );
  }
}