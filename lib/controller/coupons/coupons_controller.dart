import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yes_madam/model/coupon_model.dart';

class CouponsController extends GetxController {
  final TextEditingController textController = TextEditingController();
  final RxList<CouponModel> availableCoupons = <CouponModel>[].obs;
  RxBool get hasCoupons => availableCoupons.isNotEmpty.obs;

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }

  void setCoupons(List<CouponModel>? coupons) {
    if (coupons != null) {
      availableCoupons.assignAll(coupons);
    }
  }

  void applyManualCoupon(void Function(String code) onApplyCallback) {
    final String code = textController.text.trim();
    if (code.isNotEmpty) {
      onApplyCallback(code);
    }
  }
}