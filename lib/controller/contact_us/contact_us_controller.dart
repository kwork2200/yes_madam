import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ContactUsController extends GetxController {
  final String phoneNumber = '08064881700';

  void copyPhoneNumber() {
    Clipboard.setData(ClipboardData(text: phoneNumber));

    Get.snackbar(
      'Copied',
      'Phone number copied successfully',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFFF2F2F2),
      titleText: const Text(
        'Copied',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      messageText: const Text(
        'Phone number copied successfully',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}