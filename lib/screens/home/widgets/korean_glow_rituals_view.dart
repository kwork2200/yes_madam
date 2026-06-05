import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yes_madam/controller/home/home_controller.dart';
import 'package:yes_madam/model/ritual_model.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_dimensions.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/utils/app_texts.dart';
import 'package:yes_madam/widgets/common/common_button.dart';
import 'package:yes_madam/widgets/common/common_text.dart';
import 'package:yes_madam/widgets/components/spacing_widget.dart';

class HomeKoreanGlowRitualsView extends GetView<HomeController> {
  const HomeKoreanGlowRitualsView({super.key});

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
            text: AppTexts.koreanGlowRituals,
            fontSize: AppFontSizes.fontXMedium,
            fontWeight: AppFontWeights.semiBold,
            color: AppColors.black,
          ),
        ),
        Spacing.height(12),
        SizedBox(
          height: 200.h,
          child: Obx(() {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.paddingMedium.w,
              ),
              itemCount: controller.rituals.length,
              itemBuilder: (context, index) {
                final item = controller.rituals[index];

                return Padding(
                  padding: EdgeInsets.only(right: 12.w),
                  child: RitualCard(model: item,index: index),
                );
              },
            );
          }),
        ),
        Spacing.height(30),
      ],
    );
  }
}

class RitualCard extends GetView<HomeController> {
  final RitualModel model;
  final int index;


  const RitualCard({super.key, required this.model, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.w,
      decoration: BoxDecoration(
        color: AppColors.orangeAccent,
        borderRadius: BorderRadius.circular(AppDimensions.radiusLarge.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Container(
            decoration: BoxDecoration(
                color: AppColors.grey200,
                image: DecorationImage(image: NetworkImage(model.image),fit: BoxFit.cover)
            ),
          )),
          Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFFFC08A),
                  Color(0xFFFF9A4D),
                  AppColors.orangeAccent,
                  AppColors.orangeAccent,
                ],
              ),
            ),
            child: Column(
              children: [
                Spacing.height(2),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal:AppDimensions.paddingMedium.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CommonText(
                          text: model.title,
                          fontSize: AppFontSizes.fontSmall,
                          fontWeight: AppFontWeights.bold,
                          color: AppColors.whiteColor,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Obx(() {
                        final count = controller.ritualCounts[index];

                        if (count == 0) {
                          return CommonButton(
                            text: AppTexts.add,
                            onPressed: () {
                              Get.find<HomeController>().incrementRitual(index);
                            },
                            height: 28.h,
                            backgroundColor: AppColors.whiteColor,
                            textColor: AppColors.themeColor,
                            borderColor: AppColors.themeColor,
                            fontSize: AppFontSizes.fontSmall,
                            fontWeight: AppFontWeights.bold,
                          );
                        }

                        return Container(
                          height: 28.h,
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            border: Border.all(color: AppColors.themeColor),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.find<HomeController>().decrementRitual(index);
                                },
                                child: Icon(
                                  Icons.remove,
                                  size: 18.sp,
                                  color: AppColors.themeColor,
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: CommonText(
                                  text: count.toString(),
                                  fontSize: AppFontSizes.fontMedium,
                                  fontWeight: AppFontWeights.bold,
                                  color: AppColors.themeColor,
                                ),
                              ),

                              GestureDetector(
                                onTap: () {
                                  Get.find<HomeController>().incrementRitual(index);
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
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal:AppDimensions.paddingMedium.w),
                  child: Row(
                    children: [
                      CommonText(
                        text: model.price,
                        fontSize: AppFontSizes.fontMedium,
                        fontWeight: AppFontWeights.bold,
                        color: AppColors.whiteColor,
                      ),
                      Spacing.width(8),
                      CommonText(
                        text: model.mrp,
                        fontSize: AppFontSizes.fontSmall,
                        color: AppColors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                      SizedBox(
                        height: 15.h,
                        child: VerticalDivider(
                          color: AppColors.whiteColor,
                          thickness: 1,
                          width: 20.w,
                        ),
                      ),
                      Icon(
                        Icons.access_time,
                        size: AppDimensions.iconSmall,
                        color: AppColors.whiteColor,
                      ),
                      Spacing.width(4),
                      CommonText(
                        text: model.duration,
                        fontSize: AppFontSizes.fontNenoSmall,
                        color: AppColors.whiteColor,
                      ),
                    ],
                  ),
                ),
                Spacing.height(10),
              ],
            ),
          )

        ],
      ),
    );
  }
}
