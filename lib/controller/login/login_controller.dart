import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yes_madam/routes/app_routes.dart';

class LoginController extends GetxController {
  final phoneController = TextEditingController();

  final RxBool isWhatsAppChecked = true.obs;
  final RxBool isPhoneValid = false.obs;

  @override
  void onInit() {
    super.onInit();

    phoneController.addListener(() {
      isPhoneValid.value = phoneController.text.trim().length == 10;
    });
  }

  void sendOtp() {
    if (!isPhoneValid.value) return;

    Get.toNamed(
      AppRoutes.otp,
      arguments: phoneController.text.trim(),
    );
  }

  void skip() {
    Get.offNamed(AppRoutes.checkout);
    // Get.offNamed(AppRoutes.location);
  }

  @override
  void onClose() {
    phoneController.dispose();
    super.onClose();
  }
}