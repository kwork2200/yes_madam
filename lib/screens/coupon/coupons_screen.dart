import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yes_madam/model/coupon_model.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/widgets/common/common_text.dart';
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
    final bool hasCoupons = widget.availableCoupons != null && widget.availableCoupons!.isNotEmpty;

    return Scaffold(
      backgroundColor: AppColors.backgroundGrey,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0.5,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 22.sp, color: AppColors.blackColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: CommonText(
          text: 'Your Coupons',
          fontSize: AppFontSizes.fontXMedium,
          fontWeight: AppFontWeights.bold,
          color: AppColors.blackColor,
        ),
      ),
      body: Column(
        children: [
          Container(
            color: AppColors.whiteColor,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    textCapitalization: TextCapitalization.characters,
                    style: TextStyle(
                      fontSize: AppFontSizes.fontMedium,
                      color: AppColors.blackColor,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Enter Coupon Code',
                      hintStyle: TextStyle(
                        fontSize: AppFontSizes.fontMedium,
                        color: AppColors.textHintColor,
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide(color: AppColors.inputBorderColor),
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
                  ),
                ),
                Spacing.width(10),
                TextButton(
                  onPressed: () {
                    if (_controller.text.trim().isNotEmpty) {
                      widget.onApply(_controller.text.trim());
                    }
                  },
                  child: CommonText(
                    text: 'APPLY',
                    fontSize: AppFontSizes.fontMedium,
                    fontWeight: AppFontWeights.bold,
                    color: AppColors.themeColor,
                  ),
                ),
              ],
            ),
          ),
          Spacing.height(12),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Align(
              alignment: Alignment.centerLeft,
              child: CommonText(
                text: 'Available Coupons',
                fontSize: AppFontSizes.fontXMedium,
                fontWeight: AppFontWeights.bold,
                color: AppColors.blackColor,
              ),
            ),
          ),
          Spacing.height(10),
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
              padding: EdgeInsets.symmetric(horizontal: 16.w),
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
    );
  }
}

class CouponCard extends StatelessWidget {
  final CouponModel coupon;
  final VoidCallback onApply;

  const CouponCard({super.key, required this.coupon, required this.onApply});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColors.borderColor),
      ),
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
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: RotatedBox(
              quarterTurns: 3,
              child: CommonText(
                text: coupon.tagLabel,
                fontSize: AppFontSizes.fontNenoSmall,
                fontWeight: AppFontWeights.bold,
                color: AppColors.whiteColor,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonText(
                        text: coupon.code,
                        fontSize: AppFontSizes.fontXMedium,
                        fontWeight: AppFontWeights.bold,
                        color: AppColors.blackColor,
                      ),
                      GestureDetector(
                        onTap: onApply,
                        child: CommonText(
                          text: 'APPLY',
                          fontSize: AppFontSizes.fontMedium,
                          fontWeight: AppFontWeights.bold,
                          color: AppColors.themeColor,
                        ),
                      ),
                    ],
                  ),
                  Spacing.height(4),
                  CommonText(
                    text: coupon.title,
                    fontSize: AppFontSizes.fontSmall,
                    fontWeight: AppFontWeights.semiBold,
                    color: AppColors.themeColor,
                    softWrap: true,
                  ),
                  Spacing.height(4),
                  CommonText(
                    text: coupon.description,
                    fontSize: AppFontSizes.fontSmall,
                    color: AppColors.greyColor,
                    softWrap: true,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}