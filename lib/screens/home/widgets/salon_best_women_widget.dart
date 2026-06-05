import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_dimensions.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/utils/app_texts.dart';
import 'package:yes_madam/widgets/common/common_text.dart';
import 'package:yes_madam/widgets/components/spacing_widget.dart';

class HomeSalonBestWomenWidget extends StatelessWidget {
  const HomeSalonBestWomenWidget({super.key});

  static final List<Map<String, dynamic>> _salonCategories = [
    {
      'label': 'Waxing',
      'color': const Color(0xFFFFF7F2),
      'image':
          'https://spinsalon.in/wp-content/uploads/2025/10/BlogSpinsalon_The-Ultimate-Guide-to-Face-Waxing-for-Women-Benefits-Process-Aftercare.jpg',
    },
    {
      'label': 'Clean-Up',
      'color': const Color(0xFFFFF7F2),
      'image':
          'https://images.unsplash.com/photo-1515377905703-c4788e51af15?w=500',
    },
    {
      'label': 'Mani-Pedi',
      'color': const Color(0xFFFFF7F2),
      'image':
          'https://images.unsplash.com/photo-1519014816548-bf5fe059798b?w=500',
    },
    {
      'label': 'Facial',
      'color': const Color(0xFFFFF7F2),
      'image':
          'https://images.unsplash.com/photo-1522335789203-aabd1fc54bc9?w=500',
    },
    {
      'label': 'Body Polishing',
      'color': const Color(0xFFF8B7BF),
      'image':
          'https://images.unsplash.com/photo-1600334089648-b0d9d3028eb2?w=500',
    },
    {
      'label': 'Bleach, Dtan\nScrub',
      'color': const Color(0xFFFFF7F2),
      'image':
          'https://images.unsplash.com/photo-1596462502278-27bfdc403348?w=500',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionHeader(
          title: AppTexts.salonAtHomeForWomen,
          actionLabel: AppTexts.seeAll,
          topPadding: AppDimensions.paddingXLarge40,
        ),
        _SalonCategoryGrid(items: _salonCategories),
        Spacing.height(16),

      ],
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final String actionLabel;
  final double topPadding;

  const _SectionHeader({
    required this.title,
    required this.actionLabel,
    required this.topPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppDimensions.paddingMedium.w,
        topPadding.h,
        AppDimensions.paddingMedium.w,
        AppDimensions.spacingLarge.h,
      ),
      child: Row(
        children: [
          Expanded(
            child: CommonText(
              text: title,
              fontSize: AppFontSizes.fontXMedium,
              fontWeight: AppFontWeights.semiBold,
              color: AppColors.black,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Spacing.width(AppDimensions.spacingMedium),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CommonText(
                text: actionLabel,
                fontSize: AppFontSizes.fontSmall,
                fontWeight: AppFontWeights.extraBold,
                color: AppColors.themeColor,
              ),
              Spacing.width(AppDimensions.spacingSmall),
              Container(
                width: 22.w,
                height: 22.w,
                decoration: const BoxDecoration(
                  color: AppColors.themeColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_forward,
                  color: AppColors.whiteColor,
                  size: 14.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SalonCategoryGrid extends StatelessWidget {
  final List<Map<String, dynamic>> items;

  const _SalonCategoryGrid({required this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.paddingMedium.w,
        ),
        itemCount: items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: AppDimensions.spacingLarge.h,
          mainAxisSpacing: AppDimensions.spacingLarge.w,
          childAspectRatio: 0.95,
        ),
        itemBuilder: (_, index) {
          final item = items[index];

          return _SalonCategoryCard(item: item);
        },
      ),
    );
  }
}

class _SalonCategoryCard extends StatelessWidget {
  final Map<String, dynamic> item;

  const _SalonCategoryCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: item['color'] as Color,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium.r),
        border: Border.all(color: AppColors.grey200),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            top: 28.h,
            child: Image.network(
              item['image'] as String,
              fit: BoxFit.cover,
              alignment: Alignment.bottomCenter,
            ),
          ),
          Positioned(
            left: 10.w,
            top: 6.h,
            right: 8.w,
            child: CommonText(
              text: item['label'] as String,
              fontSize: AppFontSizes.fontNenoSmall,
              fontWeight: AppFontWeights.medium,
              color: AppColors.blackColor,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
