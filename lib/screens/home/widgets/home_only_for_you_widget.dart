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

class HomeOnlyForYouWidget extends GetView<HomeController> {
  const HomeOnlyForYouWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingMedium.w,
        vertical: AppDimensions.paddingSmall.h,
      ),
      decoration: BoxDecoration(color: AppColors.eliteBg
      ),
      child: Row(
        children: [
          CommonText(
            text: AppTexts.elite,
            fontSize: AppFontSizes.fontLarge,
            fontWeight: AppFontWeights.black,
            color: AppColors.gold,
          ),

          Spacing.width(AppDimensions.spacingLarge),

          Obx(() {
            final item =
            controller.eliteMessages[controller.eliteTextIndex.value];

            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (child, animation) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 0.5),
                    end: Offset.zero,
                  ).animate(animation),
                  child: FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                );
              },
              child: RichText(
                key: ValueKey(controller.eliteTextIndex.value),
                text: TextSpan(
                  style: TextStyle(
                    fontSize: AppFontSizes.fontMedium,
                  ),
                  children: [
                    const TextSpan(
                      text: "Get ",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: item["highlight"]!,
                      style: TextStyle(
                        color: AppColors.gold,
                        fontWeight: AppFontWeights.bold,
                      ),
                    ),
                    TextSpan(
                      text: item["message"]!,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
          const Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            color: AppColors.whiteColor,
            size: AppFontSizes.fontNenoSmall + 4.sp,
          ),
        ],
      ),
    );
  }
}