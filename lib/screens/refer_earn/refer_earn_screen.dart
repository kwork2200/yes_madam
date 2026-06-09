import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yes_madam/controller/refer_earn/refer_earn_controller.dart';
import 'package:yes_madam/screens/refer_earn/widget/refer_earn_bottom_bar.dart';
import 'package:yes_madam/screens/refer_earn/widget/refer_earn_free_service_widget.dart';
import 'package:yes_madam/screens/refer_earn/widget/refer_earn_hero_widget.dart';
import 'package:yes_madam/screens/refer_earn/widget/refer_earn_how_it_works_widget.dart';
import 'package:yes_madam/screens/refer_earn/widget/refer_earn_milestones_widget.dart';
import 'package:yes_madam/screens/refer_earn/widget/refer_earn_nav_tiles_widget.dart';
import 'package:yes_madam/screens/refer_earn/widget/refer_earn_view_rewards_widget.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_dimensions.dart';
import 'package:yes_madam/widgets/components/spacing_widget.dart';

class ReferEarnScreen extends GetView<ReferEarnController> {
  const ReferEarnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFbcbff2),
              Color(0xFF8389e3),
              Color(0xFF6970df),
              Color(0xFF7a80e3),
              Color(0xFF5457d6),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                     ReferEarnHeroWidget(),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppDimensions.paddingXMedium.w,
                      ),
                      child: const ReferEarnMilestonesWidget(),
                    ),
                    const ReferEarnViewRewardsWidget(),
                    const ReferEarnHowItWorksWidget(),
                    Spacing.height(8),
                    const ReferEarnFreeServiceWidget(),
                    Spacing.height(8),
                    const ReferEarnNavTilesWidget(),
                    Spacing.height(100),
                  ],
                ),
              ),
            ),
            const ReferEarnBottomBar(),
          ],
        ),
      ),
    );
  }
}