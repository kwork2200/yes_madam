import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yes_madam/controller/elite/elite_membership_controller.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_dimensions.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/widgets/common/common_text.dart';
import 'package:yes_madam/widgets/common/common_text_field.dart';
import 'package:yes_madam/widgets/components/spacing_widget.dart';

class ElitePaymentBottomSheet extends GetView<EliteMembershipController> {
  const ElitePaymentBottomSheet({super.key});

  static void show() {
    Get.bottomSheet(
      const ElitePaymentBottomSheet(),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.creamBackground,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppDimensions.radiusXLarge.r),
          topRight: Radius.circular(AppDimensions.radiusXLarge.r),
        ),
      ),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppDimensions.paddingXMedium.w, vertical: AppDimensions.paddingSmall.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      width: AppDimensions.iconLarge.w,
                      height: AppDimensions.iconLarge.w,
                      decoration: const BoxDecoration(
                        color: AppColors.whiteColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.close, size: AppDimensions.iconMedium.r, color: AppColors.blackColor),
                    ),
                  ),
                ],
              ),
              CommonText(
                text: 'Elite',
                fontSize: AppFontSizes.fontXLarge36,
                fontWeight: AppFontWeights.extraBold,
                color: AppColors.gold,
                textAlign: TextAlign.center,
              ),
              CommonText(
                text: 'Membership',
                fontSize: AppFontSizes.fontXMedium,
                fontWeight: AppFontWeights.black,
                color: AppColors.gold,
                textAlign: TextAlign.center,
              ),
              Spacing.height(4),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '1,076,530+ ',
                      style: TextStyle(
                        color: AppColors.gold,
                        fontSize: AppFontSizes.fontMedium,
                        fontWeight: AppFontWeights.bold,
                      ),
                    ),
                    TextSpan(
                      text: 'members are already using Elite!',
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: AppFontSizes.fontMedium,
                        fontWeight: AppFontWeights.semiBold,
                      ),
                    ),
                  ],
                ),
              ),
              Spacing.height(AppDimensions.paddingMedium.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(AppDimensions.paddingMedium.w),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(AppDimensions.radiusMedium.r),
                  border: Border.all(color: AppColors.gold, width: AppDimensions.spacingSmall.w),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                          3,
                              (_) => Padding(
                            padding: EdgeInsets.symmetric(horizontal: AppDimensions.spacingSmall.w),
                            child: Icon(
                              Icons.diamond,
                              size: AppDimensions.spacingSmall.r,
                              color: AppColors.gold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Spacing.height(AppDimensions.paddingSmall.h),
                    _buildPerkRow('Enjoy 10% OFF on all bookings'),
                    Spacing.height(AppDimensions.spacingSmall.h),
                    _buildPerkRow('Get 🪙 1000 YMCOINS'),
                  ],
                ),
              ),
              Spacing.height(AppDimensions.paddingXMedium.h),
              Align(
                alignment: Alignment.centerLeft,
                child: CommonText(
                  text: 'Have a coupon code?',
                  fontSize: AppFontSizes.fontMedium,
                  fontWeight: AppFontWeights.semiBold,
                  color: AppColors.blackColor,
                ),
              ),
              Spacing.height(8),
              Row(
                children: [
                  Expanded(
                    child: CommonTextField(
                      controller: controller.couponController,
                      hintText: 'Enter Coupon Code',
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  Spacing.width(8),
                  GestureDetector(
                    onTap: controller.applyCoupon,
                    child: CommonText(
                      text: 'APPLY',
                      fontSize: AppFontSizes.fontSmall,
                      fontWeight: AppFontWeights.bold,
                      color: AppColors.greyColor,
                    ),
                  ),
                  Spacing.width(8),
                ],
              ),
              Spacing.height(AppDimensions.paddingMedium.h),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppDimensions.radiusSmall.r),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 14.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonText(
                                text: 'Total Amount',
                                fontSize: AppFontSizes.fontMedium,
                                fontWeight: AppFontWeights.semiBold,
                                color: AppColors.blackColor,
                              ),
                              CommonText(
                                text: 'Incl. of taxes',
                                fontSize: AppFontSizes.fontNenoSmall,
                                fontWeight: AppFontWeights.normal,
                                color: AppColors.greyColor,
                              ),
                            ],
                          ),
                          CommonText(
                            text: '₹${controller.totalAmount.toInt()}',
                            fontSize: AppFontSizes.fontXMedium,
                            fontWeight: AppFontWeights.bold,
                            color: AppColors.blackColor,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(color: Colors.grey.shade200)),
                      ),
                      child: Center(
                        child: CommonText(
                          text: 'Limited time offer, only for you!',
                          fontSize: AppFontSizes.fontSmall,
                          fontWeight: AppFontWeights.medium,
                          color: AppColors.blackColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Spacing.height(AppDimensions.paddingXMedium.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () => _showPaymentMethodSheet(context),
                        borderRadius: BorderRadius.circular(6.r),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(6.r),
                              ),
                              child: CommonText(
                                text: 'PayU',
                                fontSize: AppFontSizes.fontSmall,
                                fontWeight: AppFontWeights.bold,
                                color: AppColors.blackColor,
                              ),
                            ),
                            Spacing.width(6),
                            CommonText(
                              text: 'PAY USING',
                              fontSize: AppFontSizes.fontSmall,
                              fontWeight: AppFontWeights.medium,
                              color: AppColors.blackColor,
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              size: 18.r,
                              color: AppColors.blackColor,
                            ),
                          ],
                        ),
                      ),
                      Spacing.height(3),
                      CommonText(
                        text: 'Pay Using UPI',
                        fontSize: AppFontSizes.fontSmall,
                        fontWeight: AppFontWeights.medium,
                        color: AppColors.blackColor,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 150.w,
                    height: 48.h,
                    child: ElevatedButton(
                      onPressed: () {
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CommonText(
                            text: 'Pay Now',
                            fontSize: AppFontSizes.fontMedium,
                            fontWeight: AppFontWeights.bold,
                            color: Colors.white,
                          ),
                          Spacing.width(6),
                          Icon(Icons.arrow_forward,
                              size: 16.r, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              Spacing.height(AppDimensions.paddingMedium.h),
            ],
          ),
        ),
      ),
    );
  }

  void _showPaymentMethodSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24.r), // Top corners ko round karne ke liye
        ),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Jitna content hai utni hi height lega
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title aur Close Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonText(
                    text: 'Payment Method',
                    fontSize: AppFontSizes.fontLarge,
                    fontWeight: AppFontWeights.bold,
                    color: Colors.black,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: EdgeInsets.all(4.r),
                      decoration: const BoxDecoration(
                        color: Color(0xFFF5F5F5),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.close, size: 20.r, color: Colors.black),
                    ),
                  ),
                ],
              ),
              Spacing.height(24),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 48.w,
                    height: 48.w,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Center(
                      child: Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQMvpQPfl1ct5yhbp_mYZFEdcCyUwUAKiwkA&s',
                        width: 32.w,
                      ),
                    ),
                  ),
                  Spacing.width(16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          text: 'Pay Using UPI',
                          fontSize: AppFontSizes.fontMedium,
                          fontWeight: AppFontWeights.bold,
                          color: Colors.black,
                        ),
                        Spacing.height(4),
                        CommonText(
                          text: 'Get 5% cashback with no limit & one month validity',
                          fontSize: AppFontSizes.fontSmall,
                          fontWeight: AppFontWeights.normal,
                          softWrap: true,
                          color: Colors.grey.shade600,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Spacing.height(AppDimensions.paddingMedium.h),
              const Divider(color: Color(0xFFEEEEEE), height: 1),
              Spacing.height(AppDimensions.paddingMedium.h),
              Row(
                children: [
                  Container(
                    width: 48.w,
                    height: 48.w,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Center(
                      child: Image.network(
                        'https://thumbs.dreamstime.com/b/generic-debit-card-generic-debit-card-illustration-generic-logos-isolated-white-125480021.jpg',
                      ),
                    ),
                  ),
                  Spacing.width(16),
                  Expanded(
                    child: CommonText(
                      text: 'Credit/Debit Card',
                      fontSize: AppFontSizes.fontMedium,
                      fontWeight: AppFontWeights.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Spacing.height(AppDimensions.paddingMedium.h),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPerkRow(String text) {
    return Row(
      children: [
        Icon(Icons.diamond, size: 14.r, color: const Color(0xFFE6A020)),
        Spacing.width(8),
        CommonText(
          text: text,
          fontSize: AppFontSizes.fontMedium,
          fontWeight: AppFontWeights.normal,
          color: Colors.black87,
        ),
      ],
    );
  }
}