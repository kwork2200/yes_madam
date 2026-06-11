import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/widgets/common/common_text.dart';
import 'package:yes_madam/widgets/components/spacing_widget.dart';

class ReferralCoinsBottomSheet extends StatelessWidget {
  final int coins;

  const ReferralCoinsBottomSheet({super.key, required this.coins});

  static void show(BuildContext context, int coins) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      builder: (_) => ReferralCoinsBottomSheet(coins: coins),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                text: 'Referral Coins',
                fontSize: AppFontSizes.fontXMedium,
                fontWeight: AppFontWeights.bold,
                color: AppColors.blackColor,
              ),
              Spacing.height(6),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  color: const Color(0xffF3F4FF),
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(color: AppColors.grey300),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: 'Your Referral Coins',
                      fontSize: AppFontSizes.fontSmall,
                      color: AppColors.blackColor,
                      fontWeight: AppFontWeights.medium,
                    ),
                    Spacing.height(6),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 14.r,
                          backgroundColor: AppColors.coinOrange,
                          child: CommonText(
                            text: "R",
                            fontWeight: AppFontWeights.bold,
                          ),
                        ),
                        Spacing.width(4),
                        CommonText(
                          text: coins.toString(),
                          fontSize: AppFontSizes.fontXLarge,
                          fontWeight: AppFontWeights.bold,
                          color: AppColors.blackColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Spacing.height(10),
              CommonText(
                text: 'Refer YesMadam & start earning referral coins.',
                fontSize: AppFontSizes.fontSmall,
                color: AppColors.blackColor,
              ),
              Spacing.height(10),
            ],
          ),
        ),
        Positioned(
          top: -35.h,
          right: 12.w,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 30.h,
              width: 30.w,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.close, color: Colors.black, size: 22.sp),
            ),
          ),
        ),
      ],
    );
  }
}
