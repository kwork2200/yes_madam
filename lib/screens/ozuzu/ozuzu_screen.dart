import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_texts.dart';
import '../../utils/app_font_weights.dart';

class OzuzuScreen extends StatelessWidget {
  const OzuzuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.circle_outlined, size: 60.sp, color: AppColors.greyColor),
            SizedBox(height: 12.h),
            Text(AppTexts.ozuzu, style: TextStyle(fontSize: AppFontSizes.fontLarge, fontWeight: AppFontWeights.semiBold, color: AppColors.greyColor)),
            SizedBox(height: 6.h),
            Text(AppTexts.comingSoon, style: TextStyle(fontSize: AppFontSizes.fontSmall, color: AppColors.greyColor)),
          ],
        ),
      ),
    );
  }
}
