import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yes_madam/controller/elite/elite_membership_controller.dart';
import 'package:yes_madam/routes/app_routes.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_dimensions.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/widgets/common/common_text.dart';
import 'package:yes_madam/widgets/components/spacing_widget.dart';

class EliteFaqsScreen extends GetView<EliteMembershipController> {
  const EliteFaqsScreen({super.key});

  // Full FAQ list for the dedicated FAQs screen
  List<Map<String, dynamic>> get allFaqs => [
    {
      'question': 'What is YesMadam Elite membership?',
      'answer':
          'YesMadam Elite membership is a premium subscription that gives you 10% off on all bookings, 1000 YMCoins, and exclusive benefits.',
    },
    {
      'question': 'What is YMCoins?',
      'answer':
          'YMCoins is YesMadam\'s loyalty currency. 1 YMCoin = ₹1. You get 1000 YMCoins on Elite purchase.',
    },
    {
      'question': 'Is there a limit to maximum discount per booking?',
      'answer': 'Yes, maximum discount limit per transaction is ₹100.',
    },
    {
      'question':
          'What if my membership ends but the YMCoins balance is still left?',
      'answer':
          'If your membership expires, the remaining YMCoins balance will also expire.',
    },
    {
      'question': 'What is the tenure of the plan?',
      'answer':
          'The Elite membership is valid for 6 months from the date of purchase.',
    },
    {
      'question':
          'Is there a limit on the number of devices I can use Elite membership on?',
      'answer':
          'No, you can use your Elite membership on any device as long as you are logged in with the same account.',
    },
    {
      'question': 'Can I cancel, pause or transfer my membership?',
      'answer':
          'No, the Elite membership cannot be cancelled, paused, or transferred once purchased.',
    },
    {
      'question': 'Is there a minimum value booking to redeem YMCoins?',
      'answer': 'Yes, the minimum booking value to redeem YMCoins is ₹200.',
    },
    {
      'question': 'Can I pay for my membership in cash?',
      'answer':
          'No, Elite membership can only be purchased through digital payment methods.',
    },
    {
      'question':
          'What if I cancel my order with which I purchased Elite membership?',
      'answer':
          'If you cancel the order, the Elite membership benefits will be revoked and a refund will be processed as per the refund policy.',
    },
    {
      'question': 'Not applicable for the instant services',
      'answer':
          'The Elite membership discount is not applicable for instant/on-demand services.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    // final expandedList = List<bool>.filled(allFaqs.length, false).obs;
    if (controller.expandedList.length != allFaqs.length) {
      controller.initializeFaqs(allFaqs.length);
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: CommonText(
          text: 'YM Elite FAQs',
          fontSize: AppFontSizes.fontXMedium,
          fontWeight: AppFontWeights.semiBold,
          color: AppColors.blackColor,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppDimensions.paddingMedium.w),
        child: Column(
          children: [
            // FAQs Container
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  AppDimensions.radiusMedium.r,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child:  ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: allFaqs.length,
                separatorBuilder: (_, __) =>
                    Divider(height: 1, color: Colors.grey.shade200),
                  itemBuilder: (_, index) {
                    return Obx(
                          () => _buildFaqTile(
                        question: allFaqs[index]['question'],
                        answer: allFaqs[index]['answer'],
                        isExpanded: controller.expandedList[index],
                        onTap: () {
                          controller.toggleFaq(index);
                        },
                      ),
                    );
                  }
              ),
            ),

            Spacing.height(16),
            _buildTermsRow(),

            Spacing.height(24),
          ],
        ),
      ),
    );
  }

  Widget _buildFaqTile({
    required String question,
    required String answer,
    required bool isExpanded,
    required void Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CommonText(
                    text: question,
                    fontSize: AppFontSizes.fontMedium,
                    fontWeight: AppFontWeights.normal,
                    color: AppColors.blackColor,
                    softWrap: true,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Spacing.width(8),
                Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: AppColors.blackColor,
                  size: 20.r,
                ),
              ],
            ),
            if (isExpanded) ...[
              Spacing.height(10),
              CommonText(
                text: answer,
                fontSize: AppFontSizes.fontSmall,
                fontWeight: AppFontWeights.medium,
                color: AppColors.greyColor,
                softWrap: true,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildTermsRow() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.termsConditions);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppDimensions.radiusMedium.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonText(
              text: 'Terms and Conditions',
              fontSize: AppFontSizes.fontMedium,
              fontWeight: AppFontWeights.semiBold,
              color: AppColors.blackColor,
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16.r,
              color: AppColors.blackColor,
            ),
          ],
        ),
      ),
    );
  }
}
