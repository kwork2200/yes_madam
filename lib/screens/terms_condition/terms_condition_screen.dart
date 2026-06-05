import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_dimensions.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/utils/app_texts.dart';
import 'package:yes_madam/widgets/common/common_text.dart';
import 'package:yes_madam/widgets/components/spacing_widget.dart';
import 'package:yes_madam/widgets/common/common_app_bar.dart';

class TermsConditionScreen extends StatelessWidget {
  const TermsConditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CommonAppBar(
        title: CommonText(
          text: AppTexts.termsConditions,
          fontSize: AppFontSizes.fontXMedium,
          fontWeight: AppFontWeights.bold,
          color: AppColors.blackColor,
        ),
        showBackButton: true,
        centerTitle: false,
        backgroundColor: AppColors.whiteColor,
        onBackPressed: () => Get.back(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppDimensions.paddingMedium.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CommonText(
                text: "Updated on: 8th November, 2025",
                fontSize: AppFontSizes.fontXMedium,
                fontWeight: AppFontWeights.normal,
                color: AppColors.blackColor,
              ),
            ),

            Spacing.height(20),

            Center(
              child: CommonText(
                text: AppTexts.termsConditions,
                fontSize: AppFontSizes.fontMedium,
                fontWeight: AppFontWeights.extraBold,
                color: AppColors.blackColor,
              ),
            ),

            Spacing.height(20),

            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: AppFontSizes.fontSmall,
                  color: AppColors.blackColor,
                  height: 1.6,
                ),
                children: const [
                  TextSpan(
                    text:
                        "These terms and conditions (“Terms”) govern the use of services made available on or through https://www.yesmadam.com and/or the YesMadam mobile app collectively, the “Platform”, and together with the services made available on or through the Platform, the “Total Services (which includes ‘Services’ and ‘Pro Services’ defined later)”.\n\n"
                        "These Terms also include our privacy policy, available at https://www.yesmadam.com/privacypolicy (“Privacy Policy”), and any guidelines, additional, or supplemental terms, policies, and disclaimers made available or issued by us from time to time (“Supplemental Terms”). The Privacy Policy and Supplemental Terms form an integral part of these Terms.\n\n"
                        "By using the Services, you agree that you have read, understood, and are bound by these Terms.\n\n",
                  ),

                  TextSpan(
                    text: "1. SERVICES\n\n",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  TextSpan(
                    text:
                        "(a) Scope of Services\n"
                        "The Services include the provision of the Platform that enables you to arrange and schedule home-based services with independent third-party service providers or Laser/Body Toning Professionals.\n\n"
                        "YM facilitates payments to Service Professionals for services rendered and collects payments on their behalf.\n\n"
                        "The term “Services” refers only to platform services provided by YM and does not include Pro Services.\n\n"
                        "The Terms constitute a binding contract between YesMadam Technologies Pvt. Ltd. and users of the Platform.\n\n",
                  ),

                  TextSpan(
                    text: "(b) Service Professional Classification\n\n",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  TextSpan(
                    text:
                        "1. Independent Professionals\n"
                        "All Service Professionals are independent contractors and not employees or agents of YesMadam.\n\n"
                        "2. Laser/Body Toning Category Professionals\n"
                        "These professionals are full-time employees of YesMadam.\n\n"
                        "3. Customer Acknowledgment\n"
                        "Users acknowledge that except Laser/Body Toning category, YM does not control service professionals.\n\n",
                  ),

                  TextSpan(
                    text: "2. ACCOUNT CREATION\n\n",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  TextSpan(
                    text:
                        "(a) Must be 18 years or older.\n"
                        "(b) Information must be accurate and updated.\n"
                        "(c) User is responsible for account security.\n"
                        "(d) User is liable for all activities.\n"
                        "(e) User agrees to receive communications.\n\n",
                  ),

                  TextSpan(
                    text: "3. USER CONTENT\n\n",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  TextSpan(
                    text:
                        "(a) Users may post reviews and feedback.\n"
                        "(b) Content may be used for service improvement.\n"
                        "(c) YM may use content for marketing and operations.\n"
                        "(d) YM may remove content violating policies.\n\n",
                  ),

                  TextSpan(
                    text: "4. CONSENT TO USE DATA\n\n",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  TextSpan(
                    text:
                        "(a) Data collected as per Privacy Policy.\n"
                        "(b) Data may be shared with affiliates.\n"
                        "(c) Data may be disclosed to government/legal authorities if required.\n",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
