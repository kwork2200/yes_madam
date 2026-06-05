import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_dimensions.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/widgets/common/common_text.dart';
import 'package:yes_madam/widgets/components/spacing_widget.dart';

class SearchServiceCard extends StatelessWidget {
  final Map<String, dynamic> service;
  final int index;
  final double? width;
  final RxList<int> counts;
  final Function(int) onAdd;
  final Function(int) onMinus;
  final VoidCallback onTap;

  const SearchServiceCard({
    super.key,
    required this.service,
    required this.index,
    this.width,
    required this.counts,
    required this.onAdd,
    required this.onMinus,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final badge = service['badge'] as String;

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(right: 5.h),
        child: SizedBox(
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 10.0.h),
                    child: Container(
                      height: 130.h,
                      decoration: BoxDecoration(
                        color: AppColors.lightGrey,
                        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium.r),
                        image: DecorationImage(
                          image: NetworkImage(service['image'] as String),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  if (badge.isNotEmpty)
                    Positioned(
                      top: 0.h,
                      left: 0.w,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                        decoration: BoxDecoration(
                          color: AppColors.grey,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10.r),
                            topLeft: Radius.circular(10.r),
                          ),
                        ),
                        child: CommonText(
                          text: badge,
                          fontSize: AppFontSizes.fontNenoSmall,
                          fontWeight: AppFontWeights.black,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(6.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: CommonText(
                          text: service['title'] as String,
                          fontSize: AppFontSizes.fontSmall,
                          fontWeight: AppFontWeights.medium,
                          color: AppColors.black,
                          maxLines: 2,
                        ),
                      ),
                      Spacing.height(AppDimensions.spacingSmall),
                      Row(
                        children: [
                          Icon(Icons.access_time, size: 11.sp, color: AppColors.greyColor),
                          Spacing.width(3),
                          CommonText(
                            text: service['duration'] as String,
                            fontSize: AppFontSizes.fontNenoSmall,
                            fontWeight: AppFontWeights.bold,
                            color: AppColors.grey,
                          ),
                        ],
                      ),
                      Spacing.height(AppDimensions.spacingSmall),
                      Row(
                        children: [
                          CommonText(
                            text: service['price'] as String,
                            fontSize: AppFontSizes.fontNenoSmall,
                            fontWeight: AppFontWeights.bold,
                            color: AppColors.black,
                          ),
                          Spacing.width(2),
                          Expanded(
                            child: CommonText(
                              text: "${service['mrp']} |",
                              fontSize: AppFontSizes.fontNenoSmall,
                              color: AppColors.greyColor,
                              fontWeight: AppFontWeights.bold,
                              decoration: TextDecoration.lineThrough,
                              decorationColor: AppColors.greyColor,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Spacing.width(2),
                          CommonText(
                            text: service['discount'] as String,
                            fontSize: AppFontSizes.fontNenoSmall,
                            fontWeight: AppFontWeights.bold,
                            color: AppColors.lightGreen,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      Spacing.height(6),
                      Obx(() {
                        if (index >= counts.length) {
                          return const SizedBox.shrink();
                        }
                        final count = counts[index];

                        if (count == 0) {
                          return GestureDetector(
                            onTap: () => onAdd(index),
                            child: Container(
                              height: 24.h,
                              width: double.infinity,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(6.r),
                                border: Border.all(color: AppColors.themeColor),
                              ),
                              child: CommonText(
                                text: 'Add to Cart',
                                fontSize: AppFontSizes.fontSmall,
                                fontWeight: AppFontWeights.bold,
                                color: AppColors.themeColor,
                              ),
                            ),
                          );
                        }

                        return Container(
                          height: 24.h,
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 22.w),
                          decoration: BoxDecoration(
                            color: AppColors.lightPink,
                            border: Border.all(color: AppColors.themeColor),
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () => onMinus(index),
                                child: Icon(Icons.remove, size: 16.sp, color: AppColors.themeColor),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: CommonText(
                                  text: count.toString(),
                                  fontSize: AppFontSizes.fontSmall,
                                  fontWeight: AppFontWeights.bold,
                                  color: AppColors.themeColor,
                                ),
                              ),
                              GestureDetector(
                                onTap: () => onAdd(index),
                                child: Icon(Icons.add, size: 16.sp, color: AppColors.themeColor),
                              ),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
