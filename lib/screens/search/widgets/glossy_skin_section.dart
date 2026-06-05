import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yes_madam/model/benefit_item_model.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/widgets/common/common_text.dart';
import 'package:yes_madam/widgets/components/spacing_widget.dart';

class GlossySkinSection extends StatelessWidget {
  final String title;
  final List<BenefitItem> benefits;

  const GlossySkinSection({
    super.key,
    required this.title,
    required this.benefits,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(18.w, 20.h, 18.w, 80.h),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFFFE3F0), AppColors.whiteColor],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: title,
            fontSize: AppFontSizes.fontXLarge32,
            fontWeight: AppFontWeights.black,
            color: AppColors.themeColor,
            textHeight: 1.2,
            softWrap: true,
          ),
          Spacing.height(20),
          ...benefits.map((item) => BenefitText(title: item.title, body: item.body),
          ),
        ],
      ),
    );
  }
}

class BenefitText extends StatelessWidget {
  final String title;
  final String body;

  const BenefitText({
    super.key,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 26.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: '• $title',
            fontSize: AppFontSizes.fontMedium,
            fontWeight: AppFontWeights.extraBold,
            color: AppColors.themeColor,
          ),
          CommonText(
            text: body,
            fontSize: AppFontSizes.fontMedium,
            fontWeight: AppFontWeights.normal,
            color: AppColors.themeColor,
            softWrap: true,
          ),
        ],
      ),
    );
  }
}