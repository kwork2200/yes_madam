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

class ReferEarnMilestonesWidget extends GetView<ReferEarnController> {
  const ReferEarnMilestonesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: EdgeInsets.only(top: 45.h),
          padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.paddingMedium.w,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDimensions.radiusCircle.r),
            color: AppColors.whiteColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60.h),
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: CommonText(
                    text: 'On 5th referral',
                    fontSize: AppFontSizes.fontSmall,
                    fontWeight: AppFontWeights.medium,
                    color: AppColors.blackColor,
                  ),
                ),
              ),
              Spacing.height(10),
              _FifthReferralCard(reward: controller.fifthReferralReward),
              Spacing.height(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonText(
                    text: '& Become  ',
                    fontSize: AppFontSizes.fontSmall,
                    fontWeight: AppFontWeights.semiBold,
                    color: AppColors.blackColor,
                  ),
                  Row(
                    children: [
                      const Text('🛡️', style: TextStyle(fontSize: 12)),
                      Spacing.width(4),
                      CommonText(
                        text: 'BRAND AMBASSADOR',
                        fontSize: AppFontSizes.fontNenoSmall,
                        fontWeight: AppFontWeights.extraBold,
                        color: AppColors.darkReferBlue,
                        letterSpacing: 0.5,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Obx(
            () => Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(controller.milestones.length, (index) {
                  double topOffset = 0;

                  if (index == 0 || index == controller.milestones.length - 1) {
                    topOffset = 12.h;
                  } else {
                    topOffset = 0;
                  }
                  return Padding(
                    padding: EdgeInsets.only(top: topOffset),
                    child: _MilestoneCard(
                      coins: controller.milestones[index]['coins'] as int,
                      label: controller.milestones[index]['label'] as String,
                      isCompleted: controller.isMilestoneCompleted(index),
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _MilestoneCard extends StatelessWidget {
  final int coins;
  final String label;
  final bool isCompleted;

  const _MilestoneCard({
    required this.coins,
    required this.label,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10.h),
          padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 6.w),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(AppDimensions.radiusMedium.r),
            border: Border.all(color: Colors.grey.shade200),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 14.w,
                    height: 14.w,
                    decoration: BoxDecoration(
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
                  Spacing.width(3),
                  CommonText(
                    text: '$coins',
                    fontSize: AppFontSizes.fontSmall,
                    fontWeight: AppFontWeights.bold,
                    color: AppColors.blackColor,
                  ),
                ],
              ),
              Spacing.height(6),
              CommonText(
                text: label,
                fontSize: AppFontSizes.fontNenoSmall,
                fontWeight: AppFontWeights.normal,
                color: Colors.grey,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          child: Container(
            width: 26.w,
            height: 26.w,
            decoration: BoxDecoration(
              color: isCompleted
                  ? const Color(0xFF5B9BD5)
                  : Colors.grey.shade300,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.whiteColor, width: 2.5.w),
            ),
            child: Icon(Icons.check, color: AppColors.greyColor, size: 14.sp),
          ),
        ),
      ],
    );
  }
}

class _FifthReferralCard extends StatelessWidget {
  final Map<String, dynamic> reward;

  const _FifthReferralCard({required this.reward});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: GradientContainer(
                  padding: EdgeInsets.all(16.r),
                  borderRadius: BorderRadius.circular(
                    AppDimensions.radiusLarge.r,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 32.w,
                        height: 32.w,
                        decoration: const BoxDecoration(
                          color: AppColors.coinOrange,
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: CommonText(
                          text: 'R',
                          fontSize: AppFontSizes.fontMedium,
                          fontWeight: AppFontWeights.bold,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      Spacing.height(10),
                      CommonText(
                        text: '${reward['coins']} Coins',
                        fontSize: AppFontSizes.fontXMedium,
                        fontWeight: AppFontWeights.bold,
                        color: AppColors.whiteColor,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              Spacing.width(10),
              Expanded(
                child: GradientContainer(
                  padding: EdgeInsets.all(12.r),
                  borderRadius: BorderRadius.circular(
                    AppDimensions.radiusLarge.r,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 3.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.appLavenderBlue,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: CommonText(
                          text: '🎁 FREE SERVICE',
                          fontSize: AppFontSizes.fontNenoSmall,
                          fontWeight: AppFontWeights.bold,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      Spacing.height(8),
                      CommonText(
                        text: reward['freeService'] as String,
                        fontSize: AppFontSizes.fontSmall,
                        fontWeight: AppFontWeights.semiBold,
                        color: AppColors.whiteColor,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          child: Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF7E83E4),
                  Color(0xFF43488B),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            alignment: Alignment.center,
            child: Icon(
              Icons.add,
              color: AppColors.whiteColor,
              size: 25.sp,
            ),
          ),
        ),
      ],
    );
  }
}

class GradientContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final BorderRadius borderRadius;

  const GradientContainer({
    super.key,
    required this.child,
    required this.padding,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF43488B),
            Color(0xFF6A5AE0),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: borderRadius,
      ),
      child: child,
    );
  }
}
