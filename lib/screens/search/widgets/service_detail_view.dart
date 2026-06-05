import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yes_madam/model/benefit_item_model.dart';
import 'package:yes_madam/screens/search/widgets/glossy_skin_section.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_dimensions.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/widgets/common/common_text.dart';
import 'package:yes_madam/widgets/components/spacing_widget.dart';

class ServiceDetailView extends StatelessWidget {
  final Map<String, dynamic> service;
  final int index;
  final RxList<int> counts;
  final Function(int) onAdd;
  final Function(int) onMinus;
  final VoidCallback onClose;

  const ServiceDetailView({super.key,
    required this.service,
    required this.index,
    required this.counts,
    required this.onAdd,
    required this.onMinus,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(height: 180.h, color: const Color(0xFF232323)),
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 110.h),
              SizedBox(
                height: 248.h,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.network(service['hero'] as String, fit: BoxFit.cover),
                    ),
                    Positioned(
                      left: 34.w,
                      top: 72.h,
                      child: CommonText(
                        text: (service['title'] as String) == 'Korean Clean Up'
                            ? '7-Step\nKorean\nClean-up'
                            : (service['title'] as String).replaceAll(' ', '\n'),
                        fontSize: AppFontSizes.fontXLarge,
                        fontWeight: AppFontWeights.black,
                        color: AppColors.whiteColor,
                        textHeight: 1.04,
                        softWrap: true,
                      ),
                    ),
                    Positioned(
                      left: 0,
                      bottom: 0,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(28.r)),
                        ),
                        child: Row(
                          children: [
                            Text('⏱', style: TextStyle(fontSize: 15.sp)),
                            Spacing.width(AppDimensions.spacingSmall),
                            CommonText(
                              text: service['duration'] as String,
                              fontSize: AppFontSizes.fontMedium,
                              fontWeight: AppFontWeights.medium,
                              color: AppColors.blackColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ServiceInfoCard(
                service: service,
                index: index,
                counts: counts,
                onAdd: onAdd,
                onMinus: onMinus,
              ),
              Container(height: 8.h, color: AppColors.grey200),
              GlossySkinSection(
                title: 'Get Glossy\nSmooth Skin',
                benefits: const [
                  BenefitItem(
                    title: 'Red Algae',
                    body: 'Deeply detoxifies skin & protects skin barrier',
                  ),
                  BenefitItem(
                    title: 'Rice Water Extract',
                    body: 'Hydrates deeply & enhances skin elasticity',
                  ),
                  BenefitItem(
                    title: 'Korean Ginseng Extract',
                    body: 'Smoothes fine lines and boosts collagen',
                  ),
                ],
              )
            ],
          ),
        ),
        Positioned(
          top: 65.h,
          right: 18.w,
          child: GestureDetector(
            onTap: onClose,
            child: Container(
              width: 25.w,
              height: 25.w,
              decoration: const BoxDecoration(
                color: AppColors.whiteColor,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.close, size: 20.sp, color: AppColors.blackColor),
            ),
          ),
        ),
      ],
    );
  }
}

class ServiceInfoCard extends StatelessWidget {
  final Map<String, dynamic> service;
  final int index;
  final RxList<int> counts;
  final Function(int) onAdd;
  final Function(int) onMinus;

  const ServiceInfoCard({super.key,
    required this.service,
    required this.index,
    required this.counts,
    required this.onAdd,
    required this.onMinus,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      padding: EdgeInsets.fromLTRB(18.w, 22.h, 18.w, 24.h),
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
                    CommonText(
                      text: service['title'] as String,
                      fontSize: AppFontSizes.fontLarge -2.sp,
                      fontWeight: AppFontWeights.semiBold,
                      color: AppColors.blackColor,
                    ),
                    Spacing.height(AppDimensions.spacingSmall),
                    CommonText(
                      text: service['subtitle'] as String,
                      fontSize: AppFontSizes.fontMedium,
                      fontWeight: AppFontWeights.medium,
                      color: AppColors.grey,
                      softWrap: true,
                    ),
                  ],
                ),
              ),
              AddStepper(
                index: index,
                counts: counts,
                onAdd: onAdd,
                onMinus: onMinus,
              ),
            ],
          ),
          Spacing.height(AppDimensions.spacingXLarge),
          Row(
            children: [
              CommonText(
                text: service['price'] as String,
                fontSize: AppFontSizes.fontMedium,
                fontWeight: AppFontWeights.black,
                color: AppColors.blackColor,
              ),
              Spacing.width(AppDimensions.spacingSmall),
              CommonText(
                text: service['mrp'] as String,
                fontSize: AppFontSizes.fontSmall,
                fontWeight: AppFontWeights.bold,
                color: AppColors.greyColor,
                decoration: TextDecoration.lineThrough,
                decorationColor: AppColors.greyColor,
              ),
              Spacing.width(AppDimensions.spacingMedium),
              Container(width: 1.w, height: 18.h, color: AppColors.grey),
              Spacing.width(AppDimensions.spacingMedium),
              Icon(Icons.discount, color: AppColors.green, size: 16.sp),
              Spacing.width(AppDimensions.spacingSmall),
              CommonText(
                text: service['discount'] as String,
                fontSize: AppFontSizes.fontSmall,
                fontWeight: AppFontWeights.black,
                color: AppColors.green,
              ),
            ],
          ),
          Spacing.height(AppDimensions.spacingLarge),
          Row(
            children: [
              Icon(Icons.star, color: Colors.amber, size: 20.sp),
              Spacing.width(AppDimensions.spacingSmall),
              CommonText(
                text: service['rating'] as String,
                fontSize: AppFontSizes.fontMedium,
                fontWeight: AppFontWeights.normal,
                color: AppColors.blackColor,
                decoration: TextDecoration.underline,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AddStepper extends StatelessWidget {
  final int index;
  final RxList<int> counts;
  final Function(int) onAdd;
  final Function(int) onMinus;

  const AddStepper({
    super.key,
    required this.index,
    required this.counts,
    required this.onAdd,
    required this.onMinus,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final count = index >= 0 && index < counts.length ? counts[index] : 0;

      if (count == 0) {
        return GestureDetector(
          onTap: () => onAdd(index),
          child: Container(
            height: 30.h,
            width: 70.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(AppDimensions.radiusSmall.r - 2.r),
              border: Border.all(color: AppColors.themeColor),
            ),
            child: CommonText(
              text: 'ADD',
              fontSize: AppFontSizes.fontMedium,
              fontWeight: AppFontWeights.extraBold,
              color: AppColors.themeColor,
            ),
          ),
        );
      }

      return Container(
        height: 34.h,
        width: 82.w,
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        decoration: BoxDecoration(
          color: AppColors.lightPink,
          borderRadius: BorderRadius.circular(AppDimensions.radiusSmall.r),
          border: Border.all(color: AppColors.themeColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => onMinus(index),
              child: Icon(Icons.remove, size: 16.sp, color: AppColors.themeColor),
            ),
            CommonText(
              text: '$count',
              fontSize: AppFontSizes.fontSmall,
              fontWeight: AppFontWeights.bold,
              color: AppColors.themeColor,
            ),
            GestureDetector(
              onTap: () => onAdd(index),
              child: Icon(Icons.add, size: 16.sp, color: AppColors.themeColor),
            ),
          ],
        ),
      );
    });
  }
}


