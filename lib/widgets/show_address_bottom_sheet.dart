import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yes_madam/controller/account/account_controller.dart';
import 'package:yes_madam/routes/app_routes.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_dimensions.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/widgets/common/common_text.dart';
import 'package:yes_madam/widgets/common/common_button.dart';

class GlobalSheets {
  static void showAddressBottomSheet() {
    Get.bottomSheet(
      Stack(
        clipBehavior: Clip.none,
        children: [
          AddressBottomSheet(),
          Positioned(
            top: -45.h,
            right: 10.w,
            child: GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                padding: EdgeInsets.all(6.r),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.close,
                  color: AppColors.blackColor,
                  size: 20.r,
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppDimensions.paddingMedium.r),
        ),
      ),
      isScrollControlled: true,
    );
  }
}

class AddressBottomSheet extends StatelessWidget {
  AddressBottomSheet({super.key});

  final ctrl = Get.find<AccountController>();
  final TextEditingController searchCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppDimensions.paddingMedium.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50.h,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              // color: AppColors.grey200.withOpacity(0.4),
              borderRadius: BorderRadius.circular(AppDimensions.radiusLarge.r),
              border: Border.all(color: AppColors.grey200),
            ),
            child: TextField(
              controller: searchCtrl,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.whiteColor,
                hintText: 'Search for area, street name',
                hintStyle: TextStyle( fontSize: 16.sp, color: AppColors.greyColor,fontWeight: AppFontWeights.semiBold ),
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.darkColor,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          SizedBox(height: 16.h),
          GestureDetector(
            onTap: () {
              Get.back();
              Get.toNamed(AppRoutes.addAddress);
            },
            child: Row(
              children: [
                Expanded(
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
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.accentColor,
                  size: AppFontSizes.fontMedium.sp,
                ),
              ],
            ),
          ),
          Divider(color: AppColors.grey200, height: 24.h),
          GestureDetector(
            onTap: () {
              Get.back();
              Get.toNamed(AppRoutes.location);
            },
            child: Row(
              children: [
                Icon(
                  Icons.my_location,
                  color: AppColors.accentColor,
                  size: 18.sp,
                ),
                SizedBox(width: 8.w),
                CommonText(
                  text: 'Use your current location',
                  fontSize: 14.sp,
                  color: AppColors.accentColor,
                  fontWeight: AppFontWeights.semiBold,
                ),
              ],
            ),
          ),
          SizedBox(height: AppDimensions.spacingLarge.h),
          CommonText(
            text: 'Saved Addresses',
            fontSize: 15.sp,
            fontWeight: AppFontWeights.bold,
            color: AppColors.darkColor,
          ),
          SizedBox(height: AppDimensions.spacingMedium.h),
          Obx(() {
            if (ctrl.savedAddresses.isEmpty) {
              return _buildEmptyState();
            }
            return Column(
              children: ctrl.savedAddresses.asMap().entries.map((entry) {
                final address = entry.value;
                final String title = address['title'] ?? '';
                final String fullAddress = address['address'] ?? '';

                return GestureDetector(
                  onTap: () {
                    ctrl.updatePresentAddress(title, fullAddress);
                    Get.back();
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: AppDimensions.spacingMedium.h),
                    padding: EdgeInsets.all(AppDimensions.spacingLarge.w),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.grey200),
                      borderRadius: BorderRadius.circular(AppDimensions.radiusSmall.r),
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
                                text: title,
                                fontSize: 13.sp,
                                fontWeight: AppFontWeights.semiBold,
                                color: AppColors.darkColor,
                              ),
                              CommonText(
                                text: fullAddress,
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
                  ),
                );
              }).toList(),
            );
          }),
          SizedBox(height: AppDimensions.spacingMedium.h),
          CommonText(
            text: 'Present address',
            fontSize: 14.sp,
            fontWeight: AppFontWeights.semiBold,
            color: AppColors.darkColor,
          ),
          SizedBox(height: AppDimensions.spacingMedium.h),
          Obx(() => Container(
            padding: EdgeInsets.all(AppDimensions.spacingLarge.w),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.accentColor, width: 1.5),
              borderRadius: BorderRadius.circular(AppDimensions.radiusMedium.r),
              color: AppColors.lightPinkColor.withOpacity(0.5),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                        fontSize: 12.sp,
                        fontWeight: AppFontWeights.semiBold,
                        color: AppColors.darkColor,
                      ),
                      CommonText(
                        text: ctrl.presentAddress['address'] ?? '',
                        fontSize: 10.sp,
                        color: AppColors.greyColor,
                        fontWeight: AppFontWeights.semiBold,
                        softWrap: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
          SizedBox(height: AppDimensions.radiusXLarge.h),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Column(
      children: [
        SizedBox(height: 12.h),
        Center(
          child: Container(
            height: 150.h,
            width: 150.w,
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              shape: BoxShape.circle,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 140.h,
                  width: 140.w,
                  decoration: BoxDecoration(
                    color: Colors.lightBlue.shade100.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                ),
                Icon(Icons.map_outlined, size: 72.sp, color: Colors.orange.shade400),
                Positioned(
                  bottom: 30.h,
                  right: 30.w,
                  child: Container(
                    padding: EdgeInsets.all(4.w),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.location_on, size: 18.sp, color: Colors.orange.shade600),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 16.h),
        CommonText(
          text: 'Oops! No saved address',
          fontSize: AppFontSizes.fontXMedium,
          fontWeight: AppFontWeights.bold,
          color: AppColors.darkColor,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8.h),
        CommonText(
          text: "You don't have any saved address.\nSaving address helps checkout faster",
          fontSize: AppFontSizes.fontSmall,
          fontWeight: AppFontWeights.normal,
          color: AppColors.greyColor,
          textAlign: TextAlign.center,
          softWrap: true,
        ),
        SizedBox(height: 20.h),
        CommonButton(
          text: 'Add New Address',
          onPressed: () {
            Get.back();
            Get.toNamed(AppRoutes.addAddress);
          },
          width: 170.w,
          height: 40.h,
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}