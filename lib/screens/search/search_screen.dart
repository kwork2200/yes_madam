import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yes_madam/controller/search/search_controller.dart' as search;
import 'package:yes_madam/screens/search/widgets/search_header_widget.dart';
import 'package:yes_madam/screens/search/widgets/search_landing_widget.dart';
import 'package:yes_madam/screens/search/widgets/search_service_card.dart';
import 'package:yes_madam/screens/search/widgets/service_detail_view.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_dimensions.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/widgets/common/common_text.dart';
import 'package:yes_madam/widgets/components/spacing_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final TextEditingController _textController;
  final search.SearchController controller = Get.put(search.SearchController());

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: controller.query.value);
    ever<String>(controller.query, (value) {
      if (_textController.text == value) return;
      _textController
        ..text = value
        ..selection = TextSelection.collapsed(offset: value.length);
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final selected = controller.selectedService.value;

      return Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: SafeArea(
          top: false,
          child: selected == null
              ? Column(
                  children: [
                    SearchHeaderWidget(
                      controller: _textController,
                      query: controller.query.value,
                      onBack: () => Navigator.pop(context),
                      onChanged: controller.setQuery,
                      onClear: controller.clearQuery,
                    ),
                    Expanded(
                      child: controller.query.value.trim().isEmpty
                          ? _SearchLanding(controller: controller)
                          : _SearchResults(controller: controller),
                    ),
                  ],
                )
              : ServiceDetailView(
                  service: selected,
                  index: controller.indexOfService(selected),
                  counts: controller.serviceCounts,
                  onAdd: controller.incrementService,
                  onMinus: controller.decrementService,
                  onClose: controller.closeService,
                ),
        ),
      );
    });
  }
}

class _SearchLanding extends StatelessWidget {
  final search.SearchController controller;

  const _SearchLanding({required this.controller});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: AppDimensions.paddingLarge.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: CommonText(
              text: "Recent Searches",
              fontSize: AppFontSizes.fontXMedium + 2.sp,
              fontWeight: AppFontWeights.semiBold,
              color: AppColors.black,
            ),
          ),
          Spacing.height(AppDimensions.spacingXLarge),
          SizedBox(
            height: 35.h,
            child: ListView.separated(
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              itemCount: controller.recentSearches.length,
              separatorBuilder: (_, __) => SizedBox(width: 10.w),
              itemBuilder: (_, index) {
                final item = controller.recentSearches[index];
                return RecentChipCard(
                  item: item,
                  onTap: () => controller.setQuery(item['title']!),
                );
              },
            ),
          ),
          Spacing.height(36),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: CommonText(
              text: "Popular Picks",
              fontSize: AppFontSizes.fontXMedium + 2.sp,
              fontWeight: AppFontWeights.semiBold,
              color: AppColors.black,
            ),
          ),
          Spacing.height(AppDimensions.spacingXLarge),
          SizedBox(
            height: 260.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              itemCount: controller.popularPicks.length,
              itemBuilder: (_, index) {
                final service = controller.popularPicks[index];
                return SearchServiceCard(
                  service: service,
                  index: controller.indexOfService(service),
                  width: 150.w,
                  counts: controller.serviceCounts,
                  onAdd: controller.incrementService,
                  onMinus: controller.decrementService,
                  onTap: () => controller.openService(service),
                );
              },
            ),
          ),
          Spacing.height(34),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: CommonText(
              text: "Trending searches near you",
              fontSize: AppFontSizes.fontXMedium + 2.sp,
              fontWeight: AppFontWeights.semiBold,
              color: AppColors.black,
            ),
          ),
          Spacing.height(AppDimensions.spacingXLarge),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Wrap(
              spacing: 12.w,
              runSpacing: 14.h,
              children: controller.trendingSearches.map((title) {
                return TrendingChipCard(
                  title: title,
                  onTap: () => controller.setQuery(title),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchResults extends StatelessWidget {
  final search.SearchController controller;

  const _SearchResults({required this.controller});

  @override
  Widget build(BuildContext context) {
    final results = controller.filteredServices;

    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(18.w, 28.h, 18.w, 30.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: 'Top results for "${controller.query.value}"',
            fontSize: AppFontSizes.fontXMedium,
            fontWeight: AppFontWeights.bold,
            color: AppColors.blackColor,
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: results.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 235.h,
              mainAxisSpacing: 24.h,
              crossAxisSpacing: 10.w,
            ),
            itemBuilder: (_, index) {
              final service = results[index];
              return SearchServiceCard(
                service: service,
                index: controller.indexOfService(service),
                counts: controller.serviceCounts,
                onAdd: controller.incrementService,
                onMinus: controller.decrementService,
                onTap: () => controller.openService(service),
              );
            },
          ),
        ],
      ),
    );
  }
}
