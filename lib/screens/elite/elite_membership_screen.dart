import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yes_madam/controller/elite/elite_membership_controller.dart';
import 'package:yes_madam/routes/app_routes.dart';
import 'package:yes_madam/screens/elite/widgets/elite_payment_bottom_sheet.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_dimensions.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/utils/app_texts.dart';
import 'package:yes_madam/widgets/common/common_text.dart';
import 'package:yes_madam/widgets/components/spacing_widget.dart';
import 'package:yes_madam/widgets/yes_madam_logo.dart';

class EliteMembershipScreen extends GetView<EliteMembershipController> {
  const EliteMembershipScreen({super.key});

  static const Color _darkBg = Color(0xFF1A1A1A);
  static const Color _cardBg = Color(0xFF2A2A2A);
  static const Color _gold = Color(0xFFE6A020);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _darkBg,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: _darkBg,
                elevation: 0,
                pinned: false,
                leading: GestureDetector(
                  onTap: () => Get.back(),
                  child: Container(
                    margin: EdgeInsets.all(14.r),
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.arrow_back,
                      color: AppColors.whiteColor,
                      size: AppDimensions.iconMedium.r,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildHeader(),
                      Spacing.height(8),

                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Benefits worth ',
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: AppFontSizes.fontMedium,
                                fontWeight: AppFontWeights.semiBold,
                              ),
                            ),
                            TextSpan(
                              text: '₹1000 ',
                              style: TextStyle(
                                color: _gold.withOpacity(0.7),
                                fontSize: AppFontSizes.fontMedium,
                                fontWeight: AppFontWeights.bold,
                              ),
                            ),
                            TextSpan(
                              text: 'in ₹249',
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: AppFontSizes.fontMedium,
                                fontWeight: AppFontWeights.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacing.height(4),
                      CommonText(
                        text: 'for 6 months',
                        fontSize: AppFontSizes.fontSmall,
                        fontWeight: AppFontWeights.normal,
                        color: Colors.white60,
                        textAlign: TextAlign.center,
                      ),
                      Spacing.height(45),
                      _buildSectionHeading('Elite Perks'),
                      Spacing.height(23),
                      _buildDiscountCard(),
                      Spacing.height(25),
                      _buildYMCoinsCard(),
                      Spacing.height(28),
                      _buildSectionHeading('Additional Benefits'),
                      Spacing.height(24),
                      _buildAdditionalBenefits(),
                      Spacing.height(20),
                      _buildMemberCountBanner(),
                      Spacing.height(40),
                      _buildSectionHeading('FAQs'),
                      Spacing.height(16),
                      _buildFaqsSection(),
                      Spacing.height(34),
                      _buildSectionHeading('Happy Elite Members'),
                      Spacing.height(34),
                      _buildTestimonials(),
                      Spacing.height(16),
                      _buildTermsRow(),
                      Spacing.height(100),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(bottom: 0, left: 0, right: 0, child: _buildBuyButton()),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        YesMadamLogo(width: 120.w),
        CommonText(
          text: AppTexts.elite,
          fontSize: AppFontSizes.fontXLarge36.sp,
          fontWeight: AppFontWeights.extraBold,
          color: _gold,
          textAlign: TextAlign.center,
        ),
        CommonText(
          text: AppTexts.membership,
          fontSize: AppFontSizes.fontXMedium,
          fontWeight: AppFontWeights.normal ,
          color: _gold,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildSectionHeading(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: AppDimensions.spacingSmall.h,
          width: AppDimensions.paddingXLarge40.w,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                _gold.withOpacity(0.0),
                _gold.withOpacity(0.6),
                _gold,
              ],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            children: [
              Icon(Icons.auto_awesome, size: 14.r, color: _gold),
              Spacing.width(6),
              CommonText(
                text: title,
                fontSize: AppFontSizes.fontXMedium,
                fontWeight: AppFontWeights.bold,
                color: _gold,
              ),
              Spacing.width(6),
              Icon(Icons.auto_awesome, size: 14.r, color: _gold),
            ],
          ),
        ),
        Container(
          height: AppDimensions.spacingSmall.h,
          width: AppDimensions.paddingXLarge40.w,

          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                _gold,
                _gold.withOpacity(0.6),
                _gold.withOpacity(0.0),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDiscountCard() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: _cardBg,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFD1B98D).withOpacity(0.25),
            offset: const Offset(-4, 0),
            blurRadius: 12,
            spreadRadius: 0,
          ),
          BoxShadow(
            color: const Color(0xFFD1B98D).withOpacity(0.25),
            offset: const Offset(4, 0),
            blurRadius: 12,
            spreadRadius: 0,
          ),
        ],
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage('https://png.pngtree.com/png-clipart/20230927/original/pngtree-man-avatar-image-for-profile-png-image_13001882.png'),fit: BoxFit.cover
                  ),
                ),
              ),
              Spacing.width(12),
              CommonText(
                text: AppTexts.elitePrefix + AppTexts.eliteDiscount + AppTexts.bookingOffer,
                fontSize: AppFontSizes.fontLarge - 2.sp,
                fontWeight: AppFontWeights.semiBold,
                color: AppColors.whiteColor,
              ),
            ],
          ),
          Spacing.height(AppDimensions.paddingMedium.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildUptoBox('₹100', 'On Salon & Spa\nservices'),
              _buildUptoBox('₹250', 'On HydraGlo\nFacials'),
              _buildUptoBox('₹1000', 'On Laser\nTreatments'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildUptoBox(String amount, String label) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(12.w, 18.h, 12.w, 10.h),
          decoration: BoxDecoration(
            gradient:  LinearGradient(
              colors: [
                Color(0xFF3A3A2A),
                AppColors.blackColor,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: const Offset(-3, 0),
                blurRadius: 8.r,
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: const Offset(3, 0),
                blurRadius: 8.r,
              ),
            ],
          ),
          child: Column(
            children: [
              SizedBox(height: 10.h),
              CommonText(
                text: amount,
                fontSize: AppFontSizes.fontLarge,
                fontWeight: AppFontWeights.medium,
                color: _gold,
              ),
              Spacing.height(4),
              CommonText(
                text: label,
                fontSize: AppFontSizes.fontNenoSmall,
                fontWeight: AppFontWeights.normal,
                color: Colors.white70,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Positioned(
          top: -10.h,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 2.h,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFD1B98D),
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 6,
                  )
                ],
              ),
              child: CommonText(
                text: "UPTO",
                fontSize: AppFontSizes.fontNenoSmall,
                fontWeight: AppFontWeights.semiBold,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildYMCoinsCard() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: _cardBg,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFD1B98D).withOpacity(0.25),
            offset: const Offset(-4, 0),
            blurRadius: 12,
            spreadRadius: 0,
          ),
          BoxShadow(
            color: const Color(0xFFD1B98D).withOpacity(0.25),
            offset: const Offset(4, 0),
            blurRadius: 12,
            spreadRadius: 0,
          ),
        ],
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 36.w,
                height: 36.w,
                decoration: BoxDecoration(color: _gold, shape: BoxShape.circle),
                child: Icon(Icons.bolt, color: Colors.white, size: 20.r),
              ),
              Spacing.width(12),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: AppTexts.get,
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: AppFontSizes.fontXMedium,
                        fontWeight: AppFontWeights.bold,
                      ),
                    ),
                    TextSpan(
                      text: '1000 ',
                      style: TextStyle(
                        color: _gold,
                        fontSize: AppFontSizes.fontXMedium,
                        fontWeight: AppFontWeights.bold,
                      ),
                    ),
                    TextSpan(
                      text: 'YMCOINS',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: AppFontSizes.fontXMedium,
                        fontWeight: AppFontWeights.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Spacing.height(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CommonText(
                  text:
                      'One-time credit after membership\npurchase to avail 10% discount',
                  fontSize: AppFontSizes.fontSmall,
                  fontWeight: AppFontWeights.normal,
                  color: Colors.white70,
                  softWrap: true,
                ),
              ),
              Spacing.width(8),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: const Color(0xFF3A3020),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Row(
                  children: [
                    Icon(Icons.bolt, color: _gold, size: 14.r),
                    Spacing.width(4),
                    CommonText(
                      text: '1 = ₹1',
                      fontSize: AppFontSizes.fontSmall,
                      fontWeight: AppFontWeights.bold,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAdditionalBenefits() {
    final benefits = [
      {'icon': Icons.headset_mic_outlined, 'text': 'Priority Customer Support'},
      {'icon': Icons.mail_outline, 'text': 'Early Access to Offers & Launches'},
      {
        'icon': Icons.local_offer_outlined,
        'text': 'Extra Discounts on Select Services',
      },
    ];

    return Column(
      children: benefits.asMap().entries.map((entry) {
        final isLast = entry.key == benefits.length - 1;
        return Column(
          children: [
            Row(
              children: [
                Container(
                  width: 44.w,
                  height: 44.w,
                  decoration: BoxDecoration(
                    color: _cardBg,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    entry.value['icon'] as IconData,
                    color: _gold,
                    size: 22.r,
                  ),
                ),
                Spacing.width(16),
                CommonText(
                  text: entry.value['text'] as String,
                  fontSize: AppFontSizes.fontMedium,
                  fontWeight: AppFontWeights.normal,
                  color: Colors.white,
                ),
              ],
            ),
            if (!isLast) ...[
              Spacing.height(10),
              const DottedLine(
                direction: Axis.horizontal,
                lineLength: double.infinity,
                lineThickness: 1.0,
                dashLength: 4.0,
                dashColor: Colors.white12,
                dashGapLength: 3.0,
                dashGapColor: Colors.transparent,
              ),
              Spacing.height(10),
            ],
          ],
        );
      }).toList(),
    );
  }

  Widget _buildMemberCountBanner() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF3E0),
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium.r),
      ),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '1,076,530+ ',
              style: TextStyle(
                color: _gold,
                fontSize: AppFontSizes.fontXMedium,
                fontWeight: AppFontWeights.semiBold,
              ),
            ),
            TextSpan(
              text: 'members are already using Elite',
              style: TextStyle(
                color: Colors.black87,
                fontSize: AppFontSizes.fontXMedium,
                fontWeight: AppFontWeights.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFaqsSection() {
    return Obx(() {
      final visibleFaqs = controller.faqs.take(5).toList();
      return Container(
        decoration: BoxDecoration(
          color: _cardBg,
          borderRadius: BorderRadius.circular(AppDimensions.radiusLarge.r),
        ),
        child: Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: visibleFaqs.length,
              separatorBuilder: (_, __) =>
                  Divider(height: 1, color: Colors.white12),
              itemBuilder: (_, index) {
                final faq = visibleFaqs[index];
                return GestureDetector(
                  onTap: () => controller.toggleFaq(index),
                  behavior: HitTestBehavior.opaque,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 14.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: CommonText(
                                text: faq['question'],
                                fontSize: AppFontSizes.fontMedium,
                                fontWeight: AppFontWeights.normal,
                                color: Colors.white,
                                softWrap: true,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Spacing.width(8),
                            Icon(
                              faq['isExpanded']
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                              color: Colors.white,
                              size: 20.r,
                            ),
                          ],
                        ),
                        if (faq['isExpanded'] as bool) ...[
                          Spacing.height(8),
                          CommonText(
                            text: faq['answer'],
                            fontSize: AppFontSizes.fontSmall,
                            fontWeight: AppFontWeights.normal,
                            color: Colors.white60,
                            softWrap: true,
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              },
            ),
            GestureDetector(
              onTap: controller.navigateToFaqs,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CommonText(
                      text: 'View all questions',
                      fontSize: AppFontSizes.fontSmall,
                      fontWeight: AppFontWeights.medium,
                      color: _gold,
                    ),
                    Spacing.width(4),
                    Icon(Icons.arrow_forward_ios, size: 12.r, color: _gold),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildTestimonials() {
    final testimonials = [
      {
        'text':
            'For someone like me who loves to get facials and pedicures, this membership is a boon. Saving 10% every time is cherry on top.',
        'name': 'Jahnvi, Mumbai',
        'saved': 'Rs.689',
      },
      {
        'text':
            'Amazing membership! The YMCoins are super useful and I love the priority support. Totally worth every penny.',
        'name': 'Priya, Delhi',
        'saved': 'Rs.450',
      },
    ];

    return SizedBox(
      height: 200.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: testimonials.length,
        itemBuilder: (_, index) {
          final t = testimonials[index];
          return Container(
            width: 280.w,
            margin: EdgeInsets.only(right: 12.w),
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: _cardBg,
              border: Border.all(color: AppColors.whiteColor.withOpacity(0.3)),
              borderRadius: BorderRadius.circular(AppDimensions.radiusMedium.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: t['text']!,
                  fontSize: AppFontSizes.fontSmall,
                  fontWeight: AppFontWeights.normal,
                  color: Colors.white,
                  softWrap: true,
                ),
                const Spacer(),
                Divider(color: Colors.white24, height: 1),
                Spacing.height(8),
                CommonText(
                  text: t['name']!,
                  fontSize: AppFontSizes.fontSmall,
                  fontWeight: AppFontWeights.medium,
                  color: Colors.white,
                ),
                Spacing.height(6),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 4.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade700,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Saved ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: AppFontSizes.fontSmall,
                          ),
                        ),
                        TextSpan(
                          text: t['saved'],
                          style: TextStyle(
                            color: _gold,
                            fontSize: AppFontSizes.fontSmall,
                            fontWeight: AppFontWeights.bold,
                          ),
                        ),
                        TextSpan(
                          text: ' so far!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: AppFontSizes.fontSmall,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildTermsRow() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.termsConditions);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: _cardBg,
          borderRadius: BorderRadius.circular(AppDimensions.radiusMedium.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonText(
              text: 'Terms and Conditions',
              fontSize: AppFontSizes.fontMedium,
              fontWeight: AppFontWeights.semiBold,
              color: Colors.white,
            ),
            Icon(Icons.arrow_forward_ios, size: 16.r, color: Colors.white),
          ],
        ),
      ),
    );
  }

  Widget _buildBuyButton() {
    return Container(
      color: AppColors.blackColor,
      child: GestureDetector(
        onTap: () => ElitePaymentBottomSheet.show(),
        child: Padding(
          padding:  EdgeInsets.all(18.0.r),
          child: Container(
            height: 56.h,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF5f0a2a),
                  Color(0xFF5f0a2a),
                  Color(0xFF5f0a2a),
                  Color(0xFF5f0a2a),
                  Color(0xFF5f0a2a),
                  Color(0xFFaf7379)
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  child: Container(
                    width: 52.w,
                    decoration: BoxDecoration(
                      color: _gold,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.r),
                        bottomLeft: Radius.circular(12.r),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CommonText(
                          text: '41%',
                          fontSize: AppFontSizes.fontSmall,
                          fontWeight: AppFontWeights.bold,
                          color: Colors.white,
                          textAlign: TextAlign.center,
                        ),
                        CommonText(
                          text: 'Off',
                          fontSize: AppFontSizes.fontNenoSmall,
                          fontWeight: AppFontWeights.medium,
                          color: Colors.white,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                // Price text
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Buy Elite at ₹249  ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: AppFontSizes.fontMedium,
                                fontWeight: AppFontWeights.bold,
                              ),
                            ),
                            TextSpan(
                              text: '₹499',
                              style: TextStyle(
                                color: Colors.white60,
                                fontSize: AppFontSizes.fontSmall,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ],
                        ),
                      ),
                      CommonText(
                        text: 'for 6 months',
                        fontSize: AppFontSizes.fontNenoSmall,
                        fontWeight: AppFontWeights.normal,
                        color: Colors.white70,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
