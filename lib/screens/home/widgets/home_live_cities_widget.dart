import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_dimensions.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/utils/app_texts.dart';
import 'package:yes_madam/widgets/common/common_text.dart';
import 'package:yes_madam/widgets/components/spacing_widget.dart';

class HomeLiveCitiesWidget extends StatelessWidget {
  const HomeLiveCitiesWidget({super.key});

  static const List<Map<String, String>> _regions = [
    {
      'title': 'NORTH',
      'cities':
          'Agra | Aligarh | Amritsar | Bareilly | Chandigarh | Delhi\nFaridabad | Ghaziabad | Greater Noida | Gurugram | Haldwani | Haridwar\nJammu | Jhansi | Kanpur | Lucknow | Ludhiana | Meerut | Moradabad\nNoida | Panchkula | Roorkee | Rudrapur | Srinagar | Zirakpur',
    },
    {
      'title': 'SOUTH',
      'cities':
          'Bangalore | Chennai\nHyderabad | Mysore\nVijayawada | Tirupati',
    },
    {
      'title': 'CENTRAL',
      'cities':
          'Bhopal | Bilaspur | Gwalior | Indore\nJabalpur | Nagpur | Prayagraj\nRaipur | Ujjain | Varanasi',
    },
    {
      'title': 'EAST',
      'cities':
          'Bhagalpur | Bhubhaneshwar\nCuttack | Guwahati | Kolkata\nPatna | Rourkela | Siliguri',
    },
    {
      'title': 'WEST',
      'cities':
          'Ahmedabad | Gandhi Nagar\nMumbai | Pune\nPimpri-Chinchwad | Surat',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      padding: EdgeInsets.fromLTRB(
        0,
        0,
        0,
        AppDimensions.spacingSmall.h,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 118.h,
            child: Icon(
              Icons.map_outlined,
              size: 280.sp,
              color: AppColors.grey300.withValues(alpha: 0.38),
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                   Expanded(child: _TricolorLine()),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppDimensions.spacingMedium.w,
                    ),
                    child: CommonText(
                      text: AppTexts.purelyBhartiyaBrand,
                      fontSize: AppFontSizes.fontNenoSmall,
                      fontWeight: AppFontWeights.medium,
                      color: AppColors.blackColor,
                    ),
                  ),
                   Expanded(child: _TricolorLine()),
                ],
              ),
              Spacing.height(AppDimensions.spacingLarge),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: AppFontSizes.fontSmall,
                    fontWeight: AppFontWeights.normal,
                  ),
                  children: [
                    const TextSpan(text: AppTexts.weAreLiveIn),
                    TextSpan(
                      text: "${AppTexts.cities55Plus} ${AppTexts.citiesUppercase}",
                      style: TextStyle(
                        color: AppColors.themeColor,
                        fontWeight: AppFontWeights.originalBold,
                      ),
                    ),
                  ],
                ),
              ),
              Spacing.height(AppDimensions.spacingXXLarge),
              _RegionBlock(region: _regions[0], centered: true),
              Spacing.height(50),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _RegionBlock(region: _regions[1])),
                  Expanded(child: _RegionBlock(region: _regions[2])),
                ],
              ),
              Spacing.height(AppDimensions.spacingXXLarge),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _RegionBlock(region: _regions[3])),
                  Expanded(child: _RegionBlock(region: _regions[4])),
                ],
              ),
              Spacing.height(AppDimensions.spacingMedium),
              CommonText(
                text: AppTexts.comingSoonStar,
                fontSize: AppFontSizes.fontNenoSmall,
                fontWeight: AppFontWeights.medium,
                color: AppColors.greyColor,
                fontStyle: FontStyle.italic,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _RegionBlock extends StatelessWidget {
  final Map<String, String> region;
  final bool centered;

  const _RegionBlock({required this.region, this.centered = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.location_on,
              color: AppColors.themeColor,
              size: AppDimensions.iconSmall.sp,
            ),
            Flexible(
              child: CommonText(
                text: region['title']!,
                fontSize: AppFontSizes.fontSmall,
                fontWeight: AppFontWeights.extraBold,
                color: AppColors.blackColor,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        Spacing.height(AppDimensions.spacingSmall),
        CommonText(
          text: region['cities']!,
          fontSize:AppFontSizes.fontNenoSmall -1.sp,
          fontWeight: AppFontWeights.medium,
          color: AppColors.blackColor,
          textAlign: TextAlign.center,
          textHeight: 1.60,
          softWrap: true,
        ),
      ],
    );
  }
}

class _TricolorLine extends StatelessWidget {
  const _TricolorLine();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(height: 3.h, color: const Color(0xFFFFA000)),
        SizedBox(height: 2.h),
        Container(height: 3.h, color: const Color(0xFF43A047)),
      ],
    );
  }
}
