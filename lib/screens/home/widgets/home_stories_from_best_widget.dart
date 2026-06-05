import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_dimensions.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/utils/app_texts.dart';
import 'package:yes_madam/widgets/common/common_text.dart';

class HomeStoriesFromBestWidget extends StatelessWidget {
  const HomeStoriesFromBestWidget({super.key});

  static const List<Map<String, String>> _stories = [
    {
      'name': 'DIVYANKA TRIPATHI',
      'subtitle': 'On our HydraGlo Services',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_CxclvAtjCZHa58iXheciaOvEZaAQQFfbaA&s',
    },
    {
      'name': 'EKTA KAPOOR',
      'subtitle': 'Trusts our Korean Glow Services',
      'image': 'https://www.mediainfoline.com/wp-content/uploads/2025/10/Yesmadam-Campaign__-Ekta-Kapoor.webp',
    },
    {
      'name': 'POOJA & CHAAVI',
      'subtitle': 'Beauty stories from Yes Madam',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9Hyx4GZXAQqpXOFAE3PiPXpJSnv53-8CYpg&s',
    },
    {
      'name': 'SHEFALI BAGGA',
      'subtitle': 'Beauty stories from Yes Madam',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTth1frrM9-MuF2M-Dqad1RAMGy1ECBC6mbYg&s',
    },
    {
      'name': 'SHARDHA KAPOOR',
      'subtitle': 'Beauty stories from Yes Madam',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHQnS-CPXG_basZlVBhwhPmvE2RW0HnybNRw&s',
    },
    {
      'name': 'ALIA BHATT',
      'subtitle': 'Loves our Organic Facial Care',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnyDSeUzxhqpe6bQWtu6PijubkOmYu4FGnlw&s',
    },
    {
      'name': 'DEEPIKA PADUKONE',
      'subtitle': 'Her secret to Radiant Skin',
      'image': 'https://assets.odishabytes.com/wp-content/uploads/2025/08/deepika-padukone.jpeg',
    },
    {
      'name': 'KATRINA KAIF',
      'subtitle': 'Flawless Pre-Makeup Glow Routine',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbHRgpTBuKbV6GB7Fps3zleqATuw5TqStHuQ&s',
    },
    {
      'name': 'KIARA ADVANI',
      'subtitle': 'Bridal Glow Therapy Witness',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/1/19/Kiara_Advani_walks_for_Shyamal-Bhumika_at_India_Couture_Week_2018_Day_4_%2803%29.jpg',
    },
    {
      'name': 'RASHMIKA MANDANNA',
      'subtitle': 'Freshness secret with Hydra Facials',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUXIaKCHUCoW1JU9pRzWxUT-BiHWo0gBoymA&s',
    },
    {
      'name': 'JANHVI KAPOOR',
      'subtitle': 'Traditional Ayurvedic Detox Therapy',
      'image': 'https://theuseeshop.com/cdn/shop/files/Janhvi_Kapoor_Inspired_Soft_Kanchipuram_Tissue_Silk.jpg?v=1726742569&width=2048',
    },
    {
      'name': 'TAMANNAAH BHATIA',
      'subtitle': 'Milky White Skin Care Routine',
      'image': 'https://www.bollywoodhungama.com/wp-content/uploads/2025/10/Tamannaah-Bhatia-7.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(
            AppDimensions.paddingMedium.w,
            AppDimensions.spacingXXLarge.h,
            AppDimensions.paddingMedium.w,
            AppDimensions.spacingLarge.h,
          ),
          child: CommonText(
            text: AppTexts.storiesFromBest,
            fontSize: AppFontSizes.fontXMedium,
            fontWeight: AppFontWeights.semiBold,
            color: AppColors.black,
          ),
        ),
        SizedBox(
          height: 292.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(
              horizontal: AppDimensions.paddingMedium.w,
            ),
            itemCount: _stories.length,
            itemBuilder: (_, index) => _StoryCard(story: _stories[index]),
          ),
        ),
      ],
    );
  }
}

class _StoryCard extends StatelessWidget {
  final Map<String, String> story;

  const _StoryCard({required this.story});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.w,
      margin: EdgeInsets.only(right: AppDimensions.spacingXLarge.w),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.grey200,
        borderRadius: BorderRadius.circular(AppDimensions.radiusLarge.r),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(story['image']!, fit: BoxFit.cover),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.transparent,
                  Color(0x99000000),
                ],
              ),
            ),
          ),
          Positioned(
            left: 14.w,
            right: 14.w,
            bottom: 22.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CommonText(
                  text: story['name']!,
                  fontSize: AppFontSizes.fontXMedium,
                  fontWeight: AppFontWeights.extraBold,
                  color: AppColors.whiteColor,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                // Spacing.height(AppDimensions.spacingSmall),
                CommonText(
                  text: story['subtitle']!,
                  fontSize: AppFontSizes.fontNenoSmall,
                  fontWeight: AppFontWeights.bold,
                  color: AppColors.whiteColor,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
