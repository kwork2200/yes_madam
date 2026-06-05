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

class HomeBestSellersWidget extends GetView<HomeController> {
  const HomeBestSellersWidget({super.key});

  static final List<Map<String, dynamic>> _bestSellers = [
    {
      'brand': 'RICA',
      'bannerText':
          'Low Heat Formula\nwith One-Time Use\nfor a Safer Experience',
      'title': 'Full Arms + Half Legs + Underarms Waxing ...',
      'price': '₹677',
      'mrp': '₹1499',
      'duration': '50 mins',
      'color': const Color(0xFFAA741E),
      'image':
          'https://images.unsplash.com/photo-1522335789203-aabd1fc54bc9?w=600',
    },
    {
      'brand': 'SOKORA',
      'bannerText': '9 Steps\nKorean-Glass\nSkin Ritual',
      'title': 'Korean Glow Cleanup ...',
      'price': '₹1399',
      'mrp': '₹2499',
      'duration': '60 mins',
      'color': const Color(0xFFB51E2E),
      'image':
          'https://images.unsplash.com/photo-1515377905703-c4788e51af15?w=600',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Spacing.height(15),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.paddingMedium.w,
          ),
          child: CommonText(
            text: AppTexts.ourBestSellers,
            fontSize: AppFontSizes.fontXMedium,
            fontWeight: AppFontWeights.semiBold,
            color: AppColors.black,
          ),
        ),
        Spacing.height(AppDimensions.spacingMedium),
        SizedBox(
          height: 230.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(
              horizontal: AppDimensions.paddingMedium.w,
            ),
            itemCount: _bestSellers.length,
            itemBuilder: (_, index) {
              return _BestSellerCard(
                item: _bestSellers[index],
                index: index,
                counts: controller.bestSellerCounts,
                onAdd: controller.incrementBestSeller,
                onMinus: controller.decrementBestSeller,
              );
            },
          ),
        ),
      ],
    );
  }
}

class _BestSellerCard extends StatelessWidget {
  final Map<String, dynamic> item;
  final int index;
  final RxList<int> counts;
  final Function(int) onAdd;
  final Function(int) onMinus;

  const _BestSellerCard({
    required this.item,
    required this.index,
    required this.counts,
    required this.onAdd,
    required this.onMinus,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280.w,
      child: Padding(
        padding: EdgeInsets.only(right: AppDimensions.spacingLarge.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150.h,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: item['color'] as Color,
                borderRadius: BorderRadius.circular(
                  AppDimensions.radiusLarge.r,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 18.w,
                    top: 16.h,
                    child: CommonText(
                      text: item['brand'] as String,
                      fontSize: AppFontSizes.fontXMedium,
                      fontWeight: AppFontWeights.normal,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  Positioned(
                    left: 20.w,
                    bottom: 28.h,
                    child: CommonText(
                      text: item['bannerText'] as String,
                      fontSize: AppFontSizes.fontNenoSmall,
                      fontWeight: AppFontWeights.bold,
                      color: AppColors.whiteColor,
                      softWrap: true,
                    ),
                  ),
                  Positioned(
                    right: -8.w,
                    bottom: -4.h,
                    width: 110.w,
                    height: 130.h,
                    child: Image.network(
                      item['image'] as String,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Spacing.height(AppDimensions.spacingMedium),
            CommonText(
              text: item['title'] as String,
              fontSize: AppFontSizes.fontSmall,
              fontWeight: AppFontWeights.medium,
              color: AppColors.blackColor,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Spacing.height(AppDimensions.spacingSmall),
            Row(
              children: [
                CommonText(
                  text: item['price'] as String,
                  fontSize: AppFontSizes.fontSmall,
                  fontWeight: AppFontWeights.extraBold,
                  color: AppColors.blackColor,
                ),
                Spacing.width(AppDimensions.spacingSmall),
                CommonText(
                  text: item['mrp'] as String,
                  fontSize: AppFontSizes.fontNenoSmall,
                  fontWeight: AppFontWeights.bold,
                  color: AppColors.greyColor,
                  decoration: TextDecoration.lineThrough,
                  decorationColor: AppColors.greyColor,
                ),
                Spacing.width(AppDimensions.spacingSmall),
                Container(width: 1.w, height: 14.h, color: AppColors.grey),
                Spacing.width(AppDimensions.spacingSmall),
                Icon(
                  Icons.access_time,
                  size: 14.sp,
                  color: AppColors.blackColor,
                ),
                Spacing.width(AppDimensions.spacingSmall),
                Expanded(
                  child: CommonText(
                    text: item['duration'] as String,
                    fontSize: AppFontSizes.fontSmall,
                    fontWeight: AppFontWeights.medium,
                    color: AppColors.blackColor,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Obx(() {
                  if (index >= counts.length) {
                    return const SizedBox.shrink();
                  }

                  final count = counts[index];
                  if (count == 0) {
                    return GestureDetector(
                      onTap: () => onAdd(index),
                      child: Container(
                        height: 25.h,
                        width: 70.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(
                            AppDimensions.radiusSmall.r,
                          ),
                          border: Border.all(color: AppColors.themeColor),
                        ),
                        child: CommonText(
                          text: AppTexts.add,
                          fontSize: AppFontSizes.fontSmall,
                          fontWeight: AppFontWeights.bold,
                          color: AppColors.themeColor,
                        ),
                      ),
                    );
                  }

                  return Container(
                    height: 28.h,
                    width: 70.w,
                    padding: EdgeInsets.symmetric(horizontal: 6.w),
                    decoration: BoxDecoration(
                      color: AppColors.lightPink,
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusSmall.r,
                      ),
                      border: Border.all(color: AppColors.themeColor),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => onMinus(index),
                          child: Icon(
                            Icons.remove,
                            size: 15.sp,
                            color: AppColors.themeColor,
                          ),
                        ),
                        CommonText(
                          text: count.toString(),
                          fontSize: AppFontSizes.fontSmall,
                          fontWeight: AppFontWeights.bold,
                          color: AppColors.themeColor,
                        ),
                        GestureDetector(
                          onTap: () => onAdd(index),
                          child: Icon(
                            Icons.add,
                            size: 15.sp,
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
      ),
    );
  }
}
