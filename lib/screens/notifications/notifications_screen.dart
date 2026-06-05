import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yes_madam/controller/notification/notifications_controller.dart';
import 'package:yes_madam/utils/app_images.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_dimensions.dart';
import '../../utils/app_font_sizes.dart';
import '../../utils/app_font_weights.dart';
import '../../widgets/common/common_app_bar.dart';
import '../../widgets/common/common_text.dart';

class NotificationsScreen extends GetView<NotificationsController> {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {
        'title': 'Subscribe',
        'subtitle':
        'So that you never miss the latest\noffers & service update',
        'image': AppImages.wpIcon,
        'value': controller.whatsappSubscribed,
        'onChanged': controller.toggleWhatsapp,
        'compact': false,
      },
      {
        'title': 'Opt for personalized experience',
        'subtitle': null,
        'image': null,
        'value': controller.personalizedExp,
        'onChanged': controller.togglePersonalizedExp,
        'compact': true,
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CommonAppBar(
        title: CommonText(
          text: 'Notification Preferences',
          fontSize: AppFontSizes.fontXMedium,
          fontWeight: AppFontWeights.bold,
          color: AppColors.darkColor,
        ),
        showBackButton: true,
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(AppDimensions.paddingMedium.w),
        child: ListView.separated(
          itemCount: items.length,
          separatorBuilder: (_, __) =>
              SizedBox(height: AppDimensions.spacingLarge.h),
          itemBuilder: (context, index) {
            final item = items[index];

            return _NotificationTile(
              title: item['title'] as String,
              subtitle: item['subtitle'] as String?,
              image: item['image'] as String?,
              value: item['value'] as RxBool,
              onChanged: item['onChanged'] as Function(bool),
              compact: item['compact'] as bool,
            );
          },
        ),
      ),
    );
  }
}

class _NotificationTile extends StatelessWidget {
  const _NotificationTile({
    required this.title,
    required this.value,
    required this.onChanged,
    required this.compact,
    this.subtitle,
    this.image,
  });

  final String title;
  final String? subtitle;
  final String? image;
  final RxBool value;
  final Function(bool) onChanged;
  final bool compact;

  static const Color activeThumbColor = Color(0xFF008073);
  static const Color activeTrackColor = Color(0xFFB1DBD6);
  static const Color inactiveTrackColor = Color(0xFFE0E0E0);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingMedium.w,
        vertical: compact ? 5.h : AppDimensions.paddingMedium.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(
          AppDimensions.radiusMedium.r,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey400,
            blurRadius: 6.r,
            spreadRadius: 1.r,
          ),
        ],
      ),
      child: Obx(
            () => Row(
          children: [
            if (image != null) ...[
              Image.asset(
                image!,
                width: 35.w,
                height: 35.h,
              ),
              SizedBox(width: AppDimensions.spacingLarge.w),
            ],

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text: title,
                    fontSize: AppFontSizes.fontMedium,
                    fontWeight: AppFontWeights.extraBold,
                    color: AppColors.darkColor,
                  ),
                  if (subtitle != null) ...[
                    CommonText(
                      text: subtitle!,
                      fontSize: AppFontSizes.fontSmall,
                      fontWeight: AppFontWeights.medium,
                      color: AppColors.blackColor,
                    ),
                  ],
                ],
              ),
            ),

            Transform.scale(
              scale: 0.80,
              child: Switch(
                value: value.value,
                onChanged: onChanged,
                thumbColor: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.selected)) {
                    return activeThumbColor;
                  }
                  return Colors.white;
                }),
                trackColor: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.selected)) {
                    return activeTrackColor;
                  }
                  return inactiveTrackColor;
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}