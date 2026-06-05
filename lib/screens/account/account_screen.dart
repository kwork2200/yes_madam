import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:yes_madam/controller/account/account_controller.dart';
import 'package:yes_madam/routes/app_routes.dart';
import 'package:yes_madam/utils/app_texts.dart';
import 'package:yes_madam/widgets/common/common_button.dart';
import 'package:yes_madam/widgets/components/spacing_widget.dart';
import 'package:yes_madam/widgets/logout_dialog.dart';
import 'package:yes_madam/widgets/yes_madam_logo.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_font_weights.dart';
import '../../utils/app_font_sizes.dart';
import '../../utils/app_dimensions.dart';
import '../../widgets/common/common_text.dart';
import '../wallet/wallet_screen.dart';

class AccountScreen extends GetView<AccountController> {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundGrey,
      body: SafeArea(
        child: Column(
          children: [
            _buildProfileSection(),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    _buildQuickActions(),
                    SizedBox(height: AppDimensions.spacingXLarge.h),
                    _menuSection([
                      _menuItem(
                        Icons.account_balance_wallet_outlined,
                        AppTexts.ymWallet,
                        () => Get.to(() => WalletScreen()),
                      ),
                    ]),
                    SizedBox(height: AppDimensions.spacingXLarge.h),
                    _menuSection([
                      _menuItem(
                        Icons.campaign_outlined,
                        AppTexts.referEarn,
                        () {},
                        subtitle: AppTexts.coinsAndFreeServices,
                        trailing: Row(
                          children: [
                            _coinBadge('R', Colors.orange, '0'),
                            Spacing.width(5),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: AppFontSizes.fontMedium.sp,
                              color: AppColors.greyColor,
                            ),
                          ],
                        ),
                      ),
                    ]),
                    SizedBox(height: AppDimensions.spacingXLarge.h),
                    _menuSection([
                      _sectionTitle(AppTexts.earnWithUs),
                      _menuItem(
                        Icons.handshake_outlined,
                        AppTexts.registerPartner,
                        () {},
                      ),
                    ]),
                    SizedBox(height: AppDimensions.spacingXLarge.h),
                    _menuSection([
                      _sectionTitle(AppTexts.wannaRead),
                      _menuItem(Icons.grid_view_outlined, AppTexts.blog, () {}),
                    ]),
                    SizedBox(height: AppDimensions.spacingXLarge.h),
                    _buildOtherInformationSection(),
                    SizedBox(height: AppDimensions.spacingXLarge.h),
                    _menuSection([
                      _menuItem(Icons.logout, AppTexts.logout, () {
                        Get.dialog(
                          LogoutDialog(
                            onConfirm: () {
                              controller.logout();
                            },
                          ),
                        );
                      }),
                    ]),
                    SizedBox(height: AppDimensions.spacingXLarge.h + 8.h),
                    YesMadamLogo(
                      height: 30.h,
                      width: 120.w,
                      color: AppColors.greyColor,
                    ),
                    CommonText(
                      text: AppTexts.versionNumber,
                      fontSize: AppFontSizes.fontSmall,
                      color: AppColors.greyColor,
                      fontWeight: AppFontWeights.originalBold,
                    ),
                    Spacing.height(50),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Container(
      margin: EdgeInsets.all(AppDimensions.spacingLarge.w),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(AppDimensions.radiusXLarge.r),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(AppDimensions.paddingSmall.w),
            child: Row(
              children: [
                Obx(() {
                  final img = controller.profileImage.value;

                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.profile);
                    },
                    child: CircleAvatar(
                      radius: 25.r,
                      backgroundColor: AppColors.grey300,
                      backgroundImage: img.isNotEmpty ? FileImage(File(img)) : null,
                      child: img.isEmpty
                          ? Icon(
                        Icons.person,
                        size: 32.sp,
                        color: AppColors.greyColor,
                      )
                          : null,
                    ),
                  );
                }),
                SizedBox(width: AppDimensions.spacingLarge.w),
                Expanded(
                  child: Obx(
                    () => GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.profile);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(() => CommonText(
                            text: controller.userName.value,
                            fontSize: AppFontSizes.fontXMedium,
                            fontWeight: AppFontWeights.bold,
                            color: AppColors.darkColor,
                          )),
                          CommonText(
                            text: controller.phoneNumber.value,
                            fontSize: AppFontSizes.fontSmall,
                            color: AppColors.darkColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppDimensions.spacingLarge.w,
                      vertical: 6.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.blackColor,
                      border: Border.all(color: AppColors.errorColor),
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusXLarge.r,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.bolt,
                          color: AppColors.goldColor,
                          size: AppDimensions.iconSmall.sp,
                        ),
                        Spacing.width(AppDimensions.spacingSmall.w),
                        CommonText(
                          text: '${controller.ymCoins.value}',
                          fontSize: AppFontSizes.fontSmall,
                          fontWeight: AppFontWeights.semiBold,
                          color: AppColors.whiteColor,
                        ),
                        SizedBox(width: AppDimensions.spacingSmall.w),
                        Icon(
                          Icons.info_outline,
                          color: AppColors.errorColor,
                          size: AppDimensions.iconSmall.sp,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              Get.toNamed(AppRoutes.eliteMembership);
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.paddingMedium.w,
                vertical: AppDimensions.paddingSmall.h,
              ),
              decoration: BoxDecoration(color: AppColors.darkColor),
              child: Row(
                children: [
                  Icon(
                    Icons.workspace_premium,
                    color: AppColors.goldColor,
                    size: AppFontSizes.fontLarge.sp,
                  ),
                  SizedBox(width: AppDimensions.spacingMedium.w),
                  CommonText(
                    text: " ${AppTexts.elite} ",
                    fontSize: AppFontSizes.fontMedium,
                    color: AppColors.goldColor,
                    fontWeight: AppFontWeights.bold,
                  ),
                  CommonText(
                    text: AppTexts.membership,
                    fontSize: AppFontSizes.fontMedium,
                    color: AppColors.whiteColor,
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.whiteColor,
                    size: AppFontSizes.fontMedium.sp,
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(AppDimensions.spacingLarge.w),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  AppColors.yellowGradientStart,
                  AppColors.whiteColor,
                  AppColors.yellowGradientEnd,
                ],
              ),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(AppDimensions.radiusXLarge.r),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: CommonText(
                    text:
                        'You will save more than 3X of the price you pay for Elite',
                    fontSize: AppFontSizes.fontSmall,
                    color: AppColors.darkColor,
                    softWrap: true,
                  ),
                ),
                SizedBox(width: AppDimensions.spacingMedium.w),
                CommonButton(
                  text: 'Join Elite @ ₹249',
                  onPressed: () {},
                  backgroundColor: AppColors.darkColor,
                  fontSize: 11.sp,
                  height: 36.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimensions.spacingXLarge.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(controller.quickActions.length, (index) {
          final action = controller.quickActions[index];
          return Expanded(
            child: GestureDetector(
              onTap: action['onTap'],
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 4.w),
                padding: EdgeInsets.symmetric(
                  vertical: AppDimensions.paddingSmall.w,
                ),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(
                    AppDimensions.radiusLarge.r,
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 35.w,
                      height: 35.w,
                      decoration: BoxDecoration(
                        color: AppColors.greyLight,
                        borderRadius: BorderRadius.circular(
                          AppDimensions.iconMedium.r,
                        ),
                      ),
                      child: Icon(
                        action['icon'],
                        color: AppColors.darkColor,
                        size: AppDimensions.iconMedium.sp - 3.sp,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    CommonText(
                      text: action['title'],
                      fontSize: 11.sp,
                      color: AppColors.darkColor,
                      fontWeight: AppFontWeights.bold,
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildOtherInformationSection() {
    final menuItems = [
      {
        'icon': Icons.share_outlined,
        'title': 'Share the App',
        'onTap': () async {
          await Share.share(
            'Check out this app: https://play.google.com/store/apps/details?id=com.yourapp.package',
          );
        },
      },
      {
        'icon': Icons.info_outline,
        'title': 'About Us',
        'onTap': () => Get.toNamed(AppRoutes.aboutUs),
      },
      {
        'icon': Icons.security_outlined,
        'title': 'Privacy Policy',
        'onTap': () => Get.toNamed(AppRoutes.privacyPolicy),
      },
      {
        'icon': Icons.description_outlined,
        'title': 'Terms & Conditions',
        'onTap': () => Get.toNamed(AppRoutes.termsConditions),
      },
      {
        'icon': Icons.notifications_outlined,
        'title': 'Notification preferences',
        'onTap': () => Get.toNamed(AppRoutes.notifications),
      },
      {
        'icon': Icons.contact_page_outlined,
        'title': 'Contact Us',
        'onTap': () => Get.toNamed(AppRoutes.contactUs),
      },
    ];

    return _menuSection([
      _sectionTitle('Other Information'),
      Spacing.height(5),
      ...List.generate(menuItems.length, (index) {
        final item = menuItems[index];
        return Column(
          children: [
            _menuItem(
              item['icon'] as IconData,
              item['title'] as String,
              item['onTap'] as VoidCallback,
            ),
            if (index != menuItems.length - 1) _divider(),
          ],
        );
      }),
      Spacing.height(10),
    ]);
  }

  Widget _menuSection(List<Widget> children) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppDimensions.spacingLarge.w),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(AppDimensions.radiusXLarge.r - 4.r),
      ),
      child: Column(children: children),
    );
  }

  Widget _menuItem(
    IconData icon,
    String label,
    VoidCallback onTap, {
    String? subtitle,
    Widget? trailing,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.paddingMedium.w,
          vertical: AppFontSizes.fontMedium.h,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: AppFontSizes.fontLarge.sp,
              color: AppColors.blackColor,
            ),
            SizedBox(width: AppDimensions.spacingLarge.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text: label,
                    fontSize: AppFontSizes.fontMedium,
                    color: AppColors.darkColor,
                    fontWeight: AppFontWeights.normal,
                  ),
                  if (subtitle != null) ...[
                    SizedBox(height: 2.h),
                    CommonText(
                      text: subtitle,
                      fontSize: AppFontSizes.fontSmall,
                      color: AppColors.blackColor,
                    ),
                  ],
                ],
              ),
            ),
            trailing ??
                Icon(
                  Icons.arrow_forward_ios,
                  size: AppFontSizes.fontMedium.sp,
                  color: AppColors.blackColor,
                ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppDimensions.paddingMedium.w,
        AppFontSizes.fontMedium.h,
        AppDimensions.paddingMedium.w,
        AppDimensions.spacingSmall.h,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: CommonText(
          text: title,
          fontSize: 16.sp,
          fontWeight: AppFontWeights.bold,
          color: AppColors.darkColor,
        ),
      ),
    );
  }

  Widget _divider() => Padding(
    padding: EdgeInsets.symmetric(horizontal: AppDimensions.paddingMedium.w),
    child: Divider(height: 1, color: AppColors.grey200),
  );

  Widget _coinBadge(String letter, Color color, String count) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: Colors.purple.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 16.w,
            height: 16.w,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            child: Center(
              child: CommonText(
                text: letter,
                fontSize: AppFontSizes.fontNenoSmall - 2.sp,
                fontWeight: AppFontWeights.bold,
                color: AppColors.whiteColor,
              ),
            ),
          ),
          SizedBox(width: AppDimensions.spacingSmall.w),
          CommonText(
            text: count,
            fontSize: AppFontSizes.fontMedium,
            fontWeight: AppFontWeights.semiBold,
            color: AppColors.blackColor,
          ),
        ],
      ),
    );
  }
}
