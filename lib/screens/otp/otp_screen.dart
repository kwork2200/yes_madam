import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yes_madam/controller/otp/otp_controller.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_dimensions.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/utils/app_images.dart';
import 'package:yes_madam/utils/app_texts.dart';
import 'package:yes_madam/widgets/common/common_button.dart';
import 'package:yes_madam/widgets/common/common_text.dart';
import 'package:yes_madam/widgets/components/spacing_widget.dart';
import 'package:yes_madam/widgets/yes_madam_logo.dart';

class OtpScreen extends GetView<OtpController> {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.lightPinkColor, AppColors.whiteColor],
            stops: [0.0, 0.3],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimensions.paddingXMedium.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacing.height(AppDimensions.spacingMedium),
                GestureDetector(
                  onTap: Get.back,
                  child: Container(
                    width: 36.w,
                    height: 36.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.grey300),
                      color: AppColors.whiteColor,
                    ),
                    child: Icon(
                      Icons.arrow_back_rounded,
                      size: AppDimensions.iconSmall.sp,
                      color: AppColors.darkColor,
                    ),
                  ),
                ),
                YesMadamLogo(height: 80.h, width: 170.w),
                Spacing.height(7),
                CommonText(
                  text: AppTexts.enterOtp,
                  fontSize: AppFontSizes.fontLarge,
                  fontWeight: AppFontWeights.semiBold,
                  color: AppColors.darkColor,
                ),
                Spacing.height(AppDimensions.spacingMedium),
                CommonText(
                  text: AppTexts.otpSent,
                  fontSize: AppFontSizes.fontMedium,
                  color: AppColors.greyColor,
                  fontWeight: AppFontWeights.semiBold,
                ),
                CommonText(
                  text: controller.phoneNumber,
                  fontSize: AppFontSizes.fontSmall,
                  fontWeight: AppFontWeights.extraBold,
                  color: AppColors.greyColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(
                    4,
                    (index) => Padding(
                      padding: EdgeInsets.only(right: 10.0.h),
                      child: _buildOtpBox(index),
                    ),
                  ),
                ),
                Spacing.height(AppDimensions.radiusXLarge),
                Obx(() {
                  if (!controller.canResend.value) {
                    return Row(
                      children: [
                        Icon(
                          Icons.refresh,
                          size: AppDimensions.iconSmall.sp,
                          color: AppColors.blackColor,
                        ),
                        Spacing.width(6),
                        CommonText(
                          text: AppTexts.autoVerifying,
                          fontSize: AppFontSizes.fontSmall,
                          color: AppColors.blackColor,
                        ),
                        SizedBox(width: AppDimensions.spacingMedium.w),
                        CommonText(
                          text:
                              '${AppTexts.retryIn} ${controller.resendTimer.value.toString().padLeft(2, '0')}s',
                          fontSize: AppFontSizes.fontSmall,
                          color: AppColors.greyColor,
                          fontWeight: AppFontWeights.semiBold,
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CommonText(
                              text: AppTexts.didReceiveOtp,
                              fontSize: AppFontSizes.fontSmall,
                              color: AppColors.blackColor,
                            ),
                            CommonText(
                              text: AppTexts.resendVia,
                              fontSize: AppFontSizes.fontSmall,
                              color: AppColors.blackColor,
                              fontWeight: AppFontWeights.semiBold,
                            ),
                          ],
                        ),
                        Spacing.height(AppDimensions.spacingMedium),
                        Row(
                          children: [
                            Expanded(
                              child: CommonButton(
                                text: AppTexts.message,
                                onPressed: () => controller.resendOtp(),
                                backgroundColor: AppColors.whiteColor,
                                borderColor: Colors.grey.shade300,
                                textColor: AppColors.blackColor,
                                fontSize: AppFontSizes.fontSmall,
                                fontWeight: AppFontWeights.semiBold,
                                leftIcon: Icon(
                                  Icons.message_outlined,
                                  color: AppColors.blackColor,
                                  size: 20.sp,
                                ),
                              ),
                            ),
                            Spacing.width(15),
                            Expanded(
                              child: CommonButton(
                                text: AppTexts.whatsApp,
                                onPressed: () => controller.resendOtp(),
                                backgroundColor: AppColors.whiteColor,
                                borderColor: Colors.grey.shade300,
                                textColor: AppColors.blackColor,
                                fontSize: AppFontSizes.fontSmall,
                                fontWeight: AppFontWeights.semiBold,
                                leftIcon: Image.asset(
                                  AppImages.wpIcon,
                                  width: 18.w,

                                  height: 18.h,

                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  }
                }),

                Spacing.height(AppDimensions.spacingLarge),
                CommonText(
                  text: AppTexts.checkMobile,
                  fontSize: AppFontSizes.fontSmall,
                  color: AppColors.greyColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOtpBox(int index) {
    return SizedBox(
      width: 55.w,
      height: 55.h,
      child: TextField(
        controller: controller.otpControllers[index],
        focusNode: controller.otpFocusNodes[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        onChanged: (value) => controller.onOtpChanged(value, index),
        style: TextStyle(
          fontSize: AppFontSizes.fontLarge.sp,
          fontWeight: AppFontWeights.bold,
          color: AppColors.darkColor,
        ),
        decoration: InputDecoration(
          counterText: '',
          filled: true,
          fillColor: AppColors.whiteColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusSmall.r),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusSmall.r),
            borderSide: BorderSide(color: AppColors.greyColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusSmall.r),
            borderSide: BorderSide(color: AppColors.darkColor, width: 1.5),
          ),
        ),
      ),
    );
  }
}
