import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/widgets/common/common_text.dart';

class ServiceListingBannerWidget extends StatefulWidget {
  const ServiceListingBannerWidget({super.key});

  @override
  State<ServiceListingBannerWidget> createState() => _ServiceListingBannerWidgetState();
}

class _ServiceListingBannerWidgetState
    extends State<ServiceListingBannerWidget> {
  late final PageController _pageController;

  int _currentPage = 0;
  Timer? _timer;

  final List<String> bannerImages = [
    "https://content3.jdmagicbox.com/v2/comp/noida/c8/011pxx11.xx11.250220191716.u2c8/catalogue/yesmadam-noida-beauty-parlours-gyqqlgbidc.jpg",
    "https://content3.jdmagicbox.com/v2/comp/delhi/f8/011pxx11.xx11.230304061228.a2f8/catalogue/yes-madam-salon-at-home-rohini-sector-37-delhi-beauty-parlours-ipj5m0ew45.jpg",
    "https://content3.jdmagicbox.com/v2/comp/bangalore/b2/080pxx80.xx80.230610024458.b6b2/catalogue/yes-madam-salon-bangalore-beauty-parlours-6y7324seu7.jpg",
    "https://res.cloudinary.com/purnesh/image/upload/w_1080,f_auto/new-project-2020-11-04t154223%2C775.jpg",
  ];

  @override
  void initState() {
    super.initState();

    _pageController = PageController();

    _timer = Timer.periodic(
      const Duration(seconds: 3),
          (timer) {
        if (!_pageController.hasClients) return;

        int nextPage = _currentPage + 1;

        if (nextPage >= bannerImages.length) {
          nextPage = 0;
        }

        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

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

          Container(
            height: 180.h,
            width: double.infinity,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Stack(
              children: [
                PageView.builder(
                  controller: _pageController,
                  itemCount: bannerImages.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Image.network(
                      bannerImages[index],
                      fit: BoxFit.cover,
                    );
                  },
                ),
                Positioned(
                  bottom: 0.h,
                  left: 0.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 6.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.r),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
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
                Positioned(
                  bottom: 16.h,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      bannerImages.length,
                          (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: EdgeInsets.symmetric(horizontal: 3.w),
                        height: 6.h,
                        width: _currentPage == index ? 18.w : 6.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: _currentPage == index
                              ? AppColors.whiteColor
                              : Colors.white.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}