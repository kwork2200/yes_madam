import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yes_madam/utils/app_texts.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_font_weights.dart';
import '../../utils/app_font_sizes.dart';
import '../../utils/app_dimensions.dart';
import '../../widgets/common/common_text.dart';
import '../../widgets/common/common_app_bar.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CommonAppBar(
        title: CommonText(
          text: AppTexts.wallet,
          fontSize: AppFontSizes.fontXMedium,
          fontWeight: AppFontWeights.bold,
          color: AppColors.darkColor,
        ),
        showBackButton: true,
        centerTitle: false,
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(AppDimensions.radiusXLarge.w),
          padding: EdgeInsets.all(30.w),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(AppDimensions.paddingMedium.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.grey200,
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 120.w,
                height: 120.w,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(
                      Icons.account_balance_wallet,
                      size: 80.sp,
                      color: AppColors.accentColor,
                    ),
                    Positioned(
                      top: AppDimensions.paddingSmall.h,
                      right: AppDimensions.paddingSmall.w,
                      child: Icon(
                        Icons.circle,
                        size: 28.sp,
                        color: AppColors.goldColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppDimensions.spacingXLarge.h),
              CommonText(
                text: AppTexts.walletBalance,
                fontSize: AppFontSizes.fontXMedium,
                fontWeight: AppFontWeights.semiBold,
                color: AppColors.accentColor,
              ),
              SizedBox(height: AppDimensions.spacingMedium.h),
              CommonText(
                text: '₹0',
                fontSize: AppFontSizes.fontXLarge26,
                fontWeight: AppFontWeights.bold,
                color: AppColors.darkColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
