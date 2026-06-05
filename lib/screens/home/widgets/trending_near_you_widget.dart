import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yes_madam/controller/home/home_controller.dart';
import 'package:yes_madam/screens/home/widgets/home_most_booked_widget.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_dimensions.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/utils/app_texts.dart';
import 'package:yes_madam/widgets/common/common_horizontal_tabs.dart';
import 'package:yes_madam/widgets/common/common_text.dart';
import 'package:yes_madam/widgets/components/spacing_widget.dart';

class HomeTrendingNearYouWidget extends GetView<HomeController> {
  const HomeTrendingNearYouWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(
            AppDimensions.paddingMedium.w,
            AppDimensions.paddingSmall.h,
            AppDimensions.paddingMedium.w,
            AppDimensions.spacingLarge.h,
          ),
          child: CommonText(
            text: AppTexts.trendingNearYou,
            fontSize: AppFontSizes.fontXMedium,
            fontWeight: AppFontWeights.semiBold,
            color: AppColors.black,
          ),
        ),
        Obx(
          () => CommonHorizontalTabs(
            tabs: controller.trendingTabs,
            selectedIndex: controller.trendingTab.value,
            onTap: (i) => controller.trendingTab.value = i,
          ),
        ),
        Spacing.height(AppDimensions.spacingLarge),
        SizedBox(
          height: 230.h,
          child: Obx(() {
            final services = controller.selectedTrendingServices;
            final counts = controller.selectedTrendingCounts;

            return ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.paddingMedium.w,
              ),
              itemCount: services.length,
              itemBuilder: (_, i) {
                final item = services[i];

                return MostBookedServiceCard(
                  item: {...item, "image": item["image"] ?? ""},
                  index: i,
                  counts: counts,
                  onAdd: controller.incrementTrending,
                  onMinus: controller.decrementTrending,
                );
              },
            );
          }),
        ),
      ],
    );
  }
}
