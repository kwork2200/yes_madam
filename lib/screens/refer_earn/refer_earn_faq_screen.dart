import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yes_madam/controller/refer_earn/refer_earn_controller.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_dimensions.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/widgets/common/common_text.dart';
import 'package:yes_madam/widgets/components/spacing_widget.dart';

class ReferEarnFaqScreen extends GetView<ReferEarnController> {
  const ReferEarnFaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F0F5),
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back_rounded,
            color: AppColors.blackColor,
            size: AppDimensions.iconMedium,
          ),
        ),
        title: CommonText(
          text: 'Referral FAQs',
          fontSize: AppFontSizes.fontXMedium,
          fontWeight: AppFontWeights.semiBold,
          color: AppColors.blackColor,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppDimensions.paddingMedium.r),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(25.r),
                ),
                child: Column(
                  children: [
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                        vertical: 14.h,
                        horizontal: 16.w,
                      ),
                      itemCount: controller.faqs.length,
                      separatorBuilder: (_, __) =>
                          Divider(color: AppColors.grey200, height: 20.h),
                      itemBuilder: (context, index) {
                        final faq = controller.faqs[index];

                        return Obx(() {
                          final isExpanded =
                              controller.expandedFaqs[index] ?? false;

                          return GestureDetector(
                            onTap: () => controller.toggleFaq(index),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: CommonText(
                                        text: faq['question']!,
                                        fontSize: AppFontSizes.fontMedium,
                                        fontWeight: AppFontWeights.normal,
                                        color: AppColors.blackColor,
                                        textHeight: 1.4,
                                        softWrap: true,
                                      ),
                                    ),
                                    Spacing.width(8),
                                    Icon(
                                      isExpanded
                                          ? Icons.keyboard_arrow_up_rounded
                                          : Icons.keyboard_arrow_down_rounded,
                                      color: AppColors.greyColor,
                                      size: AppDimensions.iconMedium,
                                    ),
                                  ],
                                ),

                                if (isExpanded) ...[
                                  Spacing.height(8),
                                  CommonText(
                                    text: faq['answer']!,
                                    fontSize: AppFontSizes.fontSmall,
                                    fontWeight: AppFontWeights.normal,
                                    color: AppColors.greyColor,
                                    textHeight: 1.5,
                                  ),
                                ],
                              ],
                            ),
                          );
                        });
                      },
                    ),
                  ],
                ),
              ),
              Spacing.height(200),
            ],
          ),
        ),
      ),
    );
  }
}
