import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/widgets/common/common_text.dart';
import 'package:yes_madam/widgets/components/spacing_widget.dart';

class PaymentSummarySheet extends StatelessWidget {
  final int itemTotal;
  final int discountedTotal;
  final int savedAmount;
  final int variableCosts;
  final int platformFeeAndTaxes;
  final int toPay;
  final int? cashbackAmount;
  final VoidCallback? onProceed;

  const PaymentSummarySheet({
    super.key,
    required this.itemTotal,
    required this.discountedTotal,
    required this.savedAmount,
    required this.variableCosts,
    required this.platformFeeAndTaxes,
    required this.toPay,
    this.cashbackAmount,
    this.onProceed,
  });

  static void show(BuildContext context, PaymentSummarySheet sheet) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      clipBehavior: Clip.none,
      builder: (_) => sheet,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
          ),
          padding: EdgeInsets.all(20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: CommonText(
                  text: 'Payment Summary',
                  fontSize: AppFontSizes.fontLarge - 2.sp,
                  fontWeight: AppFontWeights.semiBold,
                  color: AppColors.blackColor,
                ),
              ),
              Spacing.height(14),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 15.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFe5fcf1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(14.r),
                    topRight: Radius.circular(14.r),
                  ),
                ),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: AppFontSizes.fontMedium,
                      color: AppColors.blackColor,
                      fontWeight: AppFontWeights.black,
                    ),
                    children: [
                      const TextSpan(
                        text: 'You ',
                        style: TextStyle(fontWeight: AppFontWeights.black),
                      ),
                      TextSpan(
                        text: 'saved ₹$savedAmount',
                        style: const TextStyle(
                          fontWeight: AppFontWeights.black,
                          color: Color(0xFF2e7e4d),
                        ),
                      ),
                      const TextSpan(
                        text: ' on this booking',
                        style: TextStyle(fontWeight: AppFontWeights.black),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: AppColors.grey300, width: 1.w),
                    left: BorderSide(color: AppColors.grey300, width: 1.w),
                    right: BorderSide(color: AppColors.grey300, width: 1.w),
                    bottom: BorderSide.none,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(14.r),
                    bottomRight: Radius.circular(14.r),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10.0.r, right: 10.0.r, top: 10.0.r),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Spacing.height(10),
                          _SummaryRow(
                            label: 'Item Total',
                            originalValue: '₹$itemTotal',
                            discountedValue: '₹$discountedTotal',
                            subLabel: 'Incl. Ym exclusive & MYOP discount',
                            savedLabel: 'Saved ₹$savedAmount',
                          ),
                          Spacing.height(20),
                          _SimpleRow(
                            label: 'Variable Costs',
                            value: '₹$variableCosts',
                            subLabel: '100% of this goes to the professional',
                          ),
                          Spacing.height(20),
                          _SimpleRow(
                            label: 'Platform Fee & Taxes',
                            value: '₹$platformFeeAndTaxes',
                          ),
                          Spacing.height(20),
                          DottedLine(
                            direction: Axis.horizontal,
                            lineLength: double.infinity,
                            lineThickness: 1.0,
                            dashLength: 4.0,
                            dashColor: AppColors.grey300,
                            dashGapLength: 3.0,
                            dashGapColor: Colors.transparent,
                          ),
                          Spacing.height(20),
                          _TotalRow(label: 'To Pay', value: '₹$toPay'),
                        ],
                      ),
                    ),
                    if (cashbackAmount != null) ...[
                      Spacing.height(12),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 14.w,
                          vertical: 10.h,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFebf6ff),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(14.r),
                            bottomRight: Radius.circular(14.r),
                          ),
                        ),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: AppFontSizes.fontSmall,
                              color: AppColors.blackColor,
                              fontWeight: AppFontWeights.semiBold,
                              fontFamily: 'Roboto',
                            ),
                            children: [
                              const TextSpan(text: 'You will receive '),
                              TextSpan(
                                text: '💰₹$cashbackAmount',
                                style: TextStyle(
                                  color: AppColors.themeColor,
                                  fontWeight: AppFontWeights.bold,
                                ),
                              ),
                              const TextSpan(text: ' cashback in your YesMadam wallet for prepaid booking.'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              Spacing.height(20),
            ],
          ),
        ),
        Positioned(
          top: -40.h,
          right: 20.w,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: CircleAvatar(
              radius: 16.r,
              backgroundColor: AppColors.whiteColor,
              child: Icon(
                Icons.close,
                size: 18.sp,
                color: AppColors.blackColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final String originalValue;
  final String discountedValue;
  final String? subLabel;
  final String? savedLabel;

  const _SummaryRow({
    required this.label,
    required this.originalValue,
    required this.discountedValue,
    this.subLabel,
    this.savedLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                text: label,
                fontSize: AppFontSizes.fontMedium,
                fontWeight: AppFontWeights.bold,
                color: AppColors.blackColor,
              ),
              if (subLabel != null)
                CommonText(
                  text: subLabel!,
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
              children: [
                CommonText(
                  text: originalValue,
                  fontSize: AppFontSizes.fontSmall,
                  color: AppColors.greyColor,
                  decoration: TextDecoration.lineThrough,
                  fontWeight: AppFontWeights.semiBold,
                  decorationColor: AppColors.greyColor,
                ),
                Spacing.width(6),
                CommonText(
                  text: discountedValue,
                  fontSize: AppFontSizes.fontSmall,
                  fontWeight: AppFontWeights.semiBold,
                  color: AppColors.blackColor,
                ),
              ],
            ),
            if (savedLabel != null)
              CommonText(
                text: savedLabel!,
                fontSize: AppFontSizes.fontSmall,
                color: AppColors.successGreen,
                fontWeight: AppFontWeights.extraBold,
              ),
          ],
        ),
      ],
    );
  }
}

class _SimpleRow extends StatelessWidget {
  final String label;
  final String value;
  final String? subLabel;

  const _SimpleRow({required this.label, required this.value, this.subLabel});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                text: label,
                fontSize: AppFontSizes.fontMedium,
                fontWeight: AppFontWeights.bold,
                color: AppColors.blackColor,
              ),
              if (subLabel != null)
                CommonText(
                  text: subLabel!,
                  fontSize: AppFontSizes.fontNenoSmall,
                  fontWeight: AppFontWeights.semiBold,
                  color: AppColors.greyColor,
                ),
            ],
          ),
        ),
        CommonText(
          text: value,
          fontSize: AppFontSizes.fontMedium,
          fontWeight: AppFontWeights.semiBold,
          color: AppColors.blackColor,
        ),
      ],
    );
  }
}

class _TotalRow extends StatelessWidget {
  final String label;
  final String value;

  const _TotalRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CommonText(
          text: label,
          fontSize: AppFontSizes.fontXMedium,
          fontWeight: AppFontWeights.bold,
          color: AppColors.blackColor,
        ),
        CommonText(
          text: value,
          fontSize: AppFontSizes.fontXMedium,
          fontWeight: AppFontWeights.bold,
          color: AppColors.blackColor,
        ),
      ],
    );
  }
}