import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yes_madam/screens/checkout/bottom_sheet/elite_remove_bottom_sheet.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_dimensions.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/widgets/common/common_celebration_dialog.dart';
import 'package:yes_madam/widgets/common/common_text.dart';
import 'package:yes_madam/widgets/components/spacing_widget.dart';

class ToPayWidget extends StatelessWidget {
  final int originalAmount;
  final int finalAmount;
  final int savedAmount;
  final bool showEliteSavings;
  final String? savingsMessage;
  final VoidCallback onTap;
  final bool isAdded;
  final VoidCallback onToggle;

  const ToPayWidget({
    super.key,
    required this.originalAmount,
    required this.finalAmount,
    required this.savedAmount,
    required this.onTap,
    required this.isAdded,
    required this.onToggle,
    this.showEliteSavings = false,
    this.savingsMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: !isAdded
                    ? BorderRadius.vertical(top: Radius.circular(12.r))
                    : BorderRadius.circular(12.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.receipt_long_outlined,
                        size: 20.sp,
                        color: AppColors.greyColor,
                      ),
                      Spacing.width(10),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                              text: 'To Pay',
                              fontSize: AppFontSizes.fontMedium,
                              fontWeight: AppFontWeights.semiBold,
                              color: AppColors.blackColor,
                            ),
                            CommonText(
                              text: 'Incl. of taxes and charges',
                              fontSize: AppFontSizes.fontNenoSmall,
                              fontWeight: AppFontWeights.semiBold,
                              color: AppColors.greyColor,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CommonText(
                                text: '₹$originalAmount',
                                fontSize: AppFontSizes.fontSmall,
                                color: AppColors.greyColor,
                                decoration: TextDecoration.lineThrough,
                                decorationColor: AppColors.greyColor,
                              ),
                              Spacing.width(6),
                              CommonText(
                                text: '₹$finalAmount',
                                fontSize: AppFontSizes.fontMedium,
                                fontWeight: AppFontWeights.bold,
                                color: AppColors.blackColor,
                              ),
                            ],
                          ),

                          Spacing.height(6),

                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 3.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              gradient: const LinearGradient(
                                colors: [
                                  Colors.white,
                                  Color(0xFFF2FFF4),
                                  Color(0xFFCFFDD4),
                                ],
                              ),
                            ),
                            child: CommonText(
                              text: 'saved ₹$savedAmount',
                              fontSize: 10.sp,
                              color: const Color(0xFF1F9D43),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),

                      Spacing.width(4),

                      Icon(
                        Icons.chevron_right,
                        size: 25.sp,
                        color: AppColors.blackColor,
                      ),
                    ],
                  ),
                  Spacing.height(16),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFBF6),
                      border: Border.all(
                        color: AppColors.coinOrange,
                        width: 0.4.w,
                      ),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Spacing.height(5),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 14.w),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        CommonText(
                                          text: 'Elite Membership',
                                          fontSize: AppFontSizes.fontSmall,
                                          fontWeight: AppFontWeights.semiBold,
                                          color: AppColors.blackColor,
                                        ),
                                        Spacing.width(4),
                                        Icon(
                                          Icons.info_outline,
                                          size: 18.sp,
                                          color: AppColors.coinOrange,
                                        ),
                                      ],
                                    ),
                                    CommonText(
                                      text: "6 months",
                                      fontSize: AppFontSizes.fontNenoSmall,
                                      fontWeight: AppFontWeights.bold,
                                      color: AppColors.greyColor,
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  CommonText(
                                    text: '₹249',
                                    fontSize: AppFontSizes.fontSmall,
                                    fontWeight: AppFontWeights.bold,
                                    color: AppColors.blackColor,
                                  ),
                                  SizedBox(height: 2.h),
                                  CommonText(
                                    text: '₹499',
                                    fontSize: AppFontSizes.fontNenoSmall,
                                    color: AppColors.greyColor,
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: AppColors.greyColor,
                                  ),
                                ],
                              ),
                              Spacing.width(12),
                              GestureDetector(
                                onTap: () async {
                                  if (!isAdded) {
                                    onToggle();

                                    await CommonCelebrationDialog.show(
                                      context,
                                      barrierDismissible: true,
                                      child: const EliteMembershipPopup(),
                                    );
                                  } else {
                                    EliteRemoveBottomSheet.show(
                                      context,
                                      onRemove: () {
                                        onToggle();
                                      },
                                    );
                                  }
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10.w,
                                    vertical: 4.h,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: isAdded
                                          ? AppColors.lightPinkColor
                                          : AppColors.themeColor,
                                    ),
                                    borderRadius: BorderRadius.circular(6.r),
                                  ),
                                  child: CommonText(
                                    text: isAdded ? 'REMOVE' : 'ADD',
                                    fontSize: AppFontSizes.fontNenoSmall,
                                    fontWeight: AppFontWeights.bold,
                                    color: AppColors.themeColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacing.height(15),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.blackColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(12.r),
                              bottomRight: Radius.circular(12.r),
                            ),
                            gradient: isAdded
                                ? const LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color(0xFFB8860B),
                                      Color(0xFF8B6508),
                                      Color(0xFF4A3500),
                                      Color(0xFF000000),
                                    ],
                                  )
                                : null,
                          ),
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          child: Center(
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  color: AppColors.whiteColor,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                children: [
                                  TextSpan(text: 'Save '),
                                  TextSpan(
                                    text: '₹100',
                                    style: TextStyle(
                                      color: AppColors.goldColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(text: ' on this booking with '),
                                  TextSpan(
                                    text: 'Elite',
                                    style: TextStyle(
                                      color: AppColors.goldColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (!isAdded)
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFebf6ff),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12.r),
                  bottomRight: Radius.circular(12.r),
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'you will receive 💰',
                        style: TextStyle(
                          fontSize: AppFontSizes.fontSmall,
                          color: AppColors.black87,
                        ),
                      ),
                      TextSpan(
                        text: '₹169',
                        style: TextStyle(
                          fontSize: AppFontSizes.fontSmall,
                          color: AppColors.themeColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: ' cashback in your YesMadam wallet for prepaid booking',
                        style: TextStyle(
                          fontSize: AppFontSizes.fontSmall,
                          color: AppColors.black87,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
              ),
            ),
          if (savedAmount > 0)
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
              color: AppColors.successGreen.withOpacity(0.08),
              child: CommonText(
                text: 'saved ₹$savedAmount',
                fontSize: AppFontSizes.fontSmall,
                fontWeight: AppFontWeights.semiBold,
                color: AppColors.successGreen,
              ),
            ),
        ],
      ),
    );
  }
}

