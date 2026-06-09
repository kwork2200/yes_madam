import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yes_madam/controller/service_listing/service_listing_controller.dart';
import 'package:yes_madam/model/service_model.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/widgets/common/common_text.dart';

class ServiceListingServiceCardWidget extends GetView<ServiceListingController> {
  final ServiceModel service;

  const ServiceListingServiceCardWidget({
    super.key,
    required this.service,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      /// pending
      // onTap: () => _showDetailSheet(context),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.borderColor),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Service image / banner
            _buildServiceImage(),
            Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Recent bookings badge
                  if (service.recentBookings.isNotEmpty) _buildRecentBookingsBadge(),
                  SizedBox(height: 6.h),
                  // Title
                  CommonText(
                    text: service.name,
                    fontSize: AppFontSizes.fontXMedium,
                    fontWeight: AppFontWeights.bold,
                    color: AppColors.blackColor,
                  ),
                  SizedBox(height: 2.h),
                  // Subtitle
                  CommonText(
                    text: service.subtitle,
                    fontSize: AppFontSizes.fontSmall,
                    fontWeight: AppFontWeights.normal,
                    color: AppColors.greyColor,
                  ),
                  SizedBox(height: 6.h),
                  // Rating
                  _buildRatingRow(),
                  SizedBox(height: 8.h),
                  // Duration + Price + Button
                  _buildPriceRow(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceImage() {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
      child: Container(
        width: double.infinity,
        height: 160.h,
        color: const Color(0xFFF0F0F0),
        child: Center(
          child: Icon(Icons.spa_outlined, size: 48.sp, color: Colors.grey.shade400),
        ),
      ),
    );
  }

  Widget _buildRecentBookingsBadge() {
    return Row(
      children: [
        // Stacked avatar icons
        SizedBox(
          width: 40.w,
          height: 18.h,
          child: Stack(
            children: List.generate(
              3,
                  (i) => Positioned(
                left: (i * 10).toDouble(),
                child: CircleAvatar(
                  radius: 9.r,
                  backgroundColor: Colors.orange.shade300,
                  child: Icon(Icons.person, size: 10.sp, color: AppColors.whiteColor),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 4.w),
        CommonText(
          text: service.recentBookings,
          fontSize: AppFontSizes.fontNenoSmall,
          fontWeight: AppFontWeights.medium,
          color: AppColors.blackColor,
        ),
      ],
    );
  }

  Widget _buildRatingRow() {
    return Row(
      children: [
        Icon(Icons.star, size: 14.sp, color: Colors.amber),
        SizedBox(width: 2.w),
        CommonText(
          text: service.rating.toStringAsFixed(2),
          fontSize: AppFontSizes.fontSmall,
          fontWeight: AppFontWeights.semiBold,
          color: AppColors.blackColor,
        ),
        SizedBox(width: 4.w),
        CommonText(
          text: '(${_formatCount(service.reviewCount)} ratings)',
          fontSize: AppFontSizes.fontSmall,
          fontWeight: AppFontWeights.normal,
          color: AppColors.greyColor,
        ),
      ],
    );
  }

  Widget _buildPriceRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.access_time, size: 12.sp, color: AppColors.greyColor),
                SizedBox(width: 4.w),
                CommonText(
                  text: service.duration,
                  fontSize: AppFontSizes.fontNenoSmall,
                  fontWeight: AppFontWeights.normal,
                  color: AppColors.greyColor,
                ),
              ],
            ),
            SizedBox(height: 4.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CommonText(
                  text: '₹${service.price}',
                  fontSize: AppFontSizes.fontXMedium,
                  fontWeight: AppFontWeights.bold,
                  color: AppColors.blackColor,
                ),
                SizedBox(width: 6.w),
                CommonText(
                  text: '₹${service.originalPrice}',
                  fontSize: AppFontSizes.fontSmall,
                  fontWeight: AppFontWeights.normal,
                  color: AppColors.greyColor,
                  decoration: TextDecoration.lineThrough,
                ),
                SizedBox(width: 6.w),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1B7A4E).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.bolt, size: 10.sp, color: const Color(0xFF1B7A4E)),
                      CommonText(
                        text: '${service.discountPercent}% OFF',
                        fontSize: AppFontSizes.fontNenoSmall,
                        fontWeight: AppFontWeights.bold,
                        color: const Color(0xFF1B7A4E),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        // Add / Quantity buttons
        Obx(() {
          final qty = controller.getItemQuantity(service.id);
          if (qty == 0) {
            return _buildAddButton();
          } else {
            return _buildQuantityControl(qty);
          }
        }),
      ],
    );
  }

  Widget _buildAddButton() {
    return OutlinedButton(
      onPressed: () => controller.addToCart(service),
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: AppColors.themeColor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
      ),
      child: CommonText(
        text: 'ADD',
        fontSize: AppFontSizes.fontSmall,
        fontWeight: AppFontWeights.bold,
        color: AppColors.themeColor,
      ),
    );
  }

  Widget _buildQuantityControl(int qty) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.themeColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => controller.removeFromCart(service),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
              child: Icon(Icons.remove, size: 16.sp, color: AppColors.whiteColor),
            ),
          ),
          CommonText(
            text: '$qty',
            fontSize: AppFontSizes.fontSmall,
            fontWeight: AppFontWeights.bold,
            color: AppColors.whiteColor,
          ),
          GestureDetector(
            onTap: () => controller.addToCart(service),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
              child: Icon(Icons.add, size: 16.sp, color: AppColors.whiteColor),
            ),
          ),
        ],
      ),
    );
  }

  // void _showDetailSheet(BuildContext context) {
  //   showModalBottomSheet(
  //     context: context,
  //     isScrollControlled: true,
  //     backgroundColor: Colors.transparent,
  //     builder: (_) => ServiceDetailBottomSheetWidget(service: service),
  //   );
  // }

  String _formatCount(int count) {
    if (count >= 100000) return '${(count / 100000).toStringAsFixed(1)}L';
    if (count >= 1000) return '${(count / 1000).toStringAsFixed(0)}K';
    return count.toString();
  }
}