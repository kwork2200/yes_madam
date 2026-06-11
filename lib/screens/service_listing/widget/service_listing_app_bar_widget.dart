import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/widgets/common/common_text.dart';

class ServiceListingAppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  const ServiceListingAppBarWidget({super.key});

  @override
  Size get preferredSize => Size.fromHeight(220.h);

  @override
  State<ServiceListingAppBarWidget> createState() => _ServiceListingAppBarWidgetState();
}

class _ServiceListingAppBarWidgetState
    extends State<ServiceListingAppBarWidget> {
  late final PageController _pageController;
  int _currentPage = 0;
  Timer? _timer;

  final List<String> images = [
    "https://img.magnific.com/premium-psd/beauty-salon-banner-template_220346-5420.jpg?semt=ais_hybrid&w=740&q=80",
    "https://www.sokora.com/cdn/shop/files/sunscreen_banner_d_web_2_1517e9ad-9ff7-4c69-8654-414ee095accf.webp?v=1779194060&width=1500",
    "https://i.pinimg.com/736x/b8/ee/ed/b8eeed64f7af5d099945c89d0ab0b457.jpg",
    "https://www.sokora.com/cdn/shop/files/f_vgfbgh_de289854-ae55-478a-9f43-6994a020a260.webp?v=1779367086&width=1500",
    "https://m.media-amazon.com/images/S/al-eu-726f4d26-7fdb/93434e25-91fa-48d3-979b-ec0eebbab88e._CR0%2C0%2C0%2C0_SX1500_.png",
    "https://m.media-amazon.com/images/S/al-eu-726f4d26-7fdb/34c4181b-f75b-48ee-b3a4-4c3a8f6e7c8f._CR0%2C0%2C1500%2C558_SX1500_.png",
    "https://m.media-amazon.com/images/S/aplus-media-library-service-media/1bd0d70a-d0d9-4120-b7d9-7903ba3b19b9.__CR0,0,970,300_PT0_SX970_V1___.jpg",
    "https://www.shutterstock.com/image-vector/beauty-makeup-banner-template-cosmetic-260nw-1909107493.jpg",
    "https://www.beautyglad.com/_next/image?url=https%3A%2F%2Fbeauty-glad-s3-bucket.s3.ap-south-1.amazonaws.com%2Fservices%2F1774333319129-428432937.jpg&w=3840&q=75",
  ];

  @override
  void initState() {
    super.initState();

    _pageController = PageController();

    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        int nextPage = _currentPage + 1;

        if (nextPage >= images.length) {
          nextPage = 0;
        }

        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: widget.preferredSize,
      child: Stack(
        children: [
          SizedBox(
            height: 220.h,
            width: double.infinity,
            child: PageView.builder(
              controller: _pageController,
              itemCount: images.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (_, index) {
                return Image.network(
                  images[index],
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return const SizedBox();
                  },
                );
              },
            ),
          ),
          Container(
            height: 220.h,
            color: Colors.black.withOpacity(0.25),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: Get.back,
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 20.sp,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.w),
                      child: CommonText(
                        text: 'Beauty - Salon At Home',
                        fontSize: AppFontSizes.fontXMedium,
                        fontWeight: AppFontWeights.semiBold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 6.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(25.r),
                      border: Border.all(color: Colors.white),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          size: 18.sp,
                          color: Colors.white,
                        ),
                        SizedBox(width: 4.w),
                        CommonText(
                          text: 'Search',
                          color: Colors.white,
                          fontSize: AppFontSizes.fontSmall,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Icon(
                    Icons.share_outlined,
                    color: Colors.white,
                    size: 22.sp,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 15.h,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                images.length,
                    (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 3.w),
                  height: 6.h,
                  width: _currentPage == index ? 18.w : 6.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: _currentPage == index
                        ? Colors.white
                        : Colors.white54,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}