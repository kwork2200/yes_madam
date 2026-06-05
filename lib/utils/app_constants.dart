
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yes_madam/service/api_const.dart';
import 'package:yes_madam/utils/app_colors.dart';

class AppConstants {

  static showCommonSnackBar({required String message, bool isError = false}) {
    Get.snackbar(
      "",
      message,
      titleText: const SizedBox(),
      backgroundColor: isError ? AppColors.redAccentColor : AppColors.themeColor,
      colorText: isError ? AppColors.whiteColor : AppColors.whiteColor,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.only(bottom: 30, left: 16, right: 16),
      duration: const Duration(seconds: 2),
    );
  }

  static Future<void> openUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  static Future<void> openShoppingUrl() async {
    try {
      await launchUrl(Uri.parse(ApiConstant.shoppingUrl));
    } catch (e) {
      AppConstants.showCommonSnackBar(
        message: 'Could not open shopping page',
        isError: true,
      );
    }
  }

  static Future<void> openWhatsAppWithText(String text) async {
    final uri = Uri.parse(
      'https://api.whatsapp.com/send?text=${Uri.encodeComponent(text)}',
    );
    try {
      final launched = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
      if (!launched) {
        showCommonSnackBar(
          message: 'Could not open WhatsApp',
          isError: true,
        );
      }
    } catch (e) {
      showCommonSnackBar(
        message: 'Could not open WhatsApp',
        isError: true,
      );
    }
  }

  static Future<void> openEmailCompose({
    required String subject,
    required String body,
  }) async {
    final uri = Uri.parse(
      'mailto:?subject=${Uri.encodeComponent(subject)}'
      '&body=${Uri.encodeComponent(body)}',
    );
    try {
      final launched = await launchUrl(uri);
      if (!launched) {
        showCommonSnackBar(
          message: 'Could not open email app',
          isError: true,
        );
      }
    } catch (e) {
      showCommonSnackBar(
        message: 'Could not open email app',
        isError: true,
      );
    }
  }
}



