// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:yes_madam/controller/checkout/checkout_controller.dart';
// import 'package:yes_madam/model/coupon_model.dart';
// import 'package:yes_madam/screens/checkout/bottom_sheet/referral_code_bottom_sheet.dart';
// import 'package:yes_madam/screens/checkout/widget/booking_for_someone_else_section.dart';
// import 'package:yes_madam/screens/checkout/bottom_sheet/cancellation_policy_sheet.dart';
// import 'package:yes_madam/screens/checkout/widget/discounts_and_coupons_widget.dart';
// import 'package:yes_madam/screens/checkout/bottom_sheet/disposable_persons_selector_sheet.dart';
// import 'package:yes_madam/screens/checkout/widget/elite_membership_checkout_widget.dart';
// import 'package:yes_madam/screens/checkout/widget/payment_summary_sheet.dart';
// import 'package:yes_madam/screens/checkout/bottom_sheet/referral_coins_bottom_sheet.dart';
// import 'package:yes_madam/screens/checkout/widget/slot_selection_sheet.dart';
// import 'package:yes_madam/screens/checkout/widget/to_pay_widget.dart';
// import 'package:yes_madam/screens/checkout/bottom_sheet/wallet_redemption_policy_sheet.dart';
// import 'package:yes_madam/screens/coupon/coupons_screen.dart';
// import 'package:yes_madam/screens/home/widgets/home_footer_widget.dart';
// import 'package:yes_madam/utils/app_colors.dart';
// import 'package:yes_madam/utils/app_font_sizes.dart';
// import 'package:yes_madam/utils/app_font_weights.dart';
// import 'package:yes_madam/widgets/common/common_text.dart';
// import 'package:yes_madam/widgets/components/spacing_widget.dart';
//
// class CheckoutScreen extends StatelessWidget {
//   const CheckoutScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<CheckoutController>();
//
//     return Scaffold(
//       backgroundColor: AppColors.backgroundGrey,
//       appBar: AppBar(
//         backgroundColor: AppColors.whiteColor,
//         elevation: 0.5,
//         leading: IconButton(
//           icon: Icon(
//             Icons.arrow_back,
//             size: 22.sp,
//             color: AppColors.blackColor,
//           ),
//           onPressed: () => Get.back(),
//         ),
//         title: CommonText(
//           text: 'Checkout',
//           fontSize: AppFontSizes.fontXMedium,
//           fontWeight: AppFontWeights.bold,
//           color: AppColors.blackColor,
//         ),
//         centerTitle: false,
//         bottom: PreferredSize(
//           preferredSize: Size.fromHeight(32.h),
//           child: Obx(() {
//             return Container(
//               width: double.infinity,
//               padding: EdgeInsets.symmetric(vertical: 10.h),
//               decoration: BoxDecoration(
//                 color: controller.isEliteAdded.value
//                     ? Color(0xFFF0FFF2)
//                     : AppColors.blackColor,
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(30.r),
//                   bottomRight: Radius.circular(30.r),
//                 ),
//               ),
//
//               child: Center(
//                 child: Obx(
//                   () => AnimatedSwitcher(
//                     duration: Duration(milliseconds: 700),
//                     switchInCurve: Curves.easeOut,
//                     switchOutCurve: Curves.easeIn,
//                     transitionBuilder: (child, animation) {
//                       return FadeTransition(
//                         opacity: animation,
//                         child: ScaleTransition(
//                           scale: Tween<double>(
//                             begin: 1.1,
//                             end: 1.0,
//                           ).animate(animation),
//                           child: child,
//                         ),
//                       );
//                     },
//                     child: controller.isEliteAdded.value
//                         ? Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Icon(
//                                 Icons.celebration,
//                                 size: 18.sp,
//                                 color: AppColors.coinOrange,
//                               ),
//                               Spacing.width(6),
//                               CommonText(
//                                 text: 'Hurray!',
//                                 fontSize: 12.sp,
//                                 fontWeight: AppFontWeights.semiBold,
//                                 color: AppColors.green,
//                               ),
//                               CommonText(
//                                 text:
//                                     '  You are saving ₹${controller.eliteSavings} on this booking',
//                                 fontSize: 12.sp,
//                                 fontWeight: FontWeight.w600,
//                                 color: AppColors.blackColor,
//                               ),
//                             ],
//                           )
//                         : _eliteBannerText(
//                             key: ValueKey(controller.showMemberText.value),
//                             isMemberText: controller.showMemberText.value,
//                             eliteSavings: controller.eliteSavings,
//                           ),
//                   ),
//                 ),
//               ),
//             );
//           }),
//         ),
//       ),
//       body: Obx(
//         () => SingleChildScrollView(
//           child: Column(
//             children: [
//               BookingForSomeoneElseSection(controller: controller),
//               Spacing.height(8),
//               EliteMembershipCheckoutWidget(
//                 isAdded: controller.isEliteAdded.value,
//                 price: controller.elitePrice,
//                 mrp: controller.eliteMrp,
//                 duration: '6 Months',
//                 savingsAmount: controller.eliteSavings,
//                 cashbackAmount: controller.cashbackAmount,
//                 onToggle: controller.toggleElite,
//               ),
//               Spacing.height(12),
//               DisposableCostSelector(
//                 costPerPerson: controller.disposableCostPerPerson,
//                 selectedPersons: controller.disposablePersons,
//                 onChanged: controller.setDisposablePersons,
//               ),
//               Spacing.height(8),
//               Container(
//                 color: AppColors.whiteColor,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         _ServiceTab(
//                           label: 'Popular Services',
//                           isSelected: true,
//                         ),
//                         _ServiceTab(
//                           label: 'Skincare & More',
//                           isSelected: false,
//                         ),
//                       ],
//                     ),
//                     Divider(color: AppColors.borderColor, height: 1),
//                     SizedBox(
//                       height: 140.h,
//                       child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         padding: EdgeInsets.symmetric(
//                           horizontal: 16.w,
//                           vertical: 12.h,
//                         ),
//                         itemCount: 4,
//                         itemBuilder: (_, i) => _PopularServiceCard(index: i),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Spacing.height(8),
//               DiscountsAndCouponsWidget(
//                 referralCoins: controller.referralCoins.value,
//                 walletBalance: controller.walletBalance.value,
//                 hasCoupons: true,
//                 onRedeemCouponTap: () => Get.to(
//                   () => CouponsScreen(
//                     availableCoupons: [
//                       CouponModel(
//                         code: 'GET200',
//                         title: 'Get flat Rs. 200 OFF with this coupon',
//                         description:
//                             'Use code GET200 & get Rs. 200 OFF on this booking',
//                         tagLabel: 'FLAT OFF',
//                         termsList: const [
//                           'Applicable only once on this account',
//                           'Offer can not be clubbed with wallet, referral earnings or any other coupon',
//                           'offer valid till 10 June, 2026 04:27 PM',
//                         ],
//                       ),
//                     ],
//                     onApply: (code) {
//                       controller.applyCoupon(code);
//                       Get.back();
//                     },
//                   ),
//                 ),
//                 onApplyReferralCodeTap: () {
//                   ReferralCodeBottomSheet.show(context, controller);
//                 },
//                 onSelectionChanged: (option) {
//                   if (option == null) {
//                     controller.setDiscountType(DiscountType.none);
//                   } else if (option == DiscountOption.referralCoin) {
//                     controller.setDiscountType(DiscountType.referralCoin);
//                   } else if (option == DiscountOption.wallet) {
//                     controller.setDiscountType(DiscountType.wallet);
//                   }
//                 },
//                 onReferralCoinTap: () {
//                   ReferralCoinsBottomSheet.show(
//                     context,
//                     controller.referralCoins.value,
//                   );
//                 },
//                 onWalletTap: () {
//                   WalletRedemptionPolicySheet.show(
//                     context,
//                     walletBalance: controller.walletBalance.value,
//                   );
//                 },
//               ),
//               Spacing.height(8),
//               Obx(
//                 () => ToPayWidget(
//                   originalAmount: controller.originalToPay,
//                   finalAmount: controller.toPay,
//                   savedAmount: controller.totalSaved,
//                   savingsMessage: controller.savingsMessage.isNotEmpty
//                       ? controller.savingsMessage
//                       : null,
//
//                   isAdded: controller.isEliteAdded.value,
//
//                   onToggle: () {
//                     controller.isEliteAdded.toggle();
//                   },
//
//                   onTap: () => PaymentSummarySheet.show(
//                     context,
//                     PaymentSummarySheet(
//                       itemTotal: controller.itemTotal,
//                       discountedTotal: controller.itemDiscounted,
//                       savedAmount: controller.itemSaved,
//                       variableCosts: controller.disposableCost,
//                       platformFeeAndTaxes: controller.platformFee,
//                       toPay: controller.toPay,
//                       cashbackAmount: controller.cashbackAmount,
//                     ),
//                   ),
//                 ),
//               ),
//               Spacing.height(8),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: AppColors.whiteColor,
//                     borderRadius: BorderRadius.circular(16.r),
//                   ),
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 16.w,
//                     vertical: 14.h,
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       CommonText(
//                         text: 'Cancellation Policy',
//                         fontSize: AppFontSizes.fontXMedium,
//                         fontWeight: AppFontWeights.medium,
//                         color: AppColors.blackColor,
//                       ),
//                       Spacing.height(6),
//                       CommonText(
//                         text:
//                             'Fee will be charged for last-minute cancellation. No fee before 6 hours of schedule time.',
//                         fontSize: AppFontSizes.fontSmall,
//                         fontWeight: AppFontWeights.normal,
//
//                         color: AppColors.black54,
//                         softWrap: true,
//                       ),
//                       Spacing.height(8),
//                       GestureDetector(
//                         onTap: () => CancellationPolicySheet.show(context),
//                         child: CommonText(
//                           text: 'READ POLICY',
//                           fontSize: AppFontSizes.fontNenoSmall,
//                           fontWeight: AppFontWeights.bold,
//                           color: AppColors.themeColor,
//                           decoration: TextDecoration.underline,
//                           decorationColor: AppColors.themeColor,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               if (controller.isSlotSelected)
//                 Container(
//                   color: AppColors.whiteColor,
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 16.w,
//                     vertical: 14.h,
//                   ),
//                   child: Row(
//                     children: [
//                       Icon(
//                         Icons.calendar_today_outlined,
//                         size: 18.sp,
//                         color: AppColors.greyColor,
//                       ),
//                       Spacing.width(8),
//                       Expanded(
//                         child: Obx(
//                           () => CommonText(
//                             text:
//                                 controller.selectedSlot.value?.formatted ?? '',
//                             fontSize: AppFontSizes.fontSmall,
//                             color: AppColors.blackColor,
//                           ),
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           // Reopen slot selection
//                         },
//                         child: CommonText(
//                           text: 'CHANGE',
//                           fontSize: AppFontSizes.fontSmall,
//                           fontWeight: AppFontWeights.bold,
//                           color: AppColors.themeColor,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               HomeFooterWidget(),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: Obx(
//         () => Container(
//           color: AppColors.whiteColor,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Container(
//                 color: AppColors.whiteColor,
//                 padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
//                 child: Row(
//                   children: [
//                     Icon(
//                       Icons.location_on_outlined,
//                       size: 20.sp,
//                       color: AppColors.greyColor,
//                     ),
//                     Spacing.width(8),
//
//                     Expanded(
//                       child: Obx(
//                         () => CommonText(
//                           text: controller.selectedAddress.value,
//                           fontSize: AppFontSizes.fontSmall,
//                           color: AppColors.blackColor,
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                     ),
//
//                     Spacing.width(8),
//
//                     GestureDetector(
//                       onTap: () {},
//                       child: CommonText(
//                         text: 'CHANGE',
//                         fontSize: AppFontSizes.fontSmall,
//                         fontWeight: AppFontWeights.bold,
//                         color: AppColors.themeColor,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 color: AppColors.whiteColor,
//                 padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
//                 child: controller.isSlotSelected
//                     ? Row(
//                         children: [
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   children: [
//                                     Icon(
//                                       Icons.payment_outlined,
//                                       size: 16.sp,
//                                       color: AppColors.greyColor,
//                                     ),
//                                     Spacing.width(4),
//                                     CommonText(
//                                       text: 'PAY USING',
//                                       fontSize: AppFontSizes.fontSmall,
//                                       color: AppColors.greyColor,
//                                     ),
//                                     Icon(
//                                       Icons.keyboard_arrow_down,
//                                       size: 16.sp,
//                                       color: AppColors.greyColor,
//                                     ),
//                                   ],
//                                 ),
//                                 Obx(
//                                   () => CommonText(
//                                     text: controller.paymentMethod.value,
//                                     fontSize: AppFontSizes.fontSmall,
//                                     fontWeight: AppFontWeights.semiBold,
//                                     color: AppColors.blackColor,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//
//                           Spacing.width(12),
//
//                           Obx(
//                             () => ElevatedButton(
//                               onPressed: controller.canBookNow
//                                   ? controller.placeOrder
//                                   : null,
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: AppColors.themeColor,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10.r),
//                                 ),
//                                 padding: EdgeInsets.symmetric(
//                                   horizontal: 20.w,
//                                   vertical: 14.h,
//                                 ),
//                               ),
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   CommonText(
//                                     text: '₹${controller.toPay}',
//                                     fontSize: AppFontSizes.fontSmall,
//                                     fontWeight: AppFontWeights.bold,
//                                     color: AppColors.whiteColor,
//                                   ),
//                                   CommonText(
//                                     text: 'TOTAL',
//                                     fontSize: AppFontSizes.fontNenoSmall,
//                                     color: AppColors.whiteColor.withOpacity(
//                                       0.8,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//
//                           Spacing.width(8),
//
//                           Obx(
//                             () => ElevatedButton(
//                               onPressed: controller.canBookNow
//                                   ? controller.placeOrder
//                                   : null,
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: AppColors.themeColor,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10.r),
//                                 ),
//                                 padding: EdgeInsets.symmetric(
//                                   horizontal: 20.w,
//                                   vertical: 14.h,
//                                 ),
//                               ),
//                               child: Row(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   CommonText(
//                                     text: 'Book Now',
//                                     fontSize: AppFontSizes.fontMedium,
//                                     fontWeight: AppFontWeights.bold,
//                                     color: AppColors.whiteColor,
//                                   ),
//                                   Spacing.width(4),
//                                   Icon(
//                                     Icons.chevron_right,
//                                     color: AppColors.whiteColor,
//                                     size: 18.sp,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       )
//                     : SizedBox(
//                         width: double.infinity,
//                         child: ElevatedButton(
//                           onPressed: () => SlotSelectionSheet.show(
//                             context,
//                             professionals: [ProfessionalType(label: 'Prime')],
//                             availableDates: List.generate(
//                               5,
//                               (i) => DateTime.now().add(Duration(days: i)),
//                             ),
//                             timeSlots: [
//                               TimeSlot(label: '07:00 AM', surgePrice: 100),
//                               TimeSlot(label: '07:30 AM', surgePrice: 100),
//                               TimeSlot(label: '08:00 AM', surgePrice: 50),
//                               TimeSlot(label: '08:30 AM', surgePrice: 50),
//                               TimeSlot(label: '09:00 AM'),
//                               TimeSlot(label: '09:30 AM'),
//                               TimeSlot(label: '10:00 AM'),
//                               TimeSlot(label: '10:30 AM'),
//                               TimeSlot(label: '11:00 AM'),
//                               TimeSlot(label: '11:30 AM'),
//                               TimeSlot(label: '12:00 PM'),
//                               TimeSlot(label: '12:30 PM'),
//                             ],
//                             onConfirm: (_, date, slot) =>
//                                 controller.confirmSlot(date, slot.label),
//                           ),
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: AppColors.themeColor,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10.r),
//                             ),
//                             padding: EdgeInsets.symmetric(vertical: 16.h),
//                           ),
//                           child: CommonText(
//                             text: 'SELECT SLOT',
//                             fontSize: AppFontSizes.fontMedium,
//                             fontWeight: AppFontWeights.bold,
//                             color: AppColors.whiteColor,
//                           ),
//                         ),
//                       ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _eliteBannerText({
//     required Key key,
//     required bool isMemberText,
//     required int eliteSavings,
//   }) {
//     return RichText(
//       key: key,
//       textAlign: TextAlign.center,
//       text: TextSpan(
//         children: isMemberText
//             ? [
//                 TextSpan(
//                   text: '1,432,700+ ',
//                   style: TextStyle(
//                     fontSize: AppFontSizes.fontSmall,
//                     fontWeight: AppFontWeights.bold,
//                     color: AppColors.goldColor,
//                   ),
//                 ),
//                 TextSpan(
//                   text: 'members are already using ',
//                   style: TextStyle(
//                     fontSize: AppFontSizes.fontSmall,
//                     color: AppColors.whiteColor,
//                   ),
//                 ),
//                 TextSpan(
//                   text: 'Elite',
//                   style: TextStyle(
//                     fontSize: AppFontSizes.fontSmall,
//                     fontWeight: AppFontWeights.bold,
//                     color: AppColors.goldColor,
//                   ),
//                 ),
//               ]
//             : [
//                 TextSpan(
//                   text: 'Save ',
//                   style: TextStyle(
//                     fontSize: AppFontSizes.fontSmall,
//                     color: AppColors.whiteColor,
//                   ),
//                 ),
//                 TextSpan(
//                   text: '₹$eliteSavings ',
//                   style: TextStyle(
//                     fontSize: AppFontSizes.fontSmall,
//                     fontWeight: AppFontWeights.bold,
//                     color: AppColors.goldColor,
//                   ),
//                 ),
//                 TextSpan(
//                   text: 'on this booking with ',
//                   style: TextStyle(
//                     fontSize: AppFontSizes.fontSmall,
//                     color: AppColors.whiteColor,
//                   ),
//                 ),
//                 TextSpan(
//                   text: 'Elite',
//                   style: TextStyle(
//                     fontSize: AppFontSizes.fontSmall,
//                     fontWeight: AppFontWeights.bold,
//                     color: AppColors.goldColor,
//                   ),
//                 ),
//               ],
//       ),
//     );
//   }
// }
//
// class _ServiceTab extends StatelessWidget {
//   final String label;
//   final bool isSelected;
//   const _ServiceTab({required this.label, required this.isSelected});
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Container(
//         padding: EdgeInsets.symmetric(vertical: 12.h),
//         decoration: BoxDecoration(
//           border: Border(
//             bottom: BorderSide(
//               color: isSelected ? AppColors.themeColor : Colors.transparent,
//               width: 2,
//             ),
//           ),
//         ),
//         child: CommonText(
//           text: label,
//           fontSize: AppFontSizes.fontSmall,
//           fontWeight: isSelected
//               ? AppFontWeights.semiBold
//               : AppFontWeights.normal,
//           color: isSelected ? AppColors.themeColor : AppColors.greyColor,
//           textAlign: TextAlign.center,
//         ),
//       ),
//     );
//   }
// }
//
// class _PopularServiceCard extends StatelessWidget {
//   final int index;
//   const _PopularServiceCard({required this.index});
//
//   static const _titles = ['Skin Bright', 'Deep Clean', 'Glow Up', 'Hair Spa'];
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 100.w,
//       margin: EdgeInsets.only(right: 10.w),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(8.r),
//         color: AppColors.lightPinkColor,
//       ),
//       child: Stack(
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(8.r),
//             child: Container(
//               width: 100.w,
//               height: double.infinity,
//               color: AppColors.lightPink,
//             ),
//           ),
//           Positioned(
//             bottom: 6.h,
//             left: 6.w,
//             right: 6.w,
//             child: ElevatedButton(
//               onPressed: () {},
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: AppColors.themeColor,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(4.r),
//                 ),
//                 padding: EdgeInsets.symmetric(vertical: 4.h),
//                 minimumSize: Size.zero,
//                 tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//               ),
//               child: CommonText(
//                 text: 'ADD',
//                 fontSize: AppFontSizes.fontNenoSmall,
//                 fontWeight: AppFontWeights.bold,
//                 color: AppColors.whiteColor,
//               ),
//             ),
//           ),
//           Positioned(
//             top: 8.h,
//             left: 6.w,
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
//               decoration: BoxDecoration(
//                 color: AppColors.successGreen.withOpacity(0.15),
//                 borderRadius: BorderRadius.circular(3.r),
//               ),
//               child: CommonText(
//                 text: _titles[index % _titles.length],
//                 fontSize: AppFontSizes.fontNenoSmall,
//                 color: AppColors.successGreen,
//                 fontWeight: AppFontWeights.semiBold,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yes_madam/controller/checkout/checkout_controller.dart';
import 'package:yes_madam/model/coupon_model.dart';
import 'package:yes_madam/screens/checkout/bottom_sheet/referral_code_bottom_sheet.dart';
import 'package:yes_madam/screens/checkout/widget/booking_for_someone_else_section.dart';
import 'package:yes_madam/screens/checkout/bottom_sheet/cancellation_policy_sheet.dart';
import 'package:yes_madam/screens/checkout/widget/discounts_and_coupons_widget.dart';
import 'package:yes_madam/screens/checkout/bottom_sheet/disposable_persons_selector_sheet.dart';
import 'package:yes_madam/screens/checkout/widget/elite_membership_checkout_widget.dart';
import 'package:yes_madam/screens/checkout/widget/payment_summary_sheet.dart';
import 'package:yes_madam/screens/checkout/bottom_sheet/referral_coins_bottom_sheet.dart';
import 'package:yes_madam/screens/checkout/bottom_sheet/slot_selection_sheet.dart';
import 'package:yes_madam/screens/checkout/widget/to_pay_widget.dart';
import 'package:yes_madam/screens/checkout/bottom_sheet/wallet_redemption_policy_sheet.dart';
import 'package:yes_madam/screens/coupon/coupons_screen.dart';
import 'package:yes_madam/screens/home/widgets/home_footer_widget.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/widgets/common/common_text.dart';
import 'package:yes_madam/widgets/components/spacing_widget.dart';
import 'widget/cart_item_widget.dart';
import 'widget/popular_services_section.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CheckoutController>();

    return Scaffold(
      backgroundColor: AppColors.backgroundGrey,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0.5,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 22.sp,
            color: AppColors.blackColor,
          ),
          onPressed: () => Get.back(),
        ),
        title: CommonText(
          text: 'Checkout',
          fontSize: AppFontSizes.fontXMedium,
          fontWeight: AppFontWeights.bold,
          color: AppColors.blackColor,
        ),
        centerTitle: false,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(32.h),
          child: Obx(() {
            return Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 10.h),
              decoration: BoxDecoration(
                color: controller.isEliteAdded.value
                    ? const Color(0xFFF0FFF2)
                    : AppColors.blackColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.r),
                  bottomRight: Radius.circular(30.r),
                ),
              ),
              child: Center(
                child: Obx(
                  () => AnimatedSwitcher(
                    duration: const Duration(milliseconds: 700),
                    switchInCurve: Curves.easeOut,
                    switchOutCurve: Curves.easeIn,
                    transitionBuilder: (child, animation) => FadeTransition(
                      opacity: animation,
                      child: ScaleTransition(
                        scale: Tween<double>(
                          begin: 1.1,
                          end: 1.0,
                        ).animate(animation),
                        child: child,
                      ),
                    ),
                    child: controller.isEliteAdded.value
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.celebration,
                                size: 18.sp,
                                color: AppColors.coinOrange,
                              ),
                              Spacing.width(6),
                              CommonText(
                                text: 'Hurray!',
                                fontSize: 12.sp,
                                fontWeight: AppFontWeights.semiBold,
                                color: AppColors.green,
                              ),
                              CommonText(
                                text:
                                    '  You are saving ₹${controller.eliteSavings} on this booking',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.blackColor,
                              ),
                            ],
                          )
                        : _eliteBannerText(
                            key: ValueKey(controller.showMemberText.value),
                            isMemberText: controller.showMemberText.value,
                            eliteSavings: controller.eliteSavings,
                          ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),

      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            children: [
              BookingForSomeoneElseSection(controller: controller),
              Spacing.height(8),
              EliteMembershipCheckoutWidget(
                isAdded: controller.isEliteAdded.value,
                price: controller.elitePrice,
                mrp: controller.eliteMrp,
                duration: '6 Months',
                savingsAmount: controller.eliteSavings,
                cashbackAmount: controller.cashbackAmount,
                onToggle: controller.toggleElite,
              ),
              Spacing.height(12),
              // ... Baaki widgets (BookingForSomeoneElseSection, EliteMembershipCheckoutWidget, etc.)

              Spacing.height(12),

// 📦 HARDCODED WIDGETS KI JAGAH IS DYNAMIC LISTVIEW KO RAKHEIN:
              Obx(
                    () => ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(), // Kyunki parent already SingleChildScrollView hai
                  itemCount: controller.cartItems.length,
                  separatorBuilder: (context, index) => Divider(
                    color: Colors.grey.shade200,
                    height: 1,
                  ),
                  itemBuilder: (context, index) {
                    final item = controller.cartItems[index];

                    final RxBool localExpanded = false.obs;

                    return CartItemWidget(
                      title: item.name,
                      price: item.price.toInt(),
                      mrp: (item.mrp ?? (item.price * 1.5)).toInt(),
                      duration: item.duration ?? '1 hr',
                      quantity: item.quantity,
                      subtitle: item.subtitle,
                      onIncrement: () => controller.incrementItem(item.id),
                      onDecrement: () => controller.decrementItem(item.id),
                      serviceCharge: item.serviceCharge,
                      productCost: item.productCost,
                      includedProducts: item.includedProducts,
                      isExpanded: item.id == "1"
                          ? controller.koreanFacialExpanded
                          : (item.id == "2" ? controller.koreanManiExpanded : localExpanded),
                    );
                  },
                ),
              ),
              Spacing.height(8),
              DisposableCostSelector(
                costPerPerson: controller.disposableCostPerPerson,
                selectedPersons: controller.disposablePersons,
                onChanged: controller.setDisposablePersons,
              ),
              Spacing.height(20),
              PopularServicesSection(
                popularServices: controller.popularServices,
                skincareServices: controller.skincareServices,
                selectedTabIndex: controller.selectedTabIndex,
                onAddTap: (service) {},
                onCardTap: (service) {},
              ),
              Spacing.height(8),
              DiscountsAndCouponsWidget(
                referralCoins: controller.referralCoins.value,
                walletBalance: controller.walletBalance.value,
                hasCoupons: true,
                onRedeemCouponTap: () => Get.to(
                  () => CouponsScreen(
                    availableCoupons: [
                      CouponModel(
                        code: 'GET200',
                        title: 'Get flat Rs. 200 OFF with this coupon',
                        description:
                            'Use code GET200 & get Rs. 200 OFF on this booking',
                        tagLabel: 'FLAT OFF',
                        termsList: const [
                          'Applicable only once on this account',
                          'Offer can not be clubbed with wallet, referral earnings or any other coupon',
                          'offer valid till 10 June, 2026 04:27 PM',
                        ],
                      ),
                    ],
                    onApply: (code) {
                      controller.applyCoupon(code);
                      Get.back();
                    },
                  ),
                ),
                onApplyReferralCodeTap: () =>
                    ReferralCodeBottomSheet.show(context, controller),
                onSelectionChanged: (option) {
                  if (option == null) {
                    controller.setDiscountType(DiscountType.none);
                  } else if (option == DiscountOption.referralCoin) {
                    controller.setDiscountType(DiscountType.referralCoin);
                  } else if (option == DiscountOption.wallet) {
                    controller.setDiscountType(DiscountType.wallet);
                  }
                },
                onReferralCoinTap: () => ReferralCoinsBottomSheet.show(
                  context,
                  controller.referralCoins.value,
                ),
                onWalletTap: () => WalletRedemptionPolicySheet.show(
                  context,
                  walletBalance: controller.walletBalance.value,
                ),
              ),
              Spacing.height(8),
              Obx(
                () => ToPayWidget(
                  originalAmount: controller.originalToPay,
                  finalAmount: controller.toPay,
                  savedAmount: controller.totalSaved,
                  savingsMessage: controller.savingsMessage.isNotEmpty
                      ? controller.savingsMessage
                      : null,
                  isAdded: controller.isEliteAdded.value,
                  onToggle: () => controller.isEliteAdded.toggle(),
                  onTap: () => PaymentSummarySheet.show(
                    context,
                    PaymentSummarySheet(
                      itemTotal: controller.itemTotal,
                      discountedTotal: controller.itemDiscounted,
                      savedAmount: controller.itemSaved,
                      variableCosts: controller.disposableCost,
                      platformFeeAndTaxes: controller.platformFee,
                      toPay: controller.toPay,
                      cashbackAmount: controller.cashbackAmount,
                    ),
                  ),
                ),
              ),
              Spacing.height(8),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 14.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: 'Cancellation Policy',
                        fontSize: AppFontSizes.fontXMedium,
                        fontWeight: AppFontWeights.medium,
                        color: AppColors.blackColor,
                      ),
                      Spacing.height(6),
                      CommonText(
                        text:
                            'Fee will be charged for last-minute cancellation. No fee before 6 hours of schedule time.',
                        fontSize: AppFontSizes.fontSmall,
                        fontWeight: AppFontWeights.normal,
                        color: AppColors.black54,
                        softWrap: true,
                      ),
                      Spacing.height(8),
                      GestureDetector(
                        onTap: () => CancellationPolicySheet.show(context),
                        child: CommonText(
                          text: 'READ POLICY',
                          fontSize: AppFontSizes.fontNenoSmall,
                          fontWeight: AppFontWeights.bold,
                          color: AppColors.themeColor,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.themeColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (controller.isSlotSelected)
                Container(
                  color: AppColors.whiteColor,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 14.h,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.calendar_today_outlined,
                        size: 18.sp,
                        color: AppColors.greyColor,
                      ),
                      Spacing.width(8),
                      Expanded(
                        child: Obx(
                          () => CommonText(
                            text:
                                controller.selectedSlot.value?.formatted ?? '',
                            fontSize: AppFontSizes.fontSmall,
                            color: AppColors.blackColor,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: CommonText(
                          text: 'CHANGE',
                          fontSize: AppFontSizes.fontSmall,
                          fontWeight: AppFontWeights.bold,
                          color: AppColors.themeColor,
                        ),
                      ),
                    ],
                  ),
                ),
              HomeFooterWidget(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => Container(
          color: AppColors.whiteColor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: AppColors.whiteColor,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 20.sp,
                      color: AppColors.greyColor,
                    ),
                    Spacing.width(8),
                    Expanded(
                      child: Obx(
                        () => CommonText(
                          text: controller.selectedAddress.value,
                          fontSize: AppFontSizes.fontSmall,
                          color: AppColors.blackColor,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Spacing.width(8),
                    GestureDetector(
                      onTap: () {},
                      child: CommonText(
                        text: 'CHANGE',
                        fontSize: AppFontSizes.fontSmall,
                        fontWeight: AppFontWeights.bold,
                        color: AppColors.themeColor,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: AppColors.whiteColor,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                child: controller.isSlotSelected
                    ? Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.payment_outlined,
                                      size: 16.sp,
                                      color: AppColors.greyColor,
                                    ),
                                    Spacing.width(4),
                                    CommonText(
                                      text: 'PAY USING',
                                      fontSize: AppFontSizes.fontSmall,
                                      color: AppColors.greyColor,
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down,
                                      size: 16.sp,
                                      color: AppColors.greyColor,
                                    ),
                                  ],
                                ),
                                Obx(
                                  () => CommonText(
                                    text: controller.paymentMethod.value,
                                    fontSize: AppFontSizes.fontSmall,
                                    fontWeight: AppFontWeights.semiBold,
                                    color: AppColors.blackColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Spacing.width(12),
                          Obx(
                            () => ElevatedButton(
                              onPressed: controller.canBookNow
                                  ? controller.placeOrder
                                  : null,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.themeColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20.w,
                                  vertical: 14.h,
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CommonText(
                                    text: '₹${controller.toPay}',
                                    fontSize: AppFontSizes.fontSmall,
                                    fontWeight: AppFontWeights.bold,
                                    color: AppColors.whiteColor,
                                  ),
                                  CommonText(
                                    text: 'TOTAL',
                                    fontSize: AppFontSizes.fontNenoSmall,
                                    color: AppColors.whiteColor.withOpacity(
                                      0.8,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Spacing.width(8),
                          Obx(
                            () => ElevatedButton(
                              onPressed: controller.canBookNow
                                  ? controller.placeOrder
                                  : null,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.themeColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20.w,
                                  vertical: 14.h,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CommonText(
                                    text: 'Book Now',
                                    fontSize: AppFontSizes.fontMedium,
                                    fontWeight: AppFontWeights.bold,
                                    color: AppColors.whiteColor,
                                  ),
                                  Spacing.width(4),
                                  Icon(
                                    Icons.chevron_right,
                                    color: AppColors.whiteColor,
                                    size: 18.sp,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    : SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => SlotSelectionSheet.show(
                            context,
                            professionals: [ProfessionalType(label: 'Prime')],
                            availableDates: List.generate(
                              5,
                              (i) => DateTime.now().add(Duration(days: i)),
                            ),
                            timeSlots: [
                              TimeSlot(label: '07:00 AM', surgePrice: 100),
                              TimeSlot(label: '07:30 AM', surgePrice: 100),
                              TimeSlot(label: '08:00 AM', surgePrice: 50),
                              TimeSlot(label: '08:30 AM', surgePrice: 50),
                              TimeSlot(label: '09:00 AM'),
                              TimeSlot(label: '09:30 AM'),
                              TimeSlot(label: '10:00 AM'),
                              TimeSlot(label: '10:30 AM'),
                              TimeSlot(label: '11:00 AM'),
                              TimeSlot(label: '11:30 AM'),
                              TimeSlot(label: '12:00 PM'),
                              TimeSlot(label: '12:30 PM'),
                            ],
                            onConfirm: (_, date, slot) =>
                                controller.confirmSlot(date, slot.label),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.themeColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 16.h),
                          ),
                          child: CommonText(
                            text: 'SELECT SLOT',
                            fontSize: AppFontSizes.fontMedium,
                            fontWeight: AppFontWeights.bold,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _eliteBannerText({
    required Key key,
    required bool isMemberText,
    required int eliteSavings,
  }) {
    return RichText(
      key: key,
      textAlign: TextAlign.center,
      text: TextSpan(
        children: isMemberText
            ? [
                TextSpan(
                  text: '1,432,700+ ',
                  style: TextStyle(
                    fontSize: AppFontSizes.fontSmall,
                    fontWeight: AppFontWeights.bold,
                    color: AppColors.goldColor,
                  ),
                ),
                TextSpan(
                  text: 'members are already using ',
                  style: TextStyle(
                    fontSize: AppFontSizes.fontSmall,
                    color: AppColors.whiteColor,
                  ),
                ),
                TextSpan(
                  text: 'Elite',
                  style: TextStyle(
                    fontSize: AppFontSizes.fontSmall,
                    fontWeight: AppFontWeights.bold,
                    color: AppColors.goldColor,
                  ),
                ),
              ]
            : [
                TextSpan(
                  text: 'Save ',
                  style: TextStyle(
                    fontSize: AppFontSizes.fontSmall,
                    color: AppColors.whiteColor,
                  ),
                ),
                TextSpan(
                  text: '₹$eliteSavings ',
                  style: TextStyle(
                    fontSize: AppFontSizes.fontSmall,
                    fontWeight: AppFontWeights.bold,
                    color: AppColors.goldColor,
                  ),
                ),
                TextSpan(
                  text: 'on this booking with ',
                  style: TextStyle(
                    fontSize: AppFontSizes.fontSmall,
                    color: AppColors.whiteColor,
                  ),
                ),
                TextSpan(
                  text: 'Elite',
                  style: TextStyle(
                    fontSize: AppFontSizes.fontSmall,
                    fontWeight: AppFontWeights.bold,
                    color: AppColors.goldColor,
                  ),
                ),
              ],
      ),
    );
  }
}
