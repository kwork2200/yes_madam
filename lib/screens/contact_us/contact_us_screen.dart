import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yes_madam/controller/contact_us/contact_us_controller.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_dimensions.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/widgets/common/common_app_bar.dart';
import 'package:yes_madam/widgets/common/common_text.dart';

class ContactUsScreen extends GetView<ContactUsController> {
   const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CommonAppBar(
        title: CommonText(
          text: 'Contact Us',
          fontSize: AppFontSizes.fontXMedium,
          fontWeight: AppFontWeights.bold,
          color: AppColors.darkColor,
        ),
        showBackButton: true,
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(AppDimensions.paddingMedium.w),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 180.h,
              decoration: BoxDecoration(
                color: AppColors.primaryBlue,
                borderRadius: BorderRadius.circular(AppDimensions.radiusMedium.r),
                  image: DecorationImage(image: NetworkImage("https://www.90daykorean.com/wp-content/uploads/2015/09/How-to-say-Hello-in-Korean-min.png"),fit: BoxFit.cover)

              ),
            ),
            SizedBox(height: AppDimensions.paddingLarge.h),
            CommonText(
              text: 'Need Help?',
              fontSize: AppFontSizes.fontXMedium,
              fontWeight: AppFontWeights.semiBold,
              color: AppColors.darkColor,
            ),
            SizedBox(height: 6.h),
            CommonText(
              text: 'Have queries or concerns? Connect with us here!',
              fontSize: AppFontSizes.fontSmall,
              color: AppColors.blackColor,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppDimensions.radiusXLarge.h),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.paddingSmall.w,
                vertical: AppFontSizes.fontNenoSmall.h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppDimensions.radiusSmall.r),
                border: Border.all(color: AppColors.grey300),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: CommonText(
                      text: 'Call us at 08064881700 (7:00 AM to 10:00 PM)',
                      fontSize: AppFontSizes.fontSmall,
                      color: AppColors.darkColor,
                      fontWeight: AppFontWeights.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: controller.copyPhoneNumber,
                    child: Container(
                      width: 30.w,
                      height: 30.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.themeColor,
                      ),
                      child: Icon(
                        Icons.copy,
                        color: AppColors.whiteColor,
                        size: AppDimensions.iconSmall.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppDimensions.spacingLarge.h),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: AppFontSizes.fontSmall,
                  color: AppColors.darkColor,
                ),
                children: [
                  TextSpan(
                    text: 'Note: ',
                    style: TextStyle(fontWeight: AppFontWeights.bold),
                  ),
                  const TextSpan(
                    text: 'You can connect with our chat support via Help Centre, from 7:00 AM to 10:00 PM.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