class EliteMembershipPopup extends StatelessWidget {
  final VoidCallback? onContinue;

  const EliteMembershipPopup({super.key, this.onContinue});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340.w,
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingLarge.w,
        vertical: AppDimensions.paddingXLarge.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimensions.radiusXLarge.r),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xff1B1B1B), Color(0xff0D0D0D)],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xffD4A537).withOpacity(.35),
            blurRadius: 40,
            spreadRadius: 3,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CommonText(
            text: "WELCOME TO",
            fontSize: AppFontSizes.fontSmall,
            fontWeight: AppFontWeights.medium,
            color: Colors.white70,
            letterSpacing: 3,
          ),
          Spacing.height(12),
          CommonText(
            text: "Elite",
            fontSize: 40.sp,
            fontWeight: AppFontWeights.extraBold,
            color: Color(0xffD4A537),
          ),
          CommonText(
            text: "Membership",
            fontSize: AppFontSizes.fontXMedium,
            fontWeight: AppFontWeights.semiBold,
            color: AppColors.goldColor,
          ),
          Spacing.height(20),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 1,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.transparent, Color(0xffD4A537)],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: CommonText(
                  text: "✨ ✨ ✨",
                  fontSize: AppFontSizes.fontMedium,
                  fontWeight: AppFontWeights.bold,
                  color: AppColors.whiteColor,
                ),
              ),
              Expanded(
                child: Container(
                  height: 1,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xffD4A537), Colors.transparent],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Spacing.height(20),
          CommonText(
            text: "Congratulations 🎉",
            fontSize: AppFontSizes.fontLarge,
            fontWeight: AppFontWeights.bold,
            color: AppColors.whiteColor,
          ),
          Spacing.height(10),
          CommonText(
            text: "You're an Elite\nHappy pampering!",
            textAlign: TextAlign.center,
            fontSize: AppFontSizes.fontMedium,
            fontWeight: AppFontWeights.regular,
            color: AppColors.whiteColor,
            textHeight: 1.5,
          ),
        ],
      ),
    );
  }
}
