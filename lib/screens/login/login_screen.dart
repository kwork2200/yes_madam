import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yes_madam/controller/login/login_controller.dart';
import 'package:yes_madam/routes/app_routes.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_dimensions.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/utils/app_images.dart';
import 'package:yes_madam/utils/app_texts.dart';
import 'package:yes_madam/widgets/common/common_button.dart';
import 'package:yes_madam/widgets/common/common_text.dart';
import 'package:yes_madam/widgets/common/common_text_field.dart';
import 'package:yes_madam/widgets/components/spacing_widget.dart';
import 'package:yes_madam/widgets/yes_madam_logo.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.lightPinkColor, AppColors.whiteColor],
            stops: [0.0, 0.35],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacing.height(6),
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: controller.skip,
                  child: CommonText(
                    text: AppTexts.skip,
                    color: AppColors.accentColor,
                    fontSize: AppFontSizes.fontMedium,
                    fontWeight: AppFontWeights.semiBold,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.paddingXMedium.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    YesMadamLogo(height: 80.h, width: 170.w),
                    Spacing.height(7),
                    CommonText(
                      text: AppTexts.enterPhoneNumber,
                      fontSize: AppFontSizes.fontXMedium,
                      fontWeight: AppFontWeights.medium,
                      color: AppColors.blackColor,
                    ),
                    Spacing.height(AppDimensions.paddingMedium - 8),
                    CommonTextField(
                      controller: controller.phoneController,
                      hintText: AppTexts.enterMobileNumber,
                      keyboardType: TextInputType.phone,
                      counterText: "",
                      maxLength: 10,
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 16.w),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CommonText(
                              text: AppTexts.countryCode,
                              fontSize: AppFontSizes.fontMedium,
                              fontWeight: AppFontWeights.semiBold,
                              color: AppColors.blackColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Spacing.height(AppDimensions.spacingLarge),
                    Obx(
                      () => Row(
                        children: [
                          GestureDetector(
                            onTap: () => controller.isWhatsAppChecked.toggle(),
                            child: Container(
                              width: 16.w,
                              height: 16.w,
                              decoration: BoxDecoration(
                                color: controller.isWhatsAppChecked.value
                                    ? AppColors.themeColor
                                    : AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(3.r),
                                border: Border.all(
                                  color: AppColors.themeColor,
                                  width: 1.5.w,
                                ),
                              ),
                              child: controller.isWhatsAppChecked.value
                                  ? Icon(
                                      Icons.check,
                                      color: AppColors.whiteColor,
                                      size: 14.sp,
                                    )
                                  : null,
                            ),
                          ),
                          Spacing.width(AppDimensions.spacingMedium),
                          CommonText(
                            text: AppTexts.getOrderUpdates,
                            fontSize: AppFontSizes.fontMedium,
                            color: AppColors.greyColor,
                            fontWeight: AppFontWeights.originalBold,
                          ),
                          Image.asset(
                            AppImages.wpIcon,
                            width: 18.w,
                            height: 18.h,
                          ),
                          Spacing.width(2),
                          CommonText(
                            text: AppTexts.whatsApp,
                            fontSize: AppFontSizes.fontMedium,
                            color: AppColors.greyColor,
                            fontWeight: AppFontWeights.originalBold,
                          ),
                        ],
                      ),
                    ),
                    Spacing.height(AppDimensions.paddingLarge),
                    Obx(
                      () => CommonButton(
                        text: AppTexts.continueText,
                        width: double.infinity,
                        isEnabled: controller.isPhoneValid.value,
                        onPressed: controller.sendOtp,
                        backgroundColor: controller.isPhoneValid.value
                            ? AppColors.themeColor
                            : AppColors.disableButtonColor,
                        fontSize: AppFontSizes.fontXMedium,
                        fontWeight: AppFontWeights.bold,
                        textColor: AppColors.whiteColor,
                      ),
                    ),
                    Spacing.height(AppDimensions.paddingXMedium),
                     RichText(
                 textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: AppFontSizes.fontSmall,
                    color: AppColors.greyColor,
                  ),
                  children: [
                    TextSpan(
                      text: AppTexts.termsPrefix,
                      style: TextStyle(
                        fontWeight: AppFontWeights.semiBold,
                      ),
                    ),
                    TextSpan(
                      text: AppTexts.termsConditions,
                      style: TextStyle(
                        color: AppColors.accentColor,
                        fontWeight: AppFontWeights.semiBold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.toNamed(AppRoutes.termsConditions);
                        },
                    ),

                    TextSpan(text: AppTexts.andText),
                    TextSpan(
                      text: AppTexts.privacyPolicy,
                      style: TextStyle(
                        color: AppColors.accentColor,
                        fontWeight: AppFontWeights.semiBold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.toNamed(AppRoutes.privacyPolicy);
                        },
                    ),
                  ],
                ),
              )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
