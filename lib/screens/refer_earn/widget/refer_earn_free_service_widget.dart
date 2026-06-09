import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yes_madam/screens/refer_earn/widget/refer_earn_how_it_works_widget.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_dimensions.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/widgets/common/common_text.dart';
import 'package:yes_madam/widgets/components/spacing_widget.dart';

class ReferEarnFreeServiceWidget extends StatelessWidget {
  const ReferEarnFreeServiceWidget({super.key});

  static const _bullets = [
    'Unlock free service on reaching the milestone referral level (5th, 10th or 15th).',
    'Apply given coupon code while checking out.',
    'Coupon code will only be applicable on referrer\'s account.',
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
          SectionTitleWithDivider(title: 'How to Avail Free Service?'),
          Spacing.height(16),
          Container(
            width: double.infinity,
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
              children: _bullets
                  .asMap()
                  .entries
                  .map(
                    (entry) => _BulletItem(
                  text: entry.value,
                  isLast: entry.key == _bullets.length - 1,
                ),
              )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

}

class _BulletItem extends StatelessWidget {
  final String text;
  final bool isLast;

  const _BulletItem({
    required this.text,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 14.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 6.w,
                height: 6.w,
                margin: EdgeInsets.only(top: 6.h, right: 10.w),
                decoration: const BoxDecoration(
                  color: AppColors.whiteColor,
                  shape: BoxShape.circle,
                ),
              ),
              Expanded(
                child: CommonText(
                  text: text,
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
      ],
    );
  }
}