import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/widgets/common/common_button.dart';
import 'package:yes_madam/widgets/common/common_text.dart';
import 'package:yes_madam/widgets/common/common_text_field.dart';
import 'package:yes_madam/widgets/components/spacing_widget.dart';
import 'package:get/get.dart';

class BookingForSomeoneElseSection extends StatelessWidget {
  final dynamic controller;

  const BookingForSomeoneElseSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final recipientValue = controller.recipient.value;
      final hasRecipient = recipientValue != null;

      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(10.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CommonText(text: '🎁 ', fontSize: AppFontSizes.fontMedium),
                      CommonText(
                        text: 'Booking for someone else?',
                        fontSize: AppFontSizes.fontSmall,
                        fontWeight: AppFontWeights.medium,
                        color: AppColors.blackColor,
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () => BookingForSomeoneElseSheet.show(
                      context,
                          (name, mobile) => controller.setRecipient(name, mobile),
                    ),
                    child: CommonText(
                      text: hasRecipient ? 'CHANGE' : 'ADD',
                      fontSize: AppFontSizes.fontSmall,
                      fontWeight: AppFontWeights.bold,
                      color: AppColors.themeColor,
                    ),
                  ),
                ],
              ),
              if (hasRecipient) ...[
                Spacing.height(12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.person, color: AppColors.greyColor, size: 22.sp),
                    Spacing.width(12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonText(
                            text: "Recipient's details",
                            fontSize: AppFontSizes.fontSmall,
                            fontWeight: AppFontWeights.medium,
                            color: AppColors.blackColor,
                          ),
                          CommonText(
                            text: "${recipientValue.name}, ${recipientValue.mobile}",
                            fontSize: AppFontSizes.fontNenoSmall,
                            color: AppColors.blackColor,
                            fontWeight: AppFontWeights.normal,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(2.r),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.grey200
                      ),
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () => controller.clearRecipient(),
                        child: Icon(
                          Icons.delete_outline_rounded,
                          color: AppColors.blackColor.withOpacity(0.7),
                          size: 18.sp,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ],
          ),
        ),
      );
    });
  }
}

class BookingForSomeoneElseSheet extends StatefulWidget {
  final void Function(String name, String mobile) onAddDetails;

  const BookingForSomeoneElseSheet({super.key, required this.onAddDetails});

  static void show(
    BuildContext context,
    void Function(String name, String mobile) onAddDetails,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BookingForSomeoneElseSheet(onAddDetails: onAddDetails),
    );
  }

  @override
  State<BookingForSomeoneElseSheet> createState() => _BookingForSomeoneElseSheetState();
}

class _BookingForSomeoneElseSheetState extends State<BookingForSomeoneElseSheet> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();

  bool get _canSubmit =>
      _nameController.text.trim().isNotEmpty &&
      _mobileController.text.trim().length == 10;

  @override
  void dispose() {
    _nameController.dispose();
    _mobileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(
                  text: 'Booking for someone else',
                  fontSize: AppFontSizes.fontXMedium,
                  fontWeight: AppFontWeights.semiBold,
                  color: AppColors.blackColor,
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.close,
                    size: 22.sp,
                    color: AppColors.blackColor,
                  ),
                ),
              ],
            ),
            Spacing.height(6),
            CommonText(
              text:
              "We will share booking details on recipient's mobile number",
              fontSize: AppFontSizes.fontSmall,
              color: AppColors.black54,
              fontWeight: AppFontWeights.semiBold,
              softWrap: true,
            ),
            Spacing.height(18),
            CommonTextField(
              controller: _nameController,
              hintText: "Add recipient's name",
              hintStyle: TextStyle(fontWeight: AppFontWeights.medium,color: AppColors.greyColor),
              onChanged: (_) => setState(() {}),
            ),
            Spacing.height(12),
            CommonTextField(
              controller: _mobileController,
              hintText: "Add recipient's mobile number",
              keyboardType: TextInputType.phone,
              maxLength: 10,
              hintStyle: TextStyle(fontWeight: AppFontWeights.medium,color: AppColors.greyColor),
              suffixIcon: Icon(Icons.contacts_outlined, color: AppColors.greyColor),
              counterText: '',
              onChanged: (_) => setState(() {}),
            ),
            Spacing.height(20),
            CommonButton(
              text: 'Add Details',
              fontSize: AppFontSizes.fontSmall,
              fontWeight: AppFontWeights.extraBold,
              width: double.infinity,
              height: 35.h,
              isEnabled: _canSubmit,
              onPressed: () {
                widget.onAddDetails(
                  _nameController.text.trim(),
                  _mobileController.text.trim(),
                );
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

