import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yes_madam/screens/help/help_topic_detail_screen.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_font_weights.dart';
import '../../utils/app_font_sizes.dart';
import '../../utils/app_dimensions.dart';
import '../../widgets/common/common_text.dart';
import '../../widgets/common/common_app_bar.dart';

class EliteMembershipHelpScreen extends StatelessWidget {
  const EliteMembershipHelpScreen({super.key});

  static const List<Map<String, String>> _faqs = [
    {
      'question': 'What Is Elite Membership?',
      'answer':
      'Elite Membership is a premium subscription that gives you exclusive benefits including discounts on every booking, priority service, and much more.',
    },
    {
      'question': 'How Can I Buy Elite Membership?',
      'answer':
      'Here\'s how you can buy Elite membership:\n\n'
          '1. Click on \'Buy Elite\' on homepage and place your order.\n'
          '2. While booking a service, add Elite membership to cart during checkout and place your order.',
    },
    {
      'question': 'What Is The Maximum Discount That I Can Avail Per Booking?',
      'answer':
      'You can avail 10% discount (max upto ₹100) on every booking.',
    },
    {
      'question':
      'Is There A Limit To The Number Of Bookings Per Month While Availing Elite Benefits?',
      'answer':
      'No, there is no limit to the number of bookings per month while availing Elite benefits.',
    },
    {
      'question': 'Can I Pay For Elite Membership In Cash?',
      'answer':
      'No, Elite Membership can only be purchased through online payment methods.',
    },
    {
      'question':
      'Is There A Limit To The Number Of Devices I Can Use Elite Membership On?',
      'answer':
      'Your Elite Membership is linked to your account, so you can use it on multiple devices as long as you are logged in with the same account.',
    },
    {
      'question': 'Can I Cancel, Pause Or Transfer My Membership?',
      'answer':
      'You can cancel your Elite Membership at any time. However, pausing or transferring the membership is not currently supported.',
    },
    {
      'question':
      'What If I Cancel My Order With Which I Purchased Elite Membership?',
      'answer':
      'If you cancel the order through which you purchased Elite Membership, the membership will also be cancelled and a refund will be processed as per our refund policy.',
    },
  ];

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
      body: Padding(
        padding: EdgeInsets.all(AppDimensions.spacingLarge.w),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(AppDimensions.radiusMedium.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                  AppDimensions.paddingMedium.w,
                  AppDimensions.paddingMedium.h,
                  AppDimensions.paddingMedium.w,
                  AppDimensions.spacingMedium.h,
                ),
                child: CommonText(
                  text: 'Elite Membership',
                  fontSize: AppFontSizes.fontXMedium,
                  fontWeight: AppFontWeights.bold,
                  color: AppColors.darkColor,
                ),
              ),
              ..._faqs.asMap().entries.map((entry) {
                final isLast = entry.key == _faqs.length - 1;
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