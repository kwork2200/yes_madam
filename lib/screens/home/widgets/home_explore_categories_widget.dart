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

class HomeExploreCategoriesWidget extends GetView<HomeController> {
  const HomeExploreCategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(
            AppDimensions.paddingMedium.w, 20.h,
            AppDimensions.paddingMedium.w, 12.h,
          ),
          child: CommonText(
            text: AppTexts.exploreOurCategories,
            fontSize: AppFontSizes.fontXMedium,
            fontWeight: AppFontWeights.semiBold,
            color: AppColors.black,
          ),
        ),
        SizedBox(
          height: 120.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(
              horizontal: AppDimensions.paddingMedium.w,
            ),
            itemCount: controller.categories.length,
            itemBuilder: (_, index) {
              final category = controller.categories[index];

              return Container(
                width: 70.w,
                margin: EdgeInsets.only(
                  right: AppDimensions.spacingLarge.w,
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: category['color'] as Color,
                          ),
                          child: Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(14.r),
                              child: Image.network(
                                category['image'],
                                fit: BoxFit.cover,
                                height: 70.h,
                                width: 110.w,
                              ),
                            ),
                          ),
                        ),

                        if (category['isNew'] == true)
                          Positioned(
                            top: 1.h,
                            right: 1.w,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 6.w,
                                vertical: 2.h,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.maroonRed,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10.r),
                                  topRight: Radius.circular(10.r),
                                ),
                              ),
                              child: CommonText(
                                text: AppTexts.newText,
                                fontSize:
                                AppFontSizes.fontNenoSmall,
                                color: AppColors.whiteColor,
                                fontWeight:
                                AppFontWeights.medium,
                              ),
                            ),
                          ),
                      ],
                    ),
                    Spacing.height(
                      AppDimensions.spacingSmall,
                    ),
                    CommonText(
                      text: category['label'],
                      fontSize: AppFontSizes.fontNenoSmall,
                      fontWeight: AppFontWeights.semiBold,
                      color: AppColors.black,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      maxLines: 2,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}