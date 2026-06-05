import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yes_madam/model/help_topics_data.dart';
import 'package:yes_madam/screens/help/help_topic_list_screen.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_font_weights.dart';
import '../../utils/app_font_sizes.dart';
import '../../utils/app_dimensions.dart';
import '../../widgets/common/common_text.dart';
import '../../widgets/common/common_app_bar.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  static const List<String> _topics = [
    'Elite Membership',
    'My Bookings',
    'How To Make Booking',
    'Multisession',
    'About The Payment',
    'Service Details',
    'Product Information / Product Details',
    'Know About Service Professionals',
    'Coupons & Offers',
    'Customer Care',
    'Communications & Notifications',
    'Cancellation & Refund Policy',
  ];

  void _onTopicTap(BuildContext context, String topic) {
    final faqs = HelpTopicsData.allTopics[topic];
    if (faqs != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => HelpTopicListScreen(
            topicTitle: topic,
            faqs: faqs,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundGrey,
      appBar: CommonAppBar(
        title: CommonText(
          text: 'Help & Support',
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
                  text: 'Browse topics',
                  fontSize: AppFontSizes.fontXMedium,
                  fontWeight: AppFontWeights.bold,
                  color: AppColors.darkColor,
                ),
              ),
              ..._topics.asMap().entries.map((entry) {
                final isLast = entry.key == _topics.length - 1;
                return Column(
                  children: [
                    InkWell(
                      onTap: () => _onTopicTap(context, entry.value),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppDimensions.paddingMedium.w,
                          vertical: AppFontSizes.fontMedium.h,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.person_outline,
                              size: AppFontSizes.fontLarge.sp,
                              color: AppColors.black54,
                            ),
                            SizedBox(width: AppDimensions.spacingLarge.w),
                            Expanded(
                              child: CommonText(
                                text: entry.value,
                                fontSize: AppFontSizes.fontMedium,
                                color: AppColors.darkColor,
                              ),
                            ),
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