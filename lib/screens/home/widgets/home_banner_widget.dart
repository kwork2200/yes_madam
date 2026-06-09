import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:marquee/marquee.dart';
import 'package:yes_madam/controller/home/home_controller.dart';
import 'package:yes_madam/routes/app_routes.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_dimensions.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/utils/app_images.dart';
import 'package:yes_madam/utils/app_texts.dart';
import 'package:yes_madam/widgets/common/common_text.dart';
import 'package:yes_madam/widgets/components/spacing_widget.dart';
import 'package:yes_madam/widgets/show_address_bottom_sheet.dart';

class HomeBannerWidget extends GetView<HomeController> {
  const HomeBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320.h,
      child: Stack(
        children: [
          PageView.builder(
            controller: controller.bannerController,
            itemCount: controller.bannerImages.length,
            onPageChanged: (index) {
              controller.currentBannerIndex.value = index;
            },
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.serviceListing);
                },
                child: Image.network(
                  controller.bannerImages[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              );
            },
          ),

          SafeArea(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppDimensions.paddingMedium.w,
                    vertical: AppDimensions.paddingSmall.h,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            print("safdewfdf");
                            GlobalSheets.showAddressBottomSheet();
                          },
                          child: Row(
                            children: [
                              Lottie.asset(
                                AppImages.locationLottie,
                                width: 30.w,
                                height: 30.h,
                              ),

                              Spacing.width(AppDimensions.spacingSmall),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Flexible(
                                          child: CommonText(
                                            text: AppTexts.locationTitle,
                                            fontSize: AppFontSizes.fontMedium,
                                            fontWeight: AppFontWeights.bold,
                                            color: AppColors.whiteColor,
                                            maxLines: 1,
                                          ),
                                        ),
                                        Icon(
                                          Icons.keyboard_arrow_down,
                                          color: AppColors.whiteColor,
                                          size: 18.sp,
                                        ),
                                      ],
                                    ),
                                    CommonText(
                                      text: AppTexts.locationAddress,
                                      fontSize: AppFontSizes.fontNenoSmall,
                                      fontWeight: AppFontWeights.semiBold,
                                      color: AppColors.whiteColor,
                                      maxLines: 1,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.referEarn);
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                            right: AppDimensions.spacingSmall.w,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 6.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.eliteBg,
                            borderRadius: BorderRadius.circular(
                              AppDimensions.radiusCircle.r,
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.shield,
                                color: AppColors.gold,
                                size: 14.sp,
                              ),

                              Spacing.width(AppDimensions.spacingSmall),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonText(
                                    text: AppTexts.earn,
                                    fontSize: AppFontSizes.fontNenoSmall - 1.sp,
                                    fontWeight: AppFontWeights.medium,
                                    color: AppColors.whiteColor,
                                  ),
                                  CommonText(
                                    text: AppTexts.earnAmount,
                                    fontSize: AppFontSizes.fontNenoSmall + 1.sp,
                                    fontWeight: AppFontWeights.bold,
                                    color: AppColors.gold,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.eliteMembership);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 6.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.eliteBg,
                            borderRadius: BorderRadius.circular(
                              AppDimensions.radiusCircle.r,
                            ),
                          ),
                          child: Column(
                            children: [
                              CommonText(
                                text: AppTexts.buy,
                                fontSize: AppFontSizes.fontNenoSmall - 1.sp,
                                fontWeight: AppFontWeights.medium,
                                color: AppColors.whiteColor,
                              ),
                              CommonText(
                                text: AppTexts.elite,
                                fontSize: AppFontSizes.fontNenoSmall + 1.sp,
                                fontWeight: AppFontWeights.bold,
                                color: AppColors.gold,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                GestureDetector(
                  onTap: () => Get.toNamed(AppRoutes.search),
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: AppDimensions.paddingMedium.w,
                      vertical: 6.h,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.w,
                      vertical: 12.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black54,
                          blurRadius: 8.r,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: AppColors.grey, size: 20.sp),
                        Spacing.width(AppDimensions.spacingMedium),
                        SizedBox(
                          height: 20.h,
                          width: 200.w,
                          child: Marquee(
                            text: AppTexts.searchHint,
                            style: TextStyle(
                              color: AppColors.grey,
                              fontSize: AppFontSizes.fontMedium.sp,
                            ),
                            scrollAxis: Axis.horizontal,
                            blankSpace: 40.0,
                            velocity: 40.0,
                            pauseAfterRound: Duration.zero,
                            startPadding: 10.0,
                            accelerationDuration: Duration(seconds: 1),
                            decelerationDuration: Duration(milliseconds: 500),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 15.h,
            left: 0,
            right: 0,
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  controller.bannerImages.length,
                  (index) => Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                    width: controller.currentBannerIndex.value == index
                        ? 20.w
                        : 8.w,
                    height: 8.h,
                    decoration: BoxDecoration(
                      color: controller.currentBannerIndex.value == index
                          ? AppColors.whiteColor
                          : AppColors.white54,
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusCircle.r,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
