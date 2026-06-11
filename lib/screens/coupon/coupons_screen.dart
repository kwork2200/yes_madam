import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yes_madam/model/coupon_model.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/widgets/common/common_text.dart';
import 'package:yes_madam/widgets/common/common_text_field.dart';
import 'package:yes_madam/widgets/components/spacing_widget.dart';

class CouponsScreen extends StatefulWidget {
  final List<CouponModel>? availableCoupons;
  final void Function(String code) onApply;

  const CouponsScreen({
    super.key,
    this.availableCoupons,
    required this.onApply,
  });

  @override
  State<CouponsScreen> createState() => _CouponsScreenState();
}

class _CouponsScreenState extends State<CouponsScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool hasCoupons =
        widget.availableCoupons != null && widget.availableCoupons!.isNotEmpty;

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0.5,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 22.sp,
            color: AppColors.blackColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: false,
        title: CommonText(
          text: 'Your Coupons',
          fontSize: AppFontSizes.fontXMedium,
          fontWeight: AppFontWeights.bold,
          color: AppColors.blackColor,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            CommonTextField(
              controller: _controller,
              hintText: 'Enter Coupon Code',
              filled: true,
              fillColor: AppColors.whiteColor,
              hintStyle: TextStyle(
                fontSize: AppFontSizes.fontSmall,
                fontWeight: FontWeight.bold,
                color: AppColors.greyColor,
              ),
              suffixIcon: TextButton(
                onPressed: () {
                  if (_controller.text.trim().isNotEmpty) {
                    widget.onApply(_controller.text.trim());
                  }
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  minimumSize: Size(0, 0),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  'APPLY',
                  style: TextStyle(
                    fontSize: AppFontSizes.fontMedium,
                    fontWeight: AppFontWeights.medium,
                    color: AppColors.greyColor,
                  ),
                ),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 14.w,
                vertical: 12.h,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: AppColors.inputBorderColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: AppColors.themeColor, width: 1.5),
              ),
            ),
            Spacing.height(16),
            Align(
              alignment: Alignment.centerLeft,
              child: CommonText(
                text: 'Available Coupons',
                fontSize: AppFontSizes.fontMedium,
                fontWeight: AppFontWeights.medium,
                color: AppColors.blackColor,
              ),
            ),
            Spacing.height(20),
            Expanded(
              child: !hasCoupons
                  ? Center(
                      child: CommonText(
                        text: 'No coupons available at the moment.',
                        fontSize: AppFontSizes.fontMedium,
                        color: AppColors.greyColor,
                      ),
                    )
                  : ListView.separated(
                      itemCount: widget.availableCoupons!.length,
                      separatorBuilder: (_, __) => Spacing.height(10),
                      itemBuilder: (_, index) {
                        final coupon = widget.availableCoupons![index];
                        return CouponCard(
                          coupon: coupon,
                          onApply: () => widget.onApply(coupon.code),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class CouponCard extends StatefulWidget {
  final CouponModel coupon;
  final VoidCallback onApply;

  const CouponCard({super.key, required this.coupon, required this.onApply});

  @override
  State<CouponCard> createState() => _CouponCardState();
}

class _CouponCardState extends State<CouponCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: AppColors.borderColor),
          ),
          child: IntrinsicHeight(
            child: Row(
              children: [
                Container(
                  width: 36.w,
                  decoration: BoxDecoration(
                    color: AppColors.themeColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.r),
                      bottomLeft: Radius.circular(10.r),
                    ),
                  ),
                  child: Center(
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: CommonText(
                        text: widget.coupon.tagLabel,
                        fontSize: AppFontSizes.fontSmall,
                        fontWeight: AppFontWeights.extraBold,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(12.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonText(
                              text: widget.coupon.code,
                              fontSize: AppFontSizes.fontXMedium,
                              fontWeight: AppFontWeights.bold,
                              color: AppColors.blackColor,
                            ),
                            GestureDetector(
                              onTap: widget.onApply,
                              child: CommonText(
                                text: 'APPLY',
                                fontSize: AppFontSizes.fontSmall,
                                fontWeight: AppFontWeights.bold,
                                color: AppColors.themeColor,
                              ),
                            ),
                          ],
                        ),
                        Spacing.height(4),
                        CommonText(
                          text: widget.coupon.title,
                          fontSize: AppFontSizes.fontNenoSmall,
                          fontWeight: AppFontWeights.semiBold,
                          color: AppColors.green,
                        ),
                        Spacing.height(8),
                        DottedLine(dashColor: AppColors.grey300),
                        Spacing.height(8),
                        CommonText(
                          text: widget.coupon.description,
                          fontSize: AppFontSizes.fontSmall,
                          fontWeight: AppFontWeights.medium,
                          color: AppColors.blackColor,
                          softWrap: true,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isExpanded = !isExpanded;
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: 6.h),
                            child: CommonText(
                              text: isExpanded ? '- HOW TO REDEEM' : '+ HOW TO REDEEM',
                              fontSize: AppFontSizes.fontNenoSmall,
                              fontWeight: AppFontWeights.semiBold,
                              color: AppColors.themeColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (isExpanded)
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: AppColors.grey100,
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: Padding(
              padding:  EdgeInsets.all(8.0.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text: 'Terms & conditions Apply',
                    fontSize: AppFontSizes.fontSmall,
                    fontWeight: AppFontWeights.bold,
                    color: AppColors.blackColor,
                  ),

                  Spacing.height(8),

                  ...widget.coupon.termsList.map(
                    (term) => Padding(
                      padding: EdgeInsets.only(bottom: 6.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 5.h,
                            width: 5.w,
                            margin: EdgeInsets.only(top: 5.h),
                            decoration: BoxDecoration(
                              color: AppColors.greyColor,
                              shape: BoxShape.circle,
                            ),
                          ),

                          Spacing.width(6),

                          Expanded(
                            child: CommonText(
                              text: term,
                              fontSize: AppFontSizes.fontSmall,
                              color: AppColors.greyColor,
                              fontWeight: AppFontWeights.semiBold,
                              softWrap: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
