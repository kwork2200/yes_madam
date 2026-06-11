import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_dimensions.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/widgets/common/common_text.dart';
import 'package:yes_madam/widgets/components/spacing_widget.dart';

class CartItemWidget extends StatelessWidget {
  final String title;
  final int price;
  final int mrp;
  final String duration;
  final String? subtitle;
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final int? serviceCharge;
  final int? productCost;
  final List<String>? includedProducts;
  final RxBool? isExpanded;

  const CartItemWidget({
    super.key,
    required this.title,
    required this.price,
    required this.mrp,
    required this.duration,
    this.subtitle,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
    this.serviceCharge,
    this.productCost,
    this.includedProducts,
    this.isExpanded,
  });

  @override
  Widget build(BuildContext context) {
    final RxBool expanded = isExpanded ?? false.obs;

    return Container(
      margin: EdgeInsets.only(bottom: 10.h, left: 16.w, right: 16.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(
                      () => GestureDetector(
                        onTap: () => expanded.toggle(),
                        child: Row(
                          children: [
                            CommonText(
                              text: title,
                              fontSize: AppFontSizes.fontXMedium,
                              fontWeight: AppFontWeights.semiBold,
                              color: AppColors.blackColor,
                              softWrap: true,
                            ),
                            Spacing.width(4),
                            Icon(
                              expanded.value
                                  ? Icons.arrow_drop_up
                                  : Icons.arrow_drop_down_sharp,
                              size: 30.sp,
                              color: AppColors.blackColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Spacing.height(4),
                    Row(
                      children: [
                        CommonText(
                          text: '₹$price',
                          fontSize: AppFontSizes.fontSmall,
                          fontWeight: AppFontWeights.semiBold,
                          color: AppColors.blackColor,
                        ),
                        Spacing.width(6),
                        CommonText(
                          text: '₹$mrp',
                          fontSize: AppFontSizes.fontSmall,
                          color: AppColors.greyColor,
                          fontWeight: AppFontWeights.semiBold,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: AppColors.greyColor,
                        ),
                        Spacing.width(6),
                        CommonText(
                          text: '| $duration',
                          fontSize: AppFontSizes.fontSmall,
                          color: AppColors.blackColor,
                          fontWeight: AppFontWeights.semiBold,
                        ),
                      ],
                    ),
                    if (subtitle != null) ...[
                      Spacing.height(4),
                      CommonText(
                        text: subtitle!,
                        fontSize: AppFontSizes.fontNenoSmall,
                        fontWeight: AppFontWeights.medium,
                        color: AppColors.greyColor,
                        softWrap: true,
                      ),
                    ],
                  ],
                ),
              ),
              Spacing.width(12),
              _QuantityStepper(
                quantity: quantity,
                onIncrement: onIncrement,
                onDecrement: onDecrement,
              ),
            ],
          ),

          Obx(() {
            if (!expanded.value) return const SizedBox.shrink();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacing.height(12),
                DottedLine(
                  direction: Axis.horizontal,
                  lineLength: double.infinity,
                  lineThickness: 1.0,
                  dashLength: 4.0,
                  dashColor: AppColors.grey400,
                  dashGapLength: 3.0,
                  dashGapColor: Colors.transparent,
                ),
                Spacing.height(10),

                if (serviceCharge != null)
                  _BreakdownRow(
                    label: 'Service Charges',
                    amount: serviceCharge!,
                    trailing: _PersonPill(label: '1 person'),
                  ),

                if (serviceCharge != null) Spacing.height(8),

                if (productCost != null)
                  _BreakdownRow(
                    label: 'Product Cost',
                    amount: productCost!,
                    trailing: _PersonPill(label: '1 person'),
                  ),
                Spacing.height(10),

                DottedLine(
                  direction: Axis.horizontal,
                  lineLength: double.infinity,
                  lineThickness: 1.0,
                  dashLength: 4.0,
                  dashColor: AppColors.grey300,
                  dashGapLength: 3.0,
                  dashGapColor: Colors.transparent,
                ),
                Spacing.height(10),

                if (includedProducts != null &&
                    includedProducts!.isNotEmpty) ...[
                  Spacing.height(10),
                  ...includedProducts!.map(
                    (p) => Padding(
                      padding: EdgeInsets.only(bottom: 4.h),
                      child: Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 5.sp,
                            color: AppColors.greyColor,
                          ),
                          Spacing.width(6),
                          CommonText(
                            text: p,
                            fontSize: AppFontSizes.fontSmall,
                            fontWeight: AppFontWeights.semiBold,
                            color: AppColors.greyColor,
                            softWrap: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ],
            );
          }),
        ],
      ),
    );
  }
}

class _QuantityStepper extends StatelessWidget {
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const _QuantityStepper({
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      decoration: BoxDecoration(
        color: AppColors.lightPink,
        borderRadius: BorderRadius.circular(AppDimensions.radiusSmall.r),
        border: Border.all(color: AppColors.themeColor),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: onDecrement,
            child: Icon(Icons.remove, size: 14.sp, color: AppColors.themeColor),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: CommonText(
              text: '$quantity',
              fontSize: AppFontSizes.fontSmall,
              fontWeight: AppFontWeights.bold,
              color: AppColors.themeColor,
            ),
          ),
          GestureDetector(
            onTap: onIncrement,
            child: Icon(Icons.add, size: 14.sp, color: AppColors.themeColor),
          ),
        ],
      ),
    );
  }
}

class _BreakdownRow extends StatelessWidget {
  final String label;
  final int amount;
  final Widget? trailing;

  const _BreakdownRow({
    required this.label,
    required this.amount,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CommonText(
            text: label,
            fontSize: AppFontSizes.fontSmall,
            color: AppColors.blackColor,
            fontWeight: AppFontWeights.semiBold,
          ),
        ),
        CommonText(
          text: '₹$amount',
          fontSize: AppFontSizes.fontSmall,
          fontWeight: AppFontWeights.normal,
          color: AppColors.blackColor,
        ),
        if (trailing != null) ...[Spacing.width(8), trailing!],
      ],
    );
  }
}

class _PersonPill extends StatelessWidget {
  final String label;

  const _PersonPill({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.blackColor),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CommonText(
            text: label,
            fontSize: AppFontSizes.fontNenoSmall,
            color: AppColors.blackColor,
          ),
          Spacing.width(2),
          Icon(
            Icons.keyboard_arrow_down,
            size: 12.sp,
            color: AppColors.blackColor,
          ),
        ],
      ),
    );
  }
}
