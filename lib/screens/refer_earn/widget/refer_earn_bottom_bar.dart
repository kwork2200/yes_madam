import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yes_madam/controller/refer_earn/refer_earn_controller.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_dimensions.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/widgets/common/common_text.dart';
import 'package:yes_madam/widgets/components/spacing_widget.dart';

class ReferEarnBottomBar extends GetView<ReferEarnController> {
  const ReferEarnBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingMedium.w,
        vertical: 12.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.deepIndigo,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.r),
          topRight: Radius.circular(15.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: Color(0xFF454cba),
              border: Border.all(color: AppColors.whiteColor.withOpacity(0.4)),
              borderRadius: BorderRadius.circular(AppDimensions.radiusSmall.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Your Referral Code:  ',
                    style: TextStyle(
                      fontSize: AppFontSizes.fontMedium,
                      fontWeight: AppFontWeights.normal,
                      color: AppColors.whiteColor,
                    ),
                    children: [
                      TextSpan(
                        text: controller.referralCode,
                        style: TextStyle(
                          fontSize: AppFontSizes.fontMedium,
                          fontWeight: AppFontWeights.bold,
                          color: Color(0xFFe4c600),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: controller.copyReferralCode,
                  child: Icon(
                    Icons.copy_rounded,
                    size: AppDimensions.iconSmall,
                    color: AppColors.whiteColor,
                  ),
                ),
              ],
            ),
          ),
          Spacing.height(10),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: controller.inviteViaWhatsApp,
                  child: Container(
                    height: 46.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusSmall.r,
                      ),
                    ),
                    child: CommonText(
                      text: 'INVITE VIA WHATSAPP',
                      fontSize: AppFontSizes.fontMedium,
                      fontWeight: AppFontWeights.bold,
                      color: AppColors.blackColor,
                    ),
                  ),
                ),
              ),
              Spacing.width(10),
              GestureDetector(
                onTap: controller.shareReferral,
                child: Container(
                  height: 46.h,
                  width: 46.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(
                      AppDimensions.radiusSmall.r,
                    ),
                  ),
                  child: Icon(
                    Icons.share_rounded,
                    color: AppColors.blackColor,
                    size: AppDimensions.iconMedium,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
