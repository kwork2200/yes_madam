import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yes_madam/controller/home/home_controller.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_dimensions.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/utils/app_texts.dart';
import 'package:yes_madam/widgets/common/common_text.dart';
import 'package:yes_madam/widgets/components/spacing_widget.dart';
import 'package:yes_madam/widgets/common/common_button.dart';

class HomeCreatePackageWidget extends GetView<HomeController> {
  const HomeCreatePackageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimensions.paddingSmall.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: AppTexts.createPackageTitle,
            fontSize: AppFontSizes.fontXMedium,
            fontWeight: AppFontWeights.semiBold,
            color: AppColors.black,
          ),
          Spacing.height(AppDimensions.spacingLarge.h),
          SizedBox(
            height: AppDimensions.paddingXLarge60 * 5.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: controller.packageList.length,
              separatorBuilder: (_, __) =>
                  Spacing.width(AppDimensions.spacingLarge.w),
              itemBuilder: (_, index) {
                return CreatePackageCardWidget(
                  package: controller.packageList[index],
                  index: index,
                );
              },
            ),
          ),
          Spacing.height(AppDimensions.paddingLarge.h),
        ],
      ),
    );
  }
}

class CreatePackageCardWidget extends GetView<HomeController> {
  final Map<String, dynamic> package;
  final int index;

  const CreatePackageCardWidget({
    super.key,
    required this.package,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> packageItems = List<String>.from(package['items']);

    return Container(
      width: AppDimensions.paddingXLarge60 * 5.w,
      padding: EdgeInsets.all(AppDimensions.paddingSmall.w),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(AppDimensions.radiusSmall.r),
        border: Border.all(color: AppColors.grey200),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey300,
            blurRadius: AppDimensions.spacingSmall.r,
            offset: Offset(0, AppDimensions.spacingSmall),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: AppDimensions.paddingXLarge40 * 2.w,
                height: AppDimensions.paddingXLarge40 * 2.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryLight,
                  borderRadius: BorderRadius.circular(AppDimensions.radiusSmall.r),
                ),
                child: GridView.count(
                  crossAxisCount: 2,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.all(AppDimensions.spacingSmall.w),
                  crossAxisSpacing: AppDimensions.spacingSmall.w,
                  mainAxisSpacing: AppDimensions.spacingSmall.h,
                  children: List.generate(
                    4,
                    (index) => ClipRRect(
                      borderRadius: BorderRadius.circular(AppDimensions.spacingSmall.r),
                      child: Image.network(
                        package['images'][index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Spacing.width(AppDimensions.spacingLarge),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: package['title'],
                      fontSize: AppFontSizes.fontMedium,
                      fontWeight: AppFontWeights.bold,
                      color: AppColors.black,
                    ),
                    CommonText(
                      text: package['services'],
                      fontSize: AppFontSizes.fontSmall,
                      color: AppColors.grey,
                      fontWeight: AppFontWeights.semiBold,
                    ),
                    Spacing.height(AppDimensions.spacingSmall.h),
                    Row(
                      children: [
                        CommonText(
                          text: package['price'],
                          fontSize: AppFontSizes.fontMedium,
                          fontWeight: AppFontWeights.extraBold,
                          color: AppColors.black,
                        ),
                        Spacing.width(AppDimensions.spacingSmall.w),
                        CommonText(
                          text: package['mrp'],
                          fontSize: AppFontSizes.fontSmall,
                          color: AppColors.grey,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: AppColors.grey,
                        ),
                        Spacing.width(AppDimensions.spacingSmall.w),
                        Container(
                          height: AppDimensions.paddingSmall.h,
                          width: AppDimensions.paddingSmall.w,
                          decoration: const BoxDecoration(
                            color: AppColors.green,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.percent,
                            color: AppColors.whiteColor,
                            size: AppFontSizes.fontNenoSmall.sp,
                          ),
                        ),
                        CommonText(
                          text: " ${package['discount']}",
                          fontSize: AppFontSizes.fontSmall,
                          color: AppColors.green,
                          fontWeight: AppFontWeights.extraBold,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: AppFontSizes.fontSmall.sp,
                          color: AppColors.grey,
                        ),
                        Spacing.width(AppDimensions.spacingSmall.w),
                        CommonText(
                          text: package['duration'],
                          fontSize: AppFontSizes.fontSmall,
                          color: AppColors.grey,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Spacing.height(AppDimensions.spacingLarge.h),
          ...packageItems.map((item) {
            final parts = item.split(':');
            return Padding(
              padding: EdgeInsets.only(bottom: AppDimensions.spacingSmall.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: AppDimensions.spacingSmall.h, right: AppDimensions.spacingSmall.w),
                    width: AppDimensions.spacingSmall.w,
                    height: AppDimensions.spacingSmall.w,
                    decoration: const BoxDecoration(
                      color: AppColors.black,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '${parts.first}:',
                            style: TextStyle(
                              fontSize: AppFontSizes.fontSmall,
                              fontWeight: AppFontWeights.extraBold,
                              color: AppColors.black,
                            ),
                          ),
                          TextSpan(
                            text: parts.length > 1
                                ? parts.sublist(1).join(':')
                                : '',
                            style: TextStyle(
                              fontSize: AppFontSizes.fontSmall,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
          const Spacer(),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(AppDimensions.spacingSmall.r),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.grey200),
                ),
                child: Icon(Icons.share, size: AppFontSizes.fontMedium.sp, color: AppColors.grey),
              ),
              const Spacer(),
              CommonButton(
                text: AppTexts.editPackage,
                onPressed: () {},
                height: AppDimensions.paddingXLarge40.h,
                backgroundColor: AppColors.whiteColor,
                borderColor: AppColors.grey300,
                textColor: AppColors.black,
                fontSize: AppFontSizes.fontSmall,
                fontWeight: AppFontWeights.semiBold,
              ),
              Spacing.width(AppDimensions.spacingMedium),
              Obx(() {
                final count = controller.packageCounts[index];

                if (count == 0) {
                  return CommonButton(
                    text: AppTexts.add,
                    onPressed: () {
                      controller.incrementPackage(index);
                    },
                    height: AppDimensions.paddingXLarge40.h,
                    backgroundColor: AppColors.themeColor,
                    textColor: AppColors.whiteColor,
                    fontSize: AppFontSizes.fontSmall,
                    fontWeight: AppFontWeights.bold,
                  );
                }

                return Container(
                  height: AppDimensions.paddingXLarge40.h,
                  padding: EdgeInsets.symmetric(horizontal: AppDimensions.spacingSmall.w),
                  decoration: BoxDecoration(
                    color: AppColors.lightPink,
                    border: Border.all(color: AppColors.themeColor),
                    borderRadius: BorderRadius.circular(AppDimensions.radiusSmall.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.decrementPackage(index);
                        },
                        child: Icon(
                          Icons.remove,
                          size: AppFontSizes.fontMedium.sp,
                          color: AppColors.themeColor,
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: AppDimensions.paddingSmall.w),
                        child: CommonText(
                          text: count.toString(),
                          fontSize: AppFontSizes.fontMedium,
                          fontWeight: AppFontWeights.bold,
                          color: AppColors.themeColor,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.incrementPackage(index);
                        },
                        child: Icon(
                          Icons.add,
                          size: AppFontSizes.fontMedium.sp,
                          color: AppColors.themeColor,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}
