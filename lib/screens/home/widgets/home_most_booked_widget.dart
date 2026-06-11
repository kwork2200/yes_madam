import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:yes_madam/controller/home/home_controller.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_dimensions.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/utils/app_images.dart';
import 'package:yes_madam/utils/app_texts.dart';
import 'package:yes_madam/widgets/common/common_button.dart';
import 'package:yes_madam/widgets/common/common_text.dart';
import 'package:yes_madam/widgets/components/spacing_widget.dart';

class HomeMostBookedWidget extends GetView<HomeController> {
  const HomeMostBookedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(14.r),
      child: Container(
        padding: EdgeInsets.all(AppDimensions.paddingMedium.w),
        decoration: BoxDecoration(
          color: AppColors.bgCream,
          borderRadius: BorderRadius.circular(AppDimensions.radiusMedium.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: AppTexts.mostBooked,
                        fontSize: AppFontSizes.fontXMedium,
                        fontWeight: AppFontWeights.semiBold,
                        color: AppColors.black,
                      ),
                      CommonText(
                        text: AppTexts.inYourArea,
                        fontSize: AppFontSizes.fontSmall,
                        fontWeight: AppFontWeights.semiBold,
                        color: AppColors.grey,
                      ),
                    ],
                  ),
                ),

                Container(
                  width: 26.w,
                  height: 26.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF4CAF50),
                        Color(0xFF2196F3),
                        Color(0xFFFF9800),
                      ],
                    ),
                  ),
                  child: Lottie.asset(AppImages.locationLottie),
                ),
              ],
            ),
            Spacing.height(AppDimensions.spacingLarge),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.paddingMedium.w,
                vertical: 4.h,
              ),
              decoration: BoxDecoration(
                color: AppColors.themeColor,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: CommonText(
                text: AppTexts.salonForWomen,
                fontSize: AppFontSizes.fontSmall,
                fontWeight: AppFontWeights.medium,
                color: AppColors.whiteColor,
              ),
            ),
            Spacing.height(AppDimensions.spacingLarge),
            SizedBox(
              // height: 240.h,
              height: MediaQuery.of(context).size.height * 0.32,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.mostBooked.length,
                itemBuilder: (_, index) {
                  return MostBookedServiceCard(
                    item: controller.mostBooked[index],
                    index: index,
                    counts: controller.mostBookedCounts,
                    onAdd: controller.incrementMostBooked,
                    onMinus: controller.decrementMostBooked,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MostBookedServiceCard extends StatelessWidget {
  final Map<String, dynamic> item;
  final int index;
  final RxList<int> counts;
  final Function(int) onAdd;
  final Function(int) onMinus;

  const MostBookedServiceCard({
    super.key,
    required this.item,
    required this.index,
    required this.counts,
    required this.onAdd,
    required this.onMinus,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.w,
      margin: EdgeInsets.only(right: 4.w),
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
                    borderRadius: BorderRadius.circular(
                      AppDimensions.radiusMedium.r,
                    ),
                    image: DecorationImage(
                      image: NetworkImage("${item['image']}"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              if ((item['badge'] as String).isNotEmpty)
                Positioned(
                  top: 0.h,
                  left: 0.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 3.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.grey,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10.r),
                        topLeft: Radius.circular(10.r),
                      ),
                    ),
                    child: CommonText(
                      text: item['badge'],
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
                      text: item['title'],
                      fontSize: AppFontSizes.fontSmall,
                      fontWeight: AppFontWeights.medium,
                      color: AppColors.black,
                      maxLines: 2,
                    ),
                  ),
                  Spacing.height(AppDimensions.spacingSmall),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 11.sp,
                        color: AppColors.greyColor,
                      ),
                      Spacing.width(3),
                      CommonText(
                        text: item['duration'],
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
                        text: item['price'],
                        fontSize: AppFontSizes.fontNenoSmall,
                        fontWeight: AppFontWeights.bold,
                        color: AppColors.black,
                      ),
                      Spacing.width(3),
                      CommonText(
                        text: "${item['mrp']} |",
                        fontSize: AppFontSizes.fontNenoSmall,
                        color: AppColors.greyColor,
                        fontWeight: AppFontWeights.bold,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: AppColors.greyColor,
                      ),
                      Spacing.width(4),
                      CommonText(
                        text: '${item['discount']}',
                        fontSize: AppFontSizes.fontNenoSmall,
                        fontWeight: AppFontWeights.bold,
                        color: AppColors.lightGreen,
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
                      return CommonButton(
                        text: AppTexts.addToCart,
                        onPressed: () => onAdd(index),
                        height: 24.h,
                        backgroundColor: AppColors.whiteColor,
                        borderColor: AppColors.themeColor,
                        textColor: AppColors.themeColor,
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
                            child: Icon(
                              Icons.remove,
                              size: 16.sp,
                              color: AppColors.themeColor,
                            ),
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
                            child: Icon(
                              Icons.add,
                              size: 16.sp,
                              color: AppColors.themeColor,
                            ),
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
    );
  }
}
