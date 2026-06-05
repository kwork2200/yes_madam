import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_dimensions.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/utils/app_texts.dart';
import 'package:yes_madam/widgets/common/common_app_bar.dart';
import 'package:yes_madam/widgets/common/common_text.dart';
import 'package:yes_madam/widgets/components/spacing_widget.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CommonAppBar(
        title: CommonText(
          text: AppTexts.privacyPolicy,
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
            CommonText(
              text: AppTexts.updatedOn,
              fontSize: AppFontSizes.fontSmall,
              fontWeight: AppFontWeights.medium,
              color: AppColors.blackColor,
            ),

            Spacing.height(20),

            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: AppFontSizes.fontSmall,
                  color: AppColors.blackColor,
                  height: 1.6,
                ),
                children: [
                  TextSpan(
                    text:
                        "YesMadam Technologies Pvt. Ltd. (Formerly known as Notion Online Solutions Private Limited) and/or Yes Madam as its brand, (We) takes privacy very seriously. Our Privacy Policy (Policy) is designed to provide transparency into our privacy practices and principles, presented in a format that makes it easier for our guests to navigate, read and understand contents of our website, www.yesmadam.com (Website). We are dedicated to treating your personal information with care and respect. We have accordingly developed this Policy to protect your personal information and keep it confidential.\n\n",
                  ),

                  TextSpan(
                    text: "1. Personal Information\n\n",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  TextSpan(
                    text:
                        "We thank you (Customer/User/You/Your) for registering with Yesmadam Technologies Pvt. Ltd. (Formerly known as Notion Online Solutions Private Limited) and/or Yes Madam as its brand, (We/Us/Our/Yes Madam) on www.yesmadam.com (Website) as well as on our Mobile Application (App). Your agreement with us includes these user terms and conditions of use (Terms) and our privacy policy (together the Policies). If you don't agree with these terms, then please don't use our services (defined later). Please note that you will not be able to book services offered by Yes Madam, if you have not clicked and accepted these terms.\n\n",
                  ),

                  TextSpan(
                    text:
                        "1.1 We categorise information about you (collectively referred to as \"Personal Information\") as follows:\n",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  TextSpan(
                    text:
                        "A. Profiling Information: Information which you provide when you register for a service...\n"
                        "B. Payment and Account Information: Your account history... encrypted form...\n"
                        "C. Service Usage: URLs visited...\n"
                        "D. Log information: IP address, browser type...\n"
                        "E. Transactional Information: e-commerce activities...\n"
                        "F. Correspondence Information: emails, chats...\n"
                        "G. User IDs: usernames, passwords...\n"
                        "H. Stored Information: images, documents...\n\n",
                  ),

                  TextSpan(
                    text:
                        "We only collect your personal Information to conduct our business and to enable us to deliver and improve our services.\n\n",
                  ),

                  TextSpan(
                    text:
                        "1.2 We do not and shall never for any reason whatsoever sell your Personal Information to any third party or otherwise trade on it. We will only disclose your Personal Information in accordance with this Policy. If we want to use it for any other purpose, we will obtain your prior written consent.\n\n",
                  ),
                  TextSpan(
                    text: "2. Right to Collect\n\n",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  TextSpan(
                    text:
                        "By accepting the Terms of Service you agree that we may collect and store your Personal Information as long as you use our Services.\n\n",
                  ),

                  TextSpan(
                    text: "2.1 Profiling and Account Information usage:\n",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  TextSpan(
                    text:
                        "A. Manage relationship and provide services\n"
                        "B. Statistical and marketing profiles\n\n",
                  ),

                  TextSpan(
                    text: "2.2 Service usage and transactional information:\n",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  TextSpan(
                    text:
                        "A. Verify charges\n"
                        "B. Regulatory compliance\n"
                        "C. Improve services\n"
                        "D. Monitor usage\n\n",
                  ),

                  TextSpan(
                    text: "2.3 Communication information:\n",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  TextSpan(
                    text:
                        "A. Legal compliance\n"
                        "B. Monitoring service usage\n\n",
                  ),

                  TextSpan(
                    text: "2.4 Cookies and Tracking:\n",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  TextSpan(
                    text:
                        "We use cookies to enhance experience and track trends.\n\n",
                  ),

                  TextSpan(
                    text: "2.5 GPS Tracking:\n",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  TextSpan(
                    text:
                        "Location may be collected during service usage for safety.\n\n",
                  ),

                  TextSpan(
                    text: "2.6 Mobile Application Data:\n",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  TextSpan(
                    text: "Device info, OS, behavior, SMS OTP usage, etc.\n\n",
                  ),

                  TextSpan(
                    text: "3. General Exceptions\n\n",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  TextSpan(
                    text:
                        "We may disclose information if required by law or security.\n\n",
                  ),
                  TextSpan(
                    text: "4. Tracking Devices\n\n",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  TextSpan(
                    text:
                        "We use cookies, web beacons, and analytics tools.\n\n",
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
