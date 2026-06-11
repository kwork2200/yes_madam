import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yes_madam/controller/checkout/checkout_controller.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/widgets/common/common_button.dart';
import 'package:yes_madam/widgets/common/common_text.dart';
import 'package:yes_madam/widgets/common/common_text_field.dart';
import 'package:yes_madam/widgets/components/spacing_widget.dart';

class ReferralCodeBottomSheet extends StatelessWidget {
  final CheckoutController controller;

  const ReferralCodeBottomSheet({
    super.key,
    required this.controller,
  });

  static void show(
      BuildContext context,
      CheckoutController controller,
      ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24.r),
        ),
      ),
      builder: (_) => ReferralCodeBottomSheet(
        controller: controller,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tc = TextEditingController();

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
            top: 20.h,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                text: 'Apply Referral Code',
                fontSize: AppFontSizes.fontXMedium,
                fontWeight: AppFontWeights.semiBold,
                color: AppColors.blackColor,
              ),

              Spacing.height(16),

              CommonTextField(
                controller: tc,
                hintText: 'Enter Referral Code',
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 14.w,
                  vertical: 10.h,
                ),
              ),

              Spacing.height(20),

              CommonButton(
                text: 'Submit',
                width: double.infinity,
                height: 40.h,
                onPressed: () {
                  controller.applyReferralCode(
                    tc.text.trim(),
                  );
                  Get.back();
                },
              ),
            ],
          ),
        ),

        Positioned(
          top: -38.h,
          right: 16.w,
          child: GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              height: 30.h,
              width: 30.w,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.close,
                color: Colors.black,
                size: 20.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }
}