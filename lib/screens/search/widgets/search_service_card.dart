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
                clipBehavior: Clip.none,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 10.0.h, bottom: 10.h),
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
                  Positioned(
                    bottom: 16.h,
                    right: 14.h,
                    child: Obx(() {
                      if (index >= counts.length) {
                        return const SizedBox.shrink();
                      }
                      final count = counts[index];

                      if (count == 0) {
                        return GestureDetector(
                          onTap: () => onAdd(index),
                          child: Container(
                            height: 26.h,
                            width: 65.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(6.r),
                              border: Border.all(color: AppColors.themeColor),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                )
                              ],
                            ),
                            child: CommonText(
                              text: 'Add',
                              fontSize: AppFontSizes.fontSmall,
                              fontWeight: AppFontWeights.bold,
                              color: AppColors.themeColor,
                            ),
                          ),
                        );
                      }

                      return Container(
                        height: 26.h,
                        width: 75.w,
                        padding: EdgeInsets.symmetric(horizontal: 6.w),
                        decoration: BoxDecoration(
                          color: AppColors.lightPink,
                          border: Border.all(color: AppColors.themeColor),
                          borderRadius: BorderRadius.circular(6.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            )
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () => onMinus(index),
                              child: Icon(Icons.remove, size: 14.sp, color: AppColors.themeColor),
                            ),
                            CommonText(
                              text: count.toString(),
                              fontSize: AppFontSizes.fontSmall,
                              fontWeight: AppFontWeights.bold,
                              color: AppColors.themeColor,
                            ),
                            GestureDetector(
                              onTap: () => onAdd(index),
                              child: Icon(Icons.add, size: 14.sp, color: AppColors.themeColor),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ],
              ),
              Expanded(
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
                        softWrap: true,
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
                        Spacing.width(5),
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
                        // CommonText(
                        //   text: service['discount'] as String,
                        //   fontSize: AppFontSizes.fontNenoSmall,
                        //   fontWeight: AppFontWeights.bold,
                        //   color: AppColors.lightGreen,
                        //   maxLines: 1,
                        //   overflow: TextOverflow.ellipsis,
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}