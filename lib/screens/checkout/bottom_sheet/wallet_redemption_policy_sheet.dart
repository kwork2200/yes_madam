import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/widgets/common/common_text.dart';
import 'package:yes_madam/widgets/components/spacing_widget.dart';

class WalletRedemptionPolicySheet extends StatelessWidget {
  final int walletBalance;

  const WalletRedemptionPolicySheet({
    super.key,
    required this.walletBalance,
  });

  static void show(
      BuildContext context, {
        required int walletBalance,
      }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24.r),
        ),
      ),
      builder: (_) => WalletRedemptionPolicySheet(
        walletBalance: walletBalance,
      ),
    );
  }

  static final List<Map<String, String>> redemptionList = [
    {
      "bookingAmount": "Less than ₹800",
      "redeemAmount": "₹0",
    },
    {
      "bookingAmount": "₹801 to ₹1200",
      "redeemAmount": "₹50",
    },
    {
      "bookingAmount": "₹1201 to ₹1500",
      "redeemAmount": "₹75",
    },
    {
      "bookingAmount": "More than ₹1500",
      "redeemAmount": "₹100",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                text: 'Wallet Redemption Policy',
                fontSize: AppFontSizes.fontXMedium,
                fontWeight: AppFontWeights.bold,
                color: AppColors.blackColor,
              ),

              Spacing.height(12),

              CommonText(
                text:
                'Wallet will be redeemable based on your booking amount.',
                fontSize: AppFontSizes.fontSmall,
                color: AppColors.blackColor,
                softWrap: true,
              ),

              Spacing.height(16),

              Row(
                children: [
                  CommonText(
                    text: 'Available Balance: ',
                    fontSize: AppFontSizes.fontXMedium,
                    fontWeight: AppFontWeights.bold,
                    color: AppColors.blackColor,
                  ),
                  CommonText(
                    text: '₹$walletBalance',
                    fontSize: AppFontSizes.fontXMedium,
                    fontWeight: AppFontWeights.bold,
                    color: AppColors.themeColor,
                  ),
                ],
              ),

              Spacing.height(14),

              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  child: Column(
                    children: [
                      _row(
                        "Booking Amount",
                        "Redeem Amount",
                        true,
                      ),

                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: redemptionList.length,
                        itemBuilder: (context, index) {
                          final item = redemptionList[index];

                          return _row(
                            item["bookingAmount"] ?? "",
                            item["redeemAmount"] ?? "",
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),

              Spacing.height(20),
            ],
          ),
        ),

        Positioned(
          top: -38,
          right: 16,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
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

  Widget _row(
      String left,
      String right, [
        bool isHeader = false,
      ]) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        children: [
          Expanded(
            child: CommonText(
              text: left,
              fontSize: AppFontSizes.fontSmall,
              fontWeight: isHeader
                  ? AppFontWeights.bold
                  : AppFontWeights.normal,
              color: AppColors.blackColor,
            ),
          ),
          Expanded(
            child: CommonText(
              text: right,
              textAlign: TextAlign.center,
              fontSize: AppFontSizes.fontSmall,
              fontWeight: isHeader
                  ? AppFontWeights.bold
                  : AppFontWeights.normal,
              color: AppColors.blackColor,
            ),
          ),
        ],
      ),
    );
  }
}