import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yes_madam/model/popular_service_model.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_dimensions.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/widgets/common/common_text.dart';
import 'package:yes_madam/widgets/components/spacing_widget.dart';

class PopularServicesSection extends StatelessWidget {
  final List<PopularServiceModel> popularServices;
  final List<PopularServiceModel> skincareServices;
  final RxInt selectedTabIndex;
  final Function(PopularServiceModel) onAddTap;
  final Function(PopularServiceModel)? onCardTap;

  const PopularServicesSection({
    super.key,
    required this.popularServices,
    required this.skincareServices,
    required this.selectedTabIndex,
    required this.onAddTap,
    this.onCardTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFd9d4ef),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(
                  () => Row(
                children: [
                  _ServiceTab(
                    label: 'Popular Services',
                    icon: Icons.shopping_cart_outlined,
                    isSelected: selectedTabIndex.value == 0,
                    onTap: () => selectedTabIndex.value = 0,
                  ),
                  _ServiceTab(
                    label: 'Skincare & More',
                    icon: Icons.face_retouching_natural_outlined,
                    isSelected: selectedTabIndex.value == 1,
                    onTap: () => selectedTabIndex.value = 1,
                  ),
                ],
              ),
            ),
            Obx(() {
              final services = selectedTabIndex.value == 0
                  ? popularServices
                  : skincareServices;

              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.31,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding:
                  EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  itemCount: services.length,
                  itemBuilder: (_, i) => _ServiceCard(
                    service: services[i],
                    onAddTap: () => onAddTap(services[i]),
                    onTap:
                    onCardTap != null ? () => onCardTap!(services[i]) : null,
                  ),
                ),
              );
            }),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  decoration: BoxDecoration(
                    color: AppColors.themeColor,
                    borderRadius:
                    BorderRadius.circular(AppDimensions.radiusSmall.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonText(
                        text: 'SEE ALL SERVICES',
                        fontSize: AppFontSizes.fontSmall,
                        fontWeight: AppFontWeights.bold,
                        color: AppColors.whiteColor,
                      ),
                      Spacing.width(6),
                      Icon(Icons.chevron_right,
                          color: AppColors.whiteColor, size: 16.sp),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ServiceTab extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _ServiceTab({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.whiteColor : Colors.transparent,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(12.r)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 20.sp,
                color: isSelected ? AppColors.black54 : AppColors.blackColor,
              ),
              Spacing.height(4),
              CommonText(
                text: label,
                fontSize: AppFontSizes.fontSmall,
                fontWeight: isSelected
                    ? AppFontWeights.medium
                    : AppFontWeights.extraBold,
                color:
                isSelected ? AppColors.black87 : AppColors.blackColor,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final PopularServiceModel service;
  final VoidCallback onAddTap;
  final VoidCallback? onTap;

  final RxInt _count = 0.obs;

  _ServiceCard({
    required this.service,
    required this.onAddTap,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 130.w,
        decoration: BoxDecoration(
          color: const Color(0xFFebe5f7),
          borderRadius: BorderRadius.circular(10.r),
        ),
        margin: EdgeInsets.only(right: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius:
                  BorderRadius.circular(AppDimensions.radiusMedium.r),
                  child: Container(
                    height: 120.h,
                    width: 130.w,
                    color: AppColors.lightGrey,
                    child: service.imageUrl.isNotEmpty
                        ? Image.network(
                      service.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) =>
                          Container(color: Colors.grey.shade200),
                    )
                        : Container(color: Colors.grey.shade200),
                  ),
                ),
                if (service.badge != null && service.badge!.isNotEmpty)
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 6.w, vertical: 3.h),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.65),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                              AppDimensions.radiusMedium.r),
                          bottomRight: Radius.circular(8.r),
                        ),
                      ),
                      child: CommonText(
                        text: service.badge!,
                        fontSize: AppFontSizes.fontNenoSmall,
                        fontWeight: AppFontWeights.semiBold,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                Positioned(
                  bottom: 8.h,
                  right: 8.w,
                  child: Obx(() {
                    if (_count.value == 0) {
                      return GestureDetector(
                        onTap: () {
                          _count.value++;
                          onAddTap();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(6.r),
                            border: Border.all(color: AppColors.themeColor),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: CommonText(
                            text: 'ADD',
                            fontSize: AppFontSizes.fontSmall,
                            fontWeight: AppFontWeights.bold,
                            color: AppColors.themeColor,
                          ),
                        ),
                      );
                    }
                    return Container(
                      height: 26.h,
                      padding: EdgeInsets.symmetric(horizontal: 6.w),
                      decoration: BoxDecoration(
                        color: AppColors.lightPink,
                        border: Border.all(color: AppColors.themeColor),
                        borderRadius: BorderRadius.circular(6.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (_count.value > 0) _count.value--;
                            },
                            child: Icon(Icons.remove,
                                size: 14.sp, color: AppColors.themeColor),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: CommonText(
                              text: '${_count.value}',
                              fontSize: AppFontSizes.fontSmall,
                              fontWeight: AppFontWeights.bold,
                              color: AppColors.themeColor,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => _count.value++,
                            child: Icon(Icons.add,
                                size: 14.sp, color: AppColors.themeColor),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.only(
                  left: 8.r, right: 8.r, bottom: 8.r, top: 6.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text: service.title,
                    fontSize: AppFontSizes.fontSmall,
                    fontWeight: AppFontWeights.medium,
                    color: AppColors.blackColor,
                    maxLines: 2,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Spacing.height(3),
                  Row(
                    children: [
                      Icon(Icons.access_time,
                          size: 10.sp, color: AppColors.greyColor),
                      Spacing.width(3),
                      CommonText(
                        text: service.duration,
                        fontSize: AppFontSizes.fontNenoSmall,
                        color: AppColors.greyColor,
                      ),
                    ],
                  ),
                  Spacing.height(3),
                  Row(
                    children: [
                      CommonText(
                        text: '₹${service.price}',
                        fontSize: AppFontSizes.fontSmall,
                        fontWeight: AppFontWeights.bold,
                        color: AppColors.blackColor,
                      ),
                      Spacing.width(4),
                      CommonText(
                        text: '₹${service.mrp}',
                        fontSize: AppFontSizes.fontNenoSmall,
                        color: AppColors.greyColor,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: AppColors.greyColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}