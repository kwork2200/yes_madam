import 'package:flutter/animation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ReferEarnController extends GetxController  with GetSingleTickerProviderStateMixin  {
  final String referralCode = 'V271TZ';
  final RxInt coinBalance = 0.obs;
  final RxInt referralCount = 0.obs;
  final RxString selectedTab = 'ALL'.obs;
  final RxMap<int, bool> expandedFaqs = <int, bool>{}.obs;

  var showFirst = true.obs;

  late AnimationController animController;
  late Animation<double> fadeAnim;

  @override
  void onInit() {
    super.onInit();

    animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    fadeAnim = CurvedAnimation(
      parent: animController,
      curve: Curves.easeIn,
    );

    _startLoop();
  }

  void _startLoop() async {
    while (true) {
      showFirst.value = true;
      animController.forward(from: 0);

      await Future.delayed(const Duration(seconds: 2));

      showFirst.value = false;
      animController.forward(from: 0);

      await Future.delayed(const Duration(seconds: 2));
    }
  }

  @override
  void onClose() {
    animController.dispose();
    super.onClose();
  }

  final List<Map<String, dynamic>> milestones = [
    {'label': '1st referral', 'coins': 150},
    {'label': '2nd referral', 'coins': 175},
    {'label': '3rd referral', 'coins': 200},
    {'label': '4th referral', 'coins': 225},
  ];

  final Map<String, dynamic> fifthReferralReward = {
    'coins': 250,
    'freeService': 'Full Arms + Underarms Wax...',
    'isBrandAmbassador': true,
  };

  final List<Map<String, String>> faqs = [
    {
      'question': 'How do I refer a friend and receive referral rewards?',
      'answer':
      'Share your referral code with a friend. When they sign up and make their first booking using your code, you earn coins automatically.',
    },
    {
      'question': 'Is there a limit to how many coins I can use at once?',
      'answer':
      'You can use up to ₹200 worth of coins in a single transaction.',
    },
    {
      'question': 'Do my referral coins expire?',
      'answer': 'Referral coins are valid for 6 months from the date of credit.',
    },
    {
      'question': "Do my friend's (referee) coins expire?",
      'answer':
      "Your friend's 125 welcome coins are valid for 6 months from sign-up.",
    },
    {
      'question': 'What will my friend (referee) receive when they sign up?',
      'answer': 'Your friend will receive 125 coins upon signing up using your referral code.',
    },
    {
      'question': 'Can referees use the coins as a discount?',
      'answer': 'Yes, referees can use their coins as a discount on any service.',
    },
    {
      'question': "Will my friend's (referee) coins expire?",
      'answer': "Yes, referee coins expire 6 months after they are credited.",
    },
    {
      'question': 'How can I avail free services as a Brand Ambassador?',
      'answer':
      'Reach your 5th referral milestone to unlock a free service coupon and become a Brand Ambassador.',
    },
    {
      'question':
      'Can I use a free service coupon, referral coin discount and wallet discount at the same time?',
      'answer':
      'No, only one discount type can be applied per booking.',
    },
    {
      'question': 'Will Elite discount be applicable with referral discount?',
      'answer': 'No, Elite and referral discounts cannot be combined.',
    },
    {
      'question': 'When do free service coupons expire?',
      'answer': 'Free service coupons expire 30 days after they are issued.',
    },
    {
      'question': 'Can I share my free service coupon code with others?',
      'answer': 'No, free service coupons are non-transferable and can only be used on your account.',
    },
    {
      'question': 'Can I track my referrals and rewards?',
      'answer': 'Yes, you can track all referrals and reward history in the Referral Coins section.',
    },
  ];

  void copyReferralCode() {
    Clipboard.setData(ClipboardData(text: referralCode));
    Get.snackbar(
      'Copied!',
      'Referral code $referralCode copied to clipboard.',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );
  }

  void inviteViaWhatsApp() {
    Get.snackbar(
      'WhatsApp',
      'Opening WhatsApp to share your referral code...',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );
  }

  void shareReferral() {
    Get.snackbar(
      'Share',
      'Share your referral code: $referralCode',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );
  }

  void setTab(String tab) {
    selectedTab.value = tab;
  }

  void toggleFaq(int index) {
    final isCurrentlyExpanded = expandedFaqs[index] ?? false;

    expandedFaqs.clear();

    if (!isCurrentlyExpanded) {
      expandedFaqs[index] = true;
    }
  }
  bool isMilestoneCompleted(int index) {
    return referralCount.value > index;
  }
}