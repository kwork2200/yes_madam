import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/widgets/common/common_text.dart';

class RecentBookingsBadge extends StatelessWidget {
  final String text;
  final int avatarCount;
  final Color startColor;
  final Color middleColor;
  final Color middle2Color;
  final Color endColor;

  const RecentBookingsBadge({
    super.key,
    required this.text,
    this.avatarCount = 3,
    this.startColor = const Color(0xFFffd1b3),
    this.middleColor = const Color(0xFFffd1b3),
    this.middle2Color = const Color(0xFFffeedd),
    this.endColor = const Color(0xFFFFFFFF),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        gradient: LinearGradient(
          colors: [
            startColor,
            middleColor,
            middle2Color,
            endColor,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 40.w,
            height: 18.h,
            child: Stack(
              children: List.generate(
                avatarCount,
                    (i) => Positioned(
                  left: (i * 10).toDouble(),
                  child: CircleAvatar(
                    radius: 9.r,
                    backgroundColor: Colors.orange.shade300,
                    child: Icon(
                      Icons.person,
                      size: 10.sp,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 4.w),
          CommonText(
            text: text,
            fontSize: AppFontSizes.fontNenoSmall,
            fontWeight: AppFontWeights.medium,
            color: AppColors.blackColor,
          ),
        ],
      ),
    );
  }
}