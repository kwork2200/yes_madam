import 'package:yes_madam/controller/home/home_controller.dart';
import 'package:yes_madam/screens/home/widgets/experience_korean_widget.dart';
import 'package:yes_madam/screens/home/widgets/home_best_sellers_widget.dart';
import 'package:yes_madam/screens/home/widgets/home_banner_widget.dart';
import 'package:yes_madam/screens/home/widgets/home_create_package_widget.dart';
import 'package:yes_madam/screens/home/widgets/home_explore_categories_widget.dart';
import 'package:yes_madam/screens/home/widgets/home_footer_widget.dart';
import 'package:yes_madam/screens/home/widgets/home_korean_wax_ritual_banner.dart';
import 'package:yes_madam/screens/home/widgets/home_live_cities_widget.dart';
import 'package:yes_madam/screens/home/widgets/home_most_booked_widget.dart';
import 'package:yes_madam/screens/home/widgets/home_only_for_you_widget.dart';
import 'package:yes_madam/screens/home/widgets/home_refer_beautician_banner.dart';
import 'package:yes_madam/screens/home/widgets/home_stories_from_best_widget.dart';
import 'package:yes_madam/screens/home/widgets/home_stripless_korean_wax_banner.dart';
import 'package:yes_madam/screens/home/widgets/korean_glow_rituals_view.dart';
import 'package:yes_madam/screens/home/widgets/salon_best_women_widget.dart';
import 'package:yes_madam/screens/home/widgets/trending_near_you_widget.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeBannerWidget(),
            HomeOnlyForYouWidget(),
            HomeExploreCategoriesWidget(),
            HomeMostBookedWidget(),
            HomeCreatePackageWidget(),
            HomeExperienceKoreanWidget(),
            HomeKoreanGlowRitualsView(),
            HomeTrendingNearYouWidget(),
            HomeSalonBestWomenWidget(),
            HomeBestSellersWidget(),
            HomeKoreanWaxRitualBanner(),
            HomeStoriesFromBestWidget(),
            HomeStriplessKoreanWaxBanner(),
            HomeReferBeauticianBanner(),
            HomeLiveCitiesWidget(),
            HomeFooterWidget(),
          ],
        ),
      ),
    );
  }
}
