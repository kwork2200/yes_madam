import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yes_madam/controller/home/home_controller.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_dimensions.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/utils/app_texts.dart';
import 'package:yes_madam/widgets/components/gradient_text.dart';
import 'package:yes_madam/widgets/components/spacing_widget.dart';

class HomeExperienceKoreanWidget extends GetView<HomeController> {

  const HomeExperienceKoreanWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.h),
      padding: EdgeInsets.symmetric(horizontal:AppDimensions.paddingMedium.w ,vertical:AppDimensions.paddingLarge.h),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            'https://img.freepik.com/premium-photo/lavender-skincare-products-pastel-background_729045-74.jpg',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShaderMask(
            shaderCallback: (bounds) {
              return const LinearGradient(
                colors: [
                  Color(0xFF6A1B9A),
                  Color(0xFF8E24AA),
                  Color(0xFFAB47BC),
                ],
              ).createShader(bounds);
            },
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: AppTexts.experienceKoreanCare.substring(
                      0,
                      (AppTexts.experienceKoreanCare.length * 0.45).toInt(),
                    ),
                    style: TextStyle(
                      fontSize: AppFontSizes.fontLarge,
                      fontWeight: FontWeight.w900, // bold
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text: AppTexts.experienceKoreanCare.substring(
                      (AppTexts.experienceKoreanCare.length * 0.45).toInt(),
                      (AppTexts.experienceKoreanCare.length * 0.75).toInt(),
                    ),
                    style: TextStyle(
                      fontSize: AppFontSizes.fontLarge,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text: AppTexts.experienceKoreanCare.substring(
                      (AppTexts.experienceKoreanCare.length * 0.75).toInt(),
                    ),
                    style: TextStyle(
                      fontSize: AppFontSizes.fontLarge,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Spacing.height(AppDimensions.spacingLarge),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                controller.koreanCards.length,
                    (index) {
                  final item = controller.koreanCards[index];

                  return Padding(padding: EdgeInsets.only(right: AppDimensions.spacingXLarge.w),
                    child: SizedBox(
                      width: 160.w,
                      child: KoreanCardWidget(title: item["title"], image: item["image"]),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}


class KoreanCardWidget extends StatelessWidget {
  final String title;
  final String image;

  const KoreanCardWidget({
    super.key,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimensions.radiusLarge.r),
          color: AppColors.grey200,
        image: DecorationImage(image: NetworkImage(image),fit: BoxFit.cover)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          GradientText(
            text: AppTexts.korean,
            fontSize: AppFontSizes.fontXLarge36,
            fontWeight: AppFontWeights.extraBold,
          ),
          GradientText(
            text: title,
            fontSize: AppFontSizes.fontMedium,
            fontWeight: AppFontWeights.bold,
            maxLines: 2,
          ),
          Spacing.height(15)
        ],
      ),
    );
  }
}