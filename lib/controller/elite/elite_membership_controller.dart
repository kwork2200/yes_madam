import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yes_madam/routes/app_routes.dart';

class EliteMembershipController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxString couponCode = ''.obs;
  final TextEditingController couponController = TextEditingController();

  final double originalPrice = 499.0;
  final double discountedPrice = 249.0;
  final double totalAmount = 294.0;
  final int discountPercent = 41;
  final int memberCount = 1076530;
  final expandedList = <bool>[].obs;

  @override
  void onInit() {
    super.onInit();
    initializeFaqs(faqs.length);
  }

  void initializeFaqs(int count) {
    expandedList.assignAll(
      List.generate(count, (_) => false),
    );
  }

  void toggleFaq(int index) {
    faqs[index]['isExpanded'] = !(faqs[index]['isExpanded'] as bool);
    faqs.refresh();
  }

  final RxList<Map<String, dynamic>> faqs = <Map<String, dynamic>>[
    {
      'question': 'What is YesMadam Elite membership?',
      'answer':
      'YesMadam Elite membership is a premium subscription that gives you 10% off on all bookings, 1000 YMCoins on purchase, and many more exclusive benefits.',
      'isExpanded': false,
    },
    {
      'question': 'What is YMCoins?',
      'answer':
      'YMCoins is YesMadam\'s loyalty currency. 1 YMCoin = ₹1. You get 1000 YMCoins on Elite membership purchase which can be used to avail 10% discount on future bookings.',
      'isExpanded': false,
    },
    {
      'question': 'Is there a limit to maximum discount per booking?',
      'answer': 'Yes, maximum discount limit per transaction is ₹100.',
      'isExpanded': false,
    },
    {
      'question':
      'What if my membership ends but the YMCoins balance is still left?',
      'answer':
      'If your membership expires, the YMCoins balance will also expire. Please make sure to use your coins before the membership ends.',
      'isExpanded': false,
    },
    {
      'question': 'What is the tenure of the plan?',
      'answer': 'The Elite membership is valid for 6 months from the date of purchase.',
      'isExpanded': false,
    },
  ].obs;

  void applyCoupon() {
    if (couponController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Please enter a coupon code',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }
    Get.snackbar('Info', 'Invalid coupon code',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white);
  }

  void openPaymentSheet() {
    Get.bottomSheet(
      isScrollControlled: true,
      const SizedBox(),
    );
  }

  void navigateToFaqs() {
    Get.toNamed(AppRoutes.eliteFaqs);
  }

  @override
  void onClose() {
    couponController.dispose();
    super.onClose();
  }
}