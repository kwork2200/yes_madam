import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_font_weights.dart';
import '../../utils/app_font_sizes.dart';
import '../../utils/app_dimensions.dart';
import '../../widgets/common/common_text.dart';
import '../../widgets/common/common_app_bar.dart';
import 'help_topic_detail_screen.dart';

/// Generic reusable screen for any help topic's FAQ list.
/// Pass [topicTitle] and [faqs] from HelpTopicsData.allTopics.
class HelpTopicListScreen extends StatelessWidget {
  final String topicTitle;
  final List<Map<String, String>> faqs;

  const HelpTopicListScreen({
    super.key,
    required this.topicTitle,
    required this.faqs,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundGrey,
      appBar: CommonAppBar(
        title: CommonText(
          text: 'Help And Support',
          fontSize: AppFontSizes.fontXMedium,
          fontWeight: AppFontWeights.bold,
          color: AppColors.darkColor,
        ),
        showBackButton: true,
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppDimensions.spacingLarge.w),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(AppDimensions.radiusMedium.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                  AppDimensions.paddingMedium.w,
                  AppDimensions.paddingMedium.h,
                  AppDimensions.paddingMedium.w,
                  AppDimensions.spacingMedium.h,
                ),
                child: CommonText(
                  text: topicTitle,
                  fontSize: AppFontSizes.fontXMedium,
                  fontWeight: AppFontWeights.bold,
                  color: AppColors.darkColor,
                ),
              ),
              ...faqs.asMap().entries.map((entry) {
                final isLast = entry.key == faqs.length - 1;
                final faq = entry.value;
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => HelpTopicDetailScreen(
                              question: faq['question']!,
                              answer: faq['answer']!,
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppDimensions.paddingMedium.w,
                          vertical: AppFontSizes.fontMedium.h,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: CommonText(
                                text: faq['question']!,
                                fontSize: AppFontSizes.fontMedium,
                                color: AppColors.darkColor,
                                maxLines: 3,
                              ),
                            ),
                            SizedBox(width: AppDimensions.spacingSmall.w),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: AppFontSizes.fontMedium.sp,
                              color: AppColors.greyColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (!isLast)
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppDimensions.paddingMedium.w),
                        child: Divider(height: 1, color: AppColors.grey200),
                      ),
                  ],
                );
              }),
              SizedBox(height: AppDimensions.spacingMedium.h),
            ],
          ),
        ),
      ),
    );
  }
}