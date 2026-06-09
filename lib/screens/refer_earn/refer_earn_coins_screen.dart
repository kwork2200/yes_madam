import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yes_madam/controller/refer_earn/refer_earn_controller.dart';
import 'package:yes_madam/routes/app_routes.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_dimensions.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/widgets/common/common_button.dart';
import 'package:yes_madam/widgets/common/common_text.dart';
import 'package:yes_madam/widgets/components/spacing_widget.dart';

class ReferEarnCoinsScreen extends GetView<ReferEarnController> {
  const ReferEarnCoinsScreen({super.key});

  static const _tabs = ['ALL', 'CREDITED', 'DEBITED'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBg,
      appBar: AppBar(
        backgroundColor: AppColors.referGradientStart,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.whiteColor,
            size: 18,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () => Get.toNamed(AppRoutes.referEarnFaq),
            child: Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: Container(
                width: 28.w,
                height: 28.w,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: const Text(
                  '?',
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFb7baf1),
              Color(0xFF9398e6),
              Color(0xFF8b91e8),
              Color(0xFF6e75e0),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(AppDimensions.paddingMedium.r),
              padding: EdgeInsets.all(AppDimensions.paddingMedium.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  AppDimensions.radiusXLarge.r,
                ),
                gradient: const LinearGradient(
                  colors: [AppColors.royalBlue, AppColors.darkReferBlue],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text: 'Your Referral Coins',
                    fontSize: AppFontSizes.fontMedium,
                    fontWeight: AppFontWeights.normal,
                    color: AppColors.whiteColor.withOpacity(0.8),
                  ),
                  Obx(
                    () => Row(
                      children: [
                        Container(
                          width: 32.w,
                          height: 32.w,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [
                                AppColors.orangeAccent,
                                AppColors.coinOrange,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: CommonText(
                            text: 'R',
                            fontSize: AppFontSizes.fontMedium,
                            fontWeight: AppFontWeights.bold,
                            color: AppColors.whiteColor,
                          ),
                        ),
                        Spacing.width(12),
                        CommonText(
                          text: '${controller.coinBalance.value}',
                          fontSize: AppFontSizes.fontXLarge36,
                          fontWeight: AppFontWeights.bold,
                          color: AppColors.whiteColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: AppDimensions.paddingMedium.w,
                ),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(
                    AppDimensions.radiusXLarge.r,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Obx(
                      () => Row(
                        children: _tabs.map((tab) {
                          final isActive = controller.selectedTab.value == tab;

                          return Expanded(
                            child: GestureDetector(
                              onTap: () => controller.setTab(tab),
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 12.h),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: isActive
                                          ? AppColors.referGradientStart
                                          : Colors.transparent,
                                      width: 2,
                                    ),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: CommonText(
                                  text: tab,
                                  fontSize: AppFontSizes.fontMedium,
                                  fontWeight: AppFontWeights.bold,
                                  color: isActive
                                      ? AppColors.referGradientStart
                                      : AppColors.greyColor,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    Divider(height: 1, color: AppColors.grey400),
                    Expanded(
                      child: _EmptyReferralsState(onReferNow: () => Get.back()),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyReferralsState extends StatelessWidget {
  final VoidCallback onReferNow;

  const _EmptyReferralsState({required this.onReferNow});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 250.w,
          height: 250.w,
          decoration: BoxDecoration(
            color: AppColors.grey100,
            borderRadius: BorderRadius.circular(AppDimensions.radiusLarge.r),
            image: DecorationImage(image: NetworkImage("https://img.freepik.com/free-vector/hand-drawn-no-data-concept_52683-127823.jpg?semt=ais_hybrid&w=740&q=80"),fit: BoxFit.cover)
          ),
        ),
        Spacing.height(20),
        CommonText(
          text: 'No Referrals Yet!',
          fontSize: AppFontSizes.fontXLarge,
          fontWeight: AppFontWeights.bold,
          color: AppColors.blackColor,
        ),
        // Spacing.height(8),
        CommonText(
          text: 'Refer friends and start earning coins & free services',
          fontSize: AppFontSizes.fontSmall,
          fontWeight: AppFontWeights.normal,
          color: AppColors.greyColor,
          textAlign: TextAlign.center,
          softWrap: true,
        ),
        Spacing.height(24),
        CommonButton(
          text: 'REFER NOW',
          onPressed: onReferNow,
          textColor: AppColors.deepIndigo,
          width: 160.w,
          backgroundColor: AppColors.lightLavenderBlue,
        ),
      ],
    );
  }
}
