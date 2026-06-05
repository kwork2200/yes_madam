import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/widgets/common/common_text.dart';
import 'package:yes_madam/widgets/components/spacing_widget.dart';

class LogoutDialog extends StatelessWidget {
  final VoidCallback onConfirm;

  const LogoutDialog({super.key, required this.onConfirm});

  @override
  Widget build(BuildContext context) {

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.r),
      ),
      backgroundColor: AppColors.whiteColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: "Logout Now ?",
                  fontSize: 20.sp,
                  fontWeight: AppFontWeights.bold,
                  color: AppColors.darkColor,
                ),
                Spacing.height(16),
                CommonText(
                  text: "Please confirm if you want to log out of the YesMadam app.",
                  fontSize: 12.sp,
                  color: AppColors.blackColor,softWrap: true,
                ),
              ],
            ),
          ),
          Divider(height: 1.0.h, color: AppColors.grey300),
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () => Get.back(),
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16.r)),
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      child: CommonText(
                        text: "Cancel",
                        fontSize: 14.sp,
                        fontWeight: AppFontWeights.semiBold,
                        color: AppColors.themeColor,
                      ),
                    ),
                  ),
                ),
                VerticalDivider(width: 1, color: AppColors.grey300, thickness: 1.0),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Get.back();
                      onConfirm();
                    },
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(16.r)),
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      child: CommonText(
                        text: "Yes, Logout",
                        fontSize: 14.sp,
                        fontWeight: AppFontWeights.semiBold,
                        color: AppColors.themeColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}