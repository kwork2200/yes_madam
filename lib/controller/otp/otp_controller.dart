import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yes_madam/routes/app_routes.dart';

class OtpController extends GetxController {
  final RxList<TextEditingController> otpControllers = List.generate(4, (_) => TextEditingController()).obs;
  final RxList<FocusNode> otpFocusNodes = List.generate(4, (_) => FocusNode()).obs;

  final RxInt resendTimer = 25.obs;
  final RxBool canResend = false.obs;

  late String phoneNumber;

  @override
  void onInit() {
    super.onInit();
    phoneNumber = Get.arguments ?? '';
    _startResendTimer();
  }

  void _startResendTimer() {
    resendTimer.value = 25;
    canResend.value = false;

    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 1));

      if (resendTimer.value > 0) {
        resendTimer.value--;
        return true;
      }

      canResend.value = true;
      return false;
    });
  }

  void onOtpChanged(String value, int index) {
    if (value.isNotEmpty && index < 3) {
      otpFocusNodes[index + 1].requestFocus();
    }

    if (value.isEmpty && index > 0) {
      otpFocusNodes[index - 1].requestFocus();
    }

    final otp = otpControllers.map((e) => e.text).join();

    if (otp.length == 4) {
      verifyOtp(otp);
    }
  }

  Future<void> verifyOtp(String otp) async {
    await Future.delayed(const Duration(milliseconds: 300));
    Get.offNamed(AppRoutes.location);
  }

  void resendOtp() {
    if (canResend.value) {
      _startResendTimer();
    }
  }

  @override
  void onClose() {
    for (final controller in otpControllers) {
      controller.dispose();
    }
    for (final focusNode in otpFocusNodes) {
      focusNode.dispose();
    }
    super.onClose();
  }
}