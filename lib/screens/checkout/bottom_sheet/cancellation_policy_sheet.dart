import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/widgets/common/common_text.dart';
import 'package:yes_madam/widgets/components/spacing_widget.dart';

class CancellationPolicySheet extends StatelessWidget {
  const CancellationPolicySheet({super.key});

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      builder: (_) => const CancellationPolicySheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: "Cancellation Policy",
                  fontSize: AppFontSizes.fontLarge - 2.sp,
                  fontWeight: AppFontWeights.bold,
                  color: AppColors.blackColor,
                ),
                Spacing.height(12),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: AppColors.grey200),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        color: Color(0xFFf9f9f9),
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 12.w,
                            right: 12.w,
                            top: 15.w,
                            bottom: 6.w,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: CommonText(
                                  text: 'Time',
                                  fontSize: AppFontSizes.fontMedium,
                                  fontWeight: AppFontWeights.semiBold,
                                  color: AppColors.blackColor,
                                ),
                              ),
                              CommonText(
                                text: 'Fee',
                                fontSize: AppFontSizes.fontMedium,
                                fontWeight: AppFontWeights.semiBold,
                                color: AppColors.blackColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(color: AppColors.borderColor, height: 1),
                      Spacing.height(10),
                      _PolicyRow(
                        time: 'Before 6 hours',
                        fee: 'FREE',
                        feeColor: AppColors.successGreen,
                      ),

                      const _PolicyRow(
                        time: 'From 6 hours to 2 hours',
                        fee: 'Up to ₹100',
                      ),

                      const _PolicyRow(
                        time: 'Within 2 hours of booking time',
                        fee: 'Up to ₹200',
                      ),
                      Spacing.height(14),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                        child: DottedLine(
                          direction: Axis.horizontal,
                          lineLength: double.infinity,
                          lineThickness: 1.0,
                          dashLength: 4.0,
                          dashColor: AppColors.grey300,
                          dashGapLength: 3.0,
                          dashGapColor: Colors.transparent,
                        ),
                      ),
                      Spacing.height(12),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                        child: CommonText(
                          text:
                              'No fee if the professional is delayed or not assigned',
                          fontSize: AppFontSizes.fontSmall,
                          fontWeight: AppFontWeights.semiBold,
                          color: AppColors.successGreen,
                          softWrap: true,
                        ),
                      ),

                      Spacing.height(18),
                      Container(
                        color: Color(0xFFfef9ed),
                        padding: EdgeInsets.all(14.r),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 50.h,
                              child: Image.network(
                                "https://img.magnific.com/free-vector/woman-with-long-brown-hair-pink-shirt_90220-2940.jpg?semt=ais_hybrid&w=740&q=80",
                              ),
                            ),
                            Spacing.width(10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonText(
                                    text:
                                        '100% fee goes to service professional',
                                    fontSize: AppFontSizes.fontXMedium,
                                    fontWeight: AppFontWeights.semiBold,
                                    color: AppColors.blackColor,
                                    softWrap: true,
                                  ),

                                  Spacing.height(3),

                                  CommonText(
                                    text:
                                        "Our Professionals work hard and they can't get another booking if you cancel at the last moment.",
                                    fontSize: AppFontSizes.fontSmall,
                                    color: AppColors.greyColor,
                                    fontWeight: AppFontWeights.medium,
                                    softWrap: true,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Spacing.height(16),

              ],
            ),
          ),
        ),

        Positioned(
          top: -38.h,
          right: 16.w,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 30.h,
              width: 30.w,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.close, color: Colors.black, size: 20.sp),
            ),
          ),
        ),
      ],
    );
  }
}

class _PolicyRow extends StatelessWidget {
  final String time;
  final String fee;
  final Color? feeColor;

  const _PolicyRow({required this.time, required this.fee, this.feeColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 12.w),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: CommonText(
              text: time,
              fontSize: AppFontSizes.fontSmall,
              color: AppColors.blackColor,
              softWrap: true,
            ),
          ),
          CommonText(
            text: fee,
            fontSize: AppFontSizes.fontSmall,
            fontWeight: AppFontWeights.semiBold,
            color: feeColor ?? AppColors.blackColor,
          ),
        ],
      ),
    );
  }
}
