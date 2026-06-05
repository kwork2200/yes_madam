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
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: AppTexts.createPackageTitle,
            fontSize: AppFontSizes.fontXMedium,
            fontWeight: AppFontWeights.semiBold,
            color: AppColors.black,
          ),
          Spacing.height(AppDimensions.spacingLarge),
          SizedBox(
            height: 340.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: controller.packageList.length,
              separatorBuilder: (_, __) =>
                  Spacing.width(AppDimensions.spacingLarge),
              itemBuilder: (_, index) {
                return CreatePackageCardWidget(
                  package: controller.packageList[index],
                  index: index,
                );
              },
            ),
          ),
          Spacing.height(20),
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
      width: 300.w,
      padding: EdgeInsets.all(AppDimensions.paddingSmall.w),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(AppDimensions.radiusSmall.r),
        border: Border.all(color: AppColors.grey200),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey300,
            blurRadius: 2.r,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 90.w,
                height: 90.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryLight,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: GridView.count(
                  crossAxisCount: 2,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.all(4.w),
                  crossAxisSpacing: 3.w,
                  mainAxisSpacing: 3.h,
                  children: List.generate(
                    4,
                    (index) => ClipRRect(
                      borderRadius: BorderRadius.circular(4.r),
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
                    Spacing.height(AppDimensions.spacingSmall),
                    Row(
                      children: [
                        CommonText(
                          text: package['price'],
                          fontSize: AppFontSizes.fontMedium,
                          fontWeight: AppFontWeights.extraBold,
                          color: AppColors.black,
                        ),
                        Spacing.width(4),
                        CommonText(
                          text: package['mrp'],
                          fontSize: AppFontSizes.fontSmall,
                          color: AppColors.grey,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: AppColors.grey,
                        ),
                        Spacing.width(4),
                        Container(
                          height: 15.h,
                          width: 15.w,
                          decoration: const BoxDecoration(
                            color: AppColors.green,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.percent,
                            color: AppColors.whiteColor,
                            size: 12.sp,
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
                          size: 14.sp,
                          color: AppColors.grey,
                        ),
                        Spacing.width(3),
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
          Spacing.height(AppDimensions.spacingLarge),
          ...packageItems.map((item) {
            final parts = item.split(':');
            return Padding(
              padding: EdgeInsets.only(bottom: 6.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 5.h, right: 6.w),
                    width: 5.w,
                    height: 5.w,
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
                padding: EdgeInsets.all(4.r),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.grey200),
                ),
                child: Icon(Icons.share, size: 18.sp, color: AppColors.grey),
              ),
              const Spacer(),
              CommonButton(
                text: AppTexts.editPackage,
                onPressed: () {},
                height: 30.h,
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
                    height: 30.h,
                    backgroundColor: AppColors.themeColor,
                    textColor: AppColors.whiteColor,
                    fontSize: AppFontSizes.fontSmall,
                    fontWeight: AppFontWeights.bold,
                  );
                }

                return Container(
                  height: 30.h,
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  decoration: BoxDecoration(
                    color: AppColors.lightPink,
                    border: Border.all(color: AppColors.themeColor),
                    borderRadius: BorderRadius.circular(8.r),
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
                          size: 18.sp,
                          color: AppColors.themeColor,
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
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
                          size: 18.sp,
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
