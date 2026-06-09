import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yes_madam/controller/service_listing/service_listing_controller.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/widgets/common/common_text.dart';
import 'package:yes_madam/widgets/components/spacing_widget.dart';

class ServiceListingCategoryTabsWidget
    extends GetView<ServiceListingController> {
  ServiceListingCategoryTabsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 12.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Obx(
                      () => Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                          controller.categories.length + 1,
                          (index) {
                            if (index == 0) {
                              return _buildOfferCard();
                            } else {
                              return _buildCategoryItem(index - 1);
                            }
                          },
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

  Widget _buildCategoryItem(int index) {
    final isSelected = controller.selectedCategoryIndex.value == index;

    return GestureDetector(
      onTap: () => controller.selectCategory(index),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 16.w), // 👈 only image section padding
            child: Column(
              children: [
                Container(
                  width: 85.w,
                  height: 85.h,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.themeColor.withOpacity(0.1)
                        : const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(14.r),
                    border: isSelected
                        ? Border.all(color: AppColors.themeColor, width: 1.5)
                        : null,
                    image: DecorationImage(
                      image: NetworkImage(_getCategoryIcon(index)),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 6.h),
                SizedBox(
                  width: 85.w,
                  height: 34.h,
                  child: CommonText(
                    text: controller.categories[index],
                    fontSize: AppFontSizes.fontNenoSmall,
                    fontWeight: isSelected
                        ? AppFontWeights.semiBold
                        : AppFontWeights.normal,
                    color: isSelected
                        ? AppColors.themeColor
                        : AppColors.blackColor,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 14.h),
          Container(
            height: isSelected ? 3.h : 2.h,
            width: 85.w + 16.w,
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.themeColor
                  : Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOfferCard() {
    final isSelected = controller.selectedCategoryIndex.value == -1;

    return GestureDetector(
      onTap: () => controller.selectCategory(-1),
      child: SizedBox(
        width: 110.w,
        child: Column(
          children: [
            Container(
              width: 85.w,
              height: 85.h,
              decoration: BoxDecoration(
                color: AppColors.babyPink,
                borderRadius: BorderRadius.circular(14.r),
                border: isSelected
                    ? Border.all(color: AppColors.themeColor, width: 1.5)
                    : null,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonText(
                    text: 'EXTRA UPTO',
                    fontSize: AppFontSizes.fontNenoSmall - 3.sp,
                    fontWeight: AppFontWeights.bold,
                    color: AppColors.themeColor,
                    textAlign: TextAlign.center,
                  ),
                  Spacing.height(4),
                  CommonText(
                    text: '20%',
                    fontSize: AppFontSizes.fontXLarge26,
                    fontWeight: AppFontWeights.bold,
                    color: AppColors.themeColor,
                    textHeight: 0.6,
                  ),
                  CommonText(
                    text: 'OFF',
                    fontSize: AppFontSizes.fontXLarge26,
                    fontWeight: AppFontWeights.bold,
                    color: AppColors.themeColor,
                  ),
                ],
              ),
            ),
            SizedBox(height: 6.h),
            SizedBox(
              width: 85.w,
              height: 34.h,
              child: CommonText(
                text: "Make Your Package",
                fontSize: AppFontSizes.fontNenoSmall,
                fontWeight: AppFontWeights.normal,
                color: AppColors.blackColor,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: 14.h),
            Container(
              height: isSelected ? 3.h : 2.h,
              width: 110.w,
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.themeColor
                    : Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getCategoryIcon(int index) {
    const images = [
      "https://macebydrmace.com/wp-content/uploads/2024/10/koren-glow-facial-mace-davao.jpg",
      "https://www.kapilssalon.com/wp-content/uploads/2025/08/Salon-vs-At-Home-Waxing-Which-is-Safer-and-More-Effective-for-Indian-Skin.webp",
      "https://fuchsiaspa.com/wp-content/uploads/Facials_Spa-01.jpg",
      "https://www.bodycraft.co.in/hubfs/Imported_Blog_Media/side-view-woman-getting-massaged-spa-1-1.jpg",
      "https://www.spasolai.com/wp-content/uploads/2021/09/mani-pedi-img.jpg",
      "https://www.inurskn.in/wp-content/uploads/2023/11/Untitled-design-46-2.png",
      "https://weddingmakeups.in/wp-content/uploads/2023/03/De-Tan-Treatment.webp",
      "https://cdn.shopify.com/s/files/1/0591/6422/9806/files/Feather_Cut.jpg?v=1763448831",
    ];
    return index < images.length ? images[index] : "";
  }
}
