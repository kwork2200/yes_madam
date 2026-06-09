import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yes_madam/controller/refer_earn/refer_earn_controller.dart';
import 'package:yes_madam/routes/app_routes.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_dimensions.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/widgets/common/common_text.dart';
import 'package:yes_madam/widgets/components/spacing_widget.dart';

class ReferEarnHeroWidget extends GetView<ReferEarnController> {
  const ReferEarnHeroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingMedium.w,
        vertical: AppDimensions.paddingXLarge.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => Get.back(),
                child: Container(
                  padding: EdgeInsets.all(6.r),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                    size: 16.r,
                  ),
                ),
              ),
              Obx(
                () => GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.referEarnCoins);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.w,
                      vertical: 6.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.royalBlue,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 20.w,
                          height: 20.w,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [Colors.orange, AppColors.coinOrange],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: CommonText(
                            text: 'R',
                            fontSize: AppFontSizes.fontNenoSmall,
                            fontWeight: AppFontWeights.bold,
                            color: AppColors.whiteColor,
                          ),
                        ),
                        Spacing.width(6),
                        CommonText(
                          text: '${controller.coinBalance.value}',
                          fontSize: AppFontSizes.fontMedium,
                          fontWeight: AppFontWeights.semiBold,
                          color: AppColors.whiteColor,
                        ),
                        Spacing.width(6),
                        Icon(Icons.arrow_forward_ios,size: 15.r),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Spacing.height(20),
          CommonText(
            text: 'REFER & EARN',
            fontSize: AppFontSizes.fontMedium,
            fontWeight: AppFontWeights.semiBold,
            color: AppColors.whiteColor.withOpacity(0.85),
          ),
          Spacing.height(4),
          Obx(() {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: controller.showFirst.value
                  ? FadeTransition(
                key: const ValueKey("free"),
                opacity: controller.fadeAnim,
                child:  GradientText(
                  child: CommonText(
                    text: 'FREE SERVICES',
                    fontSize: AppFontSizes.fontXLarge26,
                    fontWeight: AppFontWeights.extraBold,
                    color: Colors.white,
                  ),
                ),
              )
                  : FadeTransition(
                key: const ValueKey("coins"),
                opacity: controller.fadeAnim,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 24.w,
                          height: 24.w,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.coinOrange,
                          ),
                          alignment: Alignment.center,
                          child: CommonText(
                            text: 'R',
                            fontSize: AppFontSizes.fontSmall,
                            fontWeight: AppFontWeights.bold,
                            color: AppColors.whiteColor,
                          ),
                        ),
                        Spacing.width(8),
                        GradientText(
                          child: CommonText(
                            text: 'COINS',
                            fontSize: AppFontSizes.fontXMedium,
                            fontWeight: AppFontWeights.extraBold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    GradientText(
                      child: CommonText(
                        text: 'WORTH ₹500',
                        fontSize: AppFontSizes.fontXLarge26,
                        fontWeight: AppFontWeights.extraBold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
          Spacing.height(8),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: AppColors.whiteColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(50.r),
            ),
            child: CommonText(
              text: 'Referral Rewards',
              fontSize: AppFontSizes.fontSmall,
              fontWeight: AppFontWeights.medium,
              color: AppColors.whiteColor,
            ),
          ),
          Spacing.height(24),
          CommonText(
            text:
                'Earn coins on every referral and free services\nwhen you become 🛡️ Brand Ambassador',
            fontSize: AppFontSizes.fontMedium,
            fontWeight: AppFontWeights.normal,
            color: AppColors.whiteColor.withOpacity(0.9),
            textAlign: TextAlign.center,
            textHeight: 1.5,
          ),
          Spacing.height(16),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: AppColors.appPrimaryBlue,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 18.w,
                  height: 18.w,
                  decoration: BoxDecoration(
                    color: AppColors.coinOrange,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: CommonText(
                    text: '●',
                    fontSize: 8,
                    fontWeight: AppFontWeights.bold,
                    color: AppColors.whiteColor,
                  ),
                ),
                Spacing.width(8),
                CommonText(
                  text: '1 Coin = ₹1',
                  fontSize: AppFontSizes.fontMedium,
                  fontWeight: AppFontWeights.semiBold,
                  color:  Color(0xFFf5b965),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class GradientText extends StatelessWidget {
  final Widget child;

  const GradientText({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return const LinearGradient(
          colors: [
            Color(0xFFebedf3),
            Color(0xFFedebda),
            Color(0xFFeeeaa1),
            Color(0xFFeee47e),
            Color(0xFFede757),
          ],
        ).createShader(bounds);
      },
      child: child,
    );
  }
}