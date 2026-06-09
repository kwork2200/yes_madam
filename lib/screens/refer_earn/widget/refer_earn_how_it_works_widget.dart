import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_dimensions.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/widgets/common/common_text.dart';
import 'package:yes_madam/widgets/components/spacing_widget.dart';

class ReferEarnHowItWorksWidget extends StatelessWidget {
  const ReferEarnHowItWorksWidget({super.key});

  static const _steps = [
    {
      'text':
      'You will earn coins based on your referral count after your friend avails their first booking.',
    },
    {
      'text':
      'Your friend will earn 125 coins when they use your referral code while signing up.',
    },
    {
      'text':
      'Your referral coins will add up & you can redeem them as discount on services.',
    },
    {
      'text':
      'Get free services after completing referral milestones.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingMedium.w,
        vertical: AppDimensions.paddingMedium.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitleWithDivider(title: 'How it Works'),
          Spacing.height(16),

          Container(
            padding: EdgeInsets.all(22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.r),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFF5359bb).withOpacity(0.85),
                  const Color(0xFF6A5FD6).withOpacity(0.55),
                ],
              ),
            ),
            child: Column(
              children: [
                ...List.generate(
                  _steps.length,
                      (index) => _StepItem(
                    stepText: _steps[index]['text']!,
                    isLast: index == _steps.length - 1,
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

class _StepItem extends StatelessWidget {
  final String stepText;
  final bool isLast;

  const _StepItem({
    required this.stepText,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 44.w,
                height: 44.w,
                decoration: const BoxDecoration(
                  color: Color(0xFFEEECFF),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.person_rounded,
                  color: Color(0xFF6A5FD6),
                  size: AppDimensions.iconMedium,
                ),
              ),
              Spacing.width(12),
              Expanded(
                child: CommonText(
                  text: stepText,
                  fontSize: AppFontSizes.fontMedium,
                  fontWeight: AppFontWeights.normal,
                  color: AppColors.whiteColor,
                  textHeight: 1.4,
                  softWrap: true,
                ),
              ),
            ],
          ),
        ),

        if (!isLast)
          Divider(
            color: Colors.white.withOpacity(0.6),
            height: 1,
            thickness: 1,
          ),

        Spacing.height(16),
      ],
    );
  }
}

class SectionTitleWithDivider extends StatelessWidget {
  final String title;

  const SectionTitleWithDivider({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Divider(color: Colors.grey.shade300, thickness: 1),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Container(
                  width: 6.w,
                  height: 6.w,
                  decoration: const BoxDecoration(
                    color: AppColors.whiteColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: CommonText(
            text: title,
            fontSize: AppFontSizes.fontXMedium,
            fontWeight: AppFontWeights.extraBold,
            color: AppColors.whiteColor,
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Container(
                  width: 6.w,
                  height: 6.w,
                  decoration: const BoxDecoration(
                    color: AppColors.whiteColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Expanded(
                child: Divider(color: Colors.grey.shade300, thickness: 1),
              ),
            ],
          ),
        ),
      ],
    );
  }
}