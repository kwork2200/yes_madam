import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:yes_madam/controller/refer_earn/refer_earn_controller.dart';
import 'package:yes_madam/screens/refer_earn/widget/refer_earn_bottom_bar.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_dimensions.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/utils/app_images.dart';
import 'package:yes_madam/widgets/common/common_text.dart';
import 'package:yes_madam/widgets/components/spacing_widget.dart';

class ReferEarnJourneyScreen extends GetView<ReferEarnController> {
  const ReferEarnJourneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF868ce6),
                        Color(0xFF5a63e0),
                        Color(0xFF6c73e2),
                        Color(0xFF6e75e0),
                        Color(0xFF1e2cce),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),

                Positioned.fill(
                  child: Lottie.asset(
                    AppImages.skyLottie,
                    fit: BoxFit.cover,
                    repeat: true,
                    animate: true,
                  ),
                ),

                SafeArea(
                  bottom: false,
                  child: Obx(() => SingleChildScrollView(
                    reverse: true,
                    padding: EdgeInsets.symmetric(
                      horizontal: AppDimensions.paddingXLarge.w,
                      vertical: AppDimensions.paddingXLarge.h,
                    ),
                    child: _MilestonePath(
                      milestones: controller.milestones,
                      completedCount: controller.referralCount.value,
                    ),
                  )),
                ),
                Positioned(
                  top: MediaQuery.of(context).padding.top + AppDimensions.spacingMedium,
                  left: AppDimensions.paddingMedium.w,
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      padding: EdgeInsets.all(AppDimensions.spacingLarge.r),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.black,
                        size: AppDimensions.iconSmall.r,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const ReferEarnBottomBar(),
        ],
      ),
    );
  }
}

class _MilestonePath extends StatelessWidget {
  final List<Map<String, dynamic>> milestones;
  final int completedCount;

  const _MilestonePath({
    required this.milestones,
    required this.completedCount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: List.generate(milestones.length, (index) {
        final reversedIndex = milestones.length - 1 - index;
        final milestone = milestones[reversedIndex];
        final isCompleted = completedCount > reversedIndex;

        final isLeftAligned = reversedIndex % 2 == 1;

        return Column(
          children: [
            Align(
              alignment: isLeftAligned ? Alignment.centerLeft : Alignment.centerRight,
              child: _MilestoneJourneyCard(
                coins: milestone['coins'],
                label: milestone['label'],
                isCompleted: isCompleted,
              ),
            ),
            if (index != milestones.length - 1)
              _DottedConnector(isLeftToRight: isLeftAligned),
          ],
        );
      }),
    );
  }
}

class _MilestoneJourneyCard extends StatelessWidget {
  final int coins;
  final String label;
  final bool isCompleted;

  const _MilestoneJourneyCard({
    required this.coins,
    required this.label,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        // Image jaisa outer glass/translucent layer padding decoration
        Container(
          padding: EdgeInsets.all(12.r),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: Container(
            width: 110.w,
            height: 100.h,
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: const Color(0xFFE2E4F9), // Image se matched dynamic card light background
              borderRadius: BorderRadius.circular(18.r),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Coin Style Custom Circle icon matching reference image
                    Container(
                      width: 20.w,
                      height: 20.w,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [Colors.orange, AppColors.coinOrange],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: CommonText(
                        text: 'R',
                        fontSize: AppFontSizes.fontNenoSmall,
                        fontWeight: AppFontWeights.bold,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    Spacing.width(6),
                    CommonText(
                      text: '$coins',
                      fontSize: AppFontSizes.fontLarge,
                      fontWeight: AppFontWeights.bold,
                      color: Colors.black,
                    ),
                  ],
                ),
                Spacing.height(4),
                CommonText(
                  text: label,
                  fontSize: AppFontSizes.fontNenoSmall,
                  fontWeight: AppFontWeights.medium,
                  color: Colors.grey.shade600,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: -4.h,
          child: Container(
            width: 28.w,
            height: 28.w,
            decoration: BoxDecoration(
              color: isCompleted ? const Color(0xFFB4B9F3) : Colors.white.withOpacity(0.8),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFFE2E4F9),
                width: 3,
              ),
            ),
            child: Icon(
              Icons.check_rounded,
              size: 14.sp,
              color: isCompleted ? Colors.white : Colors.grey.shade400,
            ),
          ),
        ),
      ],
    );
  }
}

class _DottedConnector extends StatelessWidget {
  final bool isLeftToRight;

  const _DottedConnector({required this.isLeftToRight});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70.h,
      margin: EdgeInsets.symmetric(horizontal: 40.w),
      child: CustomPaint(
        painter: _DottedCurvePainter(isLeftToRight: isLeftToRight),
      ),
    );
  }
}

class _DottedCurvePainter extends CustomPainter {
  final bool isLeftToRight;

  _DottedCurvePainter({required this.isLeftToRight});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.50) // Image se balanced lighter white line color
      ..strokeWidth = 5 // Thicker square blocks like design image
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square;

    final path = Path();

    if (isLeftToRight) {
      path.moveTo(0, 0);
      path.quadraticBezierTo(
        size.width * 0.1, size.height * 0.9,
        size.width, size.height,
      );
    } else {
      path.moveTo(size.width, 0);
      path.quadraticBezierTo(
        size.width * 0.9, size.height * 0.9,
        0, size.height,
      );
    }

    const double dashWidth = 7.0;
    const double dashSpace = 7.0;

    final pathMetrics = path.computeMetrics();
    for (final metric in pathMetrics) {
      double distance = 0.0;
      while (distance < metric.length) {
        final extractedPath = metric.extractPath(distance, distance + dashWidth);
        canvas.drawPath(extractedPath, paint);
        distance += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DottedCurvePainter oldDelegate) => false;
}