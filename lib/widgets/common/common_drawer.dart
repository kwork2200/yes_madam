import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_dimensions.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/utils/app_texts.dart';
import 'package:yes_madam/widgets/common/common_text.dart';
import 'package:yes_madam/widgets/components/spacing_widget.dart';

class CommonDrawer extends StatelessWidget {
  const CommonDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.whiteColor,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: AppDimensions.paddingXMedium.w, vertical: AppDimensions.paddingXLarge.h),
            decoration: BoxDecoration(
              color: AppColors.themeColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: AppDimensions.radiusCircle.r,
                  backgroundColor: AppColors.whiteColor,
                  child: Icon(
                    Icons.sim_card_rounded,
                    size: AppDimensions.iconLarge.r,
                    color: AppColors.themeColor,
                  ),
                ),
                Spacing.height(AppDimensions.spacingBetween),
                CommonText(
                  text: AppTexts.smartRechargeHub,
                  color: AppColors.whiteColor,
                  fontSize: AppFontSizes.fontMedium,
                  fontWeight: AppFontWeights.bold,
                ),
                CommonText(
                  text: AppTexts.manageRechargePlans,
                  color: AppColors.whiteColor.withOpacity(.9),
                  fontSize: AppFontSizes.fontSmall,
                  softWrap: true,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _drawerTile(
                  icon: Icons.info_outline,
                  iconColor: AppColors.blackColor,
                  title: AppTexts.aboutUs,
                  onTap: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    // Get.back();
                    // Get.to(() => const AboutUsScreen(), transition: Transition.rightToLeft);
                  },
                ),
                _drawerTile(
                  icon: Icons.description_outlined,
                  iconColor: AppColors.blackColor,
                  title: AppTexts.termsConditionsLabel,
                  onTap: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    // Get.back();
                    // Get.to(() => TermsConditionsScreen(),
                    //     transition: Transition.rightToLeft);
                  },
                ),
                _drawerTile(
                  icon: Icons.privacy_tip_outlined,
                  iconColor: AppColors.blackColor,
                  title: AppTexts.privacyPolicyLabel,
                  onTap: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    // Get.back();
                    // Get.to(() =>  PrivacyPolicyScreen(),
                    //     transition: Transition.rightToLeft);
                  },
                ),
                _drawerTile(
                  icon: Icons.contact_phone_outlined,
                  iconColor: AppColors.blackColor,
                  title: AppTexts.contactUs,
                  onTap: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                  
                  },
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimensions.paddingMedium.w),
            child: Divider(color: AppColors.themeColor),
          ),

          // SafeArea(
          //   top: false,
          //   child: Padding(
          //     padding: EdgeInsets.only(bottom: 15.h),
          //     child: _drawerTile(
          //       icon: Icons.logout,
          //       title: "Logout",
          //       iconColor: AppColors.blackColor,
          //       textColor: AppColors.blackColor,
          //       onTap: () {
          //         Get.defaultDialog(
          //           title: "Logout",
          //           middleText: "Are you sure you want to logout?",
          //           textConfirm: "Logout",
          //           textCancel: "Cancel",
          //           confirmTextColor: AppColors.whiteColor,
          //           onConfirm: () {
          //             Get.back();
          //             Get.back();
          //           },
          //         );
          //       },
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _drawerTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? iconColor,
    Color? textColor,
  }) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        color: iconColor ?? AppColors.themeColor,
      ),
      title: CommonText(
        text: title,
        color: textColor ?? AppColors.blackColor,
        fontWeight: AppFontWeights.medium,
        fontSize: AppFontSizes.fontSmall,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: AppDimensions.iconSmall.sp,
        color: AppColors.blackColor,
      ),
    );
  }
}