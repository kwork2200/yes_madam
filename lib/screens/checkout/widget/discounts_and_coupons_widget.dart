import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/widgets/common/common_text.dart';
import 'package:yes_madam/widgets/components/spacing_widget.dart';

class DiscountsAndCouponsWidget extends StatefulWidget {
  final int referralCoins;
  final int walletBalance;
  final bool hasCoupons;
  final VoidCallback onRedeemCouponTap;
  final VoidCallback onApplyReferralCodeTap;
  final void Function(DiscountOption? selected) onSelectionChanged;
  final VoidCallback onReferralCoinTap;
  final VoidCallback onWalletTap;

  const DiscountsAndCouponsWidget({
    super.key,
    required this.referralCoins,
    required this.walletBalance,
    required this.hasCoupons,
    required this.onRedeemCouponTap,
    required this.onApplyReferralCodeTap,
    required this.onSelectionChanged,
    required this.onReferralCoinTap,
    required this.onWalletTap,
  });

  @override
  State<DiscountsAndCouponsWidget> createState() =>
      _DiscountsAndCouponsWidgetState();
}

enum DiscountOption { referralCoin, wallet }

class _DiscountsAndCouponsWidgetState extends State<DiscountsAndCouponsWidget> {
  DiscountOption? _selected;

  void _toggle(DiscountOption option) {
    setState(() {
      _selected = _selected == option ? null : option;
    });
    widget.onSelectionChanged(_selected);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(12.r),
            ),
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: 'Discounts & Coupons',
                  fontSize: AppFontSizes.fontXMedium,
                  fontWeight: AppFontWeights.medium,
                  color: AppColors.blackColor,
                ),
                Spacing.height(4),
                CommonText(
                  text: 'You can only choose one of the below options',
                  fontSize: AppFontSizes.fontSmall,
                  color: AppColors.greyColor,
                  fontWeight: AppFontWeights.semiBold,
                ),
                Spacing.height(14),
                _ArrowRow(
                  icon: Icons.local_offer_outlined,
                  iconColor: AppColors.goldColor,
                  label: 'Redeem Coupon',
                  onTap: widget.onRedeemCouponTap,
                ),

                Spacing.height(7),
                Divider(color: AppColors.borderColor, height: 16.h),
                Spacing.height(7),

                _CheckboxRow(
                  icon: Icons.monetization_on_outlined,
                  iconColor: AppColors.orangeAccent,
                  label: 'Referral Coin',
                  showInfo: true,
                  isChecked: _selected == DiscountOption.referralCoin,
                  onToggle: () {
                    widget.onReferralCoinTap();
                    _toggle(DiscountOption.referralCoin);
                  },
                ),
                Spacing.height(7),
                Divider(color: AppColors.borderColor, height: 16.h),
                Spacing.height(7),
                _CheckboxRow(
                  icon: Icons.account_balance_wallet_outlined,
                  iconColor: AppColors.blackColor,
                  label: 'YesMadam Wallet',
                  showInfo: true,
                  isChecked: _selected == DiscountOption.wallet,
                  onToggle: () {
                    widget.onWalletTap();
                    _toggle(DiscountOption.wallet);
                  },
                ),
              ],
            ),
          ),
          Spacing.height(12),
          Container(
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(12.r),
            ),
            padding: EdgeInsets.all(16.w),
            child: _ArrowRow(
              icon: Icons.card_giftcard_outlined,
              iconColor: AppColors.blackColor,
              label: 'Apply referral code',
              onTap: widget.onApplyReferralCodeTap,
            ),
          ),
        ],
      ),
    );
  }
}

class _ArrowRow extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;
  final VoidCallback onTap;

  const _ArrowRow({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, size: 18.sp, color: iconColor),
          Spacing.width(10),
          Expanded(
            child: CommonText(
              text: label,
              fontSize: AppFontSizes.fontSmall,
              color: AppColors.blackColor,
            ),
          ),
          Icon(Icons.chevron_right, size: 22.sp, color: AppColors.black54),
        ],
      ),
    );
  }
}

class _CheckboxRow extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;
  final bool showInfo;
  final bool isChecked;
  final VoidCallback onToggle;

  const _CheckboxRow({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.isChecked,
    required this.onToggle,
    this.showInfo = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onToggle,
      child: Row(
        children: [
          Icon(icon, size: 22.sp, color: iconColor),
          Spacing.width(8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CommonText(
                      text: label,
                      fontSize: AppFontSizes.fontSmall,
                      color: AppColors.blackColor,
                    ),
                    if (showInfo) ...[
                      Spacing.width(4),
                      Icon(
                        Icons.info_outline,
                        size: 16.sp,
                        color: AppColors.blackColor,
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: 18.w,
            height: 18.h,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(4.r),
              border: Border.all(
                color: isChecked ? AppColors.themeColor : AppColors.blackColor,
                width: 1.5,
              ),
              color: isChecked ? AppColors.themeColor : AppColors.whiteColor,
            ),
            child: isChecked
                ? Icon(Icons.check, size: 14.sp, color: AppColors.whiteColor)
                : null,
          ),
        ],
      ),
    );
  }
}
