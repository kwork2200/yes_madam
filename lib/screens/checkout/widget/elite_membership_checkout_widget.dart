import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/utils/app_texts.dart';
import 'package:yes_madam/widgets/common/common_text.dart';
import 'package:yes_madam/widgets/components/spacing_widget.dart';

class EliteMembershipCheckoutWidget extends StatelessWidget {
  final bool isAdded;
  final int price;
  final int mrp;
  final String duration;
  final int savingsAmount;
  final VoidCallback onToggle;
  final int? cashbackAmount;

  const EliteMembershipCheckoutWidget({
    super.key,
    required this.isAdded,
    required this.price,
    required this.mrp,
    required this.duration,
    required this.savingsAmount,
    required this.onToggle,
    this.cashbackAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFfffbf6),
        border: Border.all(color: AppColors.coinOrange, width: 0.4.w),
        borderRadius: BorderRadius.circular(10.r),
      ),
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 5.h),
            decoration: BoxDecoration(
              color: Color(0xFFea9606),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20.r),
              ),
            ),
            child: CommonText(
              text: 'Limited time offer, only for you!',
              fontSize: AppFontSizes.fontSmall,
              color: AppColors.blackColor,
              fontWeight: AppFontWeights.semiBold,
            ),
          ),
          Spacing.height(10),
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
                            fontSize: AppFontSizes.fontXMedium,
                            fontWeight: AppFontWeights.semiBold,
                            color: AppColors.blackColor,
                          ),
                          Spacing.width(4),
                          Icon(
                            Icons.info_outline,
                            size: 18.sp,
                            color: Color(0xFFe1bd6a),
                          ),
                        ],
                      ),
                      CommonText(
                        text: duration,
                        fontSize: AppFontSizes.fontSmall,
                        fontWeight: AppFontWeights.bold,
                        color: AppColors.greyColor,
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    CommonText(
                      text: '₹$price',
                      fontSize: AppFontSizes.fontMedium,
                      fontWeight: AppFontWeights.bold,
                      color: AppColors.blackColor,
                    ),
                    Spacing.width(6),
                    CommonText(
                      text: '₹$mrp',
                      fontSize: AppFontSizes.fontNenoSmall,
                      color: AppColors.greyColor,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: AppColors.greyColor,
                    ),
                  ],
                ),
                Spacing.width(12),
                GestureDetector(
                  onTap: onToggle,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.w,
                      vertical: 6.h,
                    ),
                    decoration: BoxDecoration(
                      color: isAdded
                          ? Colors.transparent
                          : Colors.transparent,
                      border: isAdded
                          ? Border.all(color: AppColors.greyColor)
                          : Border.all(color: AppColors.greyColor),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: CommonText(
                      text: isAdded ? 'REMOVE' : AppTexts.add,
                      fontSize: AppFontSizes.fontSmall,
                      fontWeight: AppFontWeights.bold,
                      color: isAdded
                          ? AppColors.themeColor
                          : AppColors.themeColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Spacing.height(10),
        ],
      ),
    );
  }
}
