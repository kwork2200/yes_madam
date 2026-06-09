import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/widgets/common/common_text.dart';

class ServiceListingBannerWidget extends StatelessWidget {
  const ServiceListingBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: 'Top Selling',
            fontSize: AppFontSizes.fontLarge,
            fontWeight: AppFontWeights.bold,
            color: AppColors.blackColor,
          ),
          SizedBox(height: 8.h),
          SizedBox(
            height: 180.h,
            child: ListView.builder(
              scrollDirection:
                  Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  width: 320.w,
                  margin: EdgeInsets.only(right: 12.w),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Image.network(
                            "https://swissbeauty.in/cdn/shop/files/S4_324c4d5b-4b16-40ec-9d3c-0e0ee8133a02.jpg?v=1770984536&width=620",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 0.h,
                          left: 0.w,
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(16.r),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(6.0.r),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.access_time,
                                    size: 12.sp,
                                    color: AppColors.themeColor,
                                  ),
                                  SizedBox(width: 4.w),
                                  CommonText(
                                    text: '1 hr 15 mins',
                                    fontSize: AppFontSizes.fontNenoSmall,
                                    fontWeight: AppFontWeights.normal,
                                    color: AppColors.blackColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
