import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yes_madam/controller/service_listing/service_listing_controller.dart';
import 'package:yes_madam/screens/home/widgets/home_create_package_widget.dart';
import 'package:yes_madam/screens/service_listing/widget/service_listing_banner_widget.dart';
import 'package:yes_madam/screens/service_listing/widget/service_listing_category_tabs_widget.dart';
import 'package:yes_madam/screens/service_listing/widget/service_listing_app_bar_widget.dart';
import 'package:yes_madam/screens/service_listing/widget/service_listing_filter_chips_widget.dart';
import 'package:yes_madam/screens/service_listing/widget/service_listing_service_card_widget.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/widgets/common/common_text.dart';

class ServiceListingScreen extends GetView<ServiceListingController> {
  const ServiceListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.h),
        child: const ServiceListingAppBarWidget(),
      ),
      body: Column(
        children: [
           ServiceListingCategoryTabsWidget(),
          Expanded(
            child: Obx(() {
              final isOfferSelected = controller.isOfferSelected;

              return ListView(
                padding: EdgeInsets.only(bottom: 80.h),
                children: [
                  if (!isOfferSelected) ...[
                    const ServiceListingBannerWidget(),
                    const ServiceListingFilterChipsWidget(),

                    ...controller.services.map(
                          (service) => ServiceListingServiceCardWidget(
                        service: service,
                      ),
                    ),
                  ] else ...[
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 10.h,
                      ),
                      child: CommonText(
                        text: "Create Package",
                        fontSize: AppFontSizes.fontXMedium,
                        fontWeight: AppFontWeights.semiBold,
                        color: AppColors.black,
                      ),
                    ),

                    ...List.generate(
                      controller.packageList.length,
                          (index) => Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 8.h,
                        ),
                        child: CreatePackageCardWidget(
                          package: controller.packageList[index],
                          index: index,
                        ),
                      ),
                    ),
                  ],
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}