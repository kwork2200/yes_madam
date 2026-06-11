import 'dart:async';

import 'package:get/get.dart';
import 'package:yes_madam/model/cart_item.dart';
import 'package:yes_madam/model/popular_service_model.dart';
import 'package:yes_madam/model/recipient_model.dart';
import 'package:yes_madam/model/selected_slot_model.dart';

enum DiscountType { none, referralCoin, wallet }

class CheckoutController extends GetxController {

  final RxBool showMemberText = false.obs;
  Timer? _bannerTimer;

  @override
  void onInit() {
    super.onInit();

    initWithCart([
      CartItemModel(
        id: "1",
        name: "Hair Cut",
        price: 199,
        mrp: 399,
        duration: "1 hr 30 min",
        subtitle: "Advanced Haircut | Styling included",
        image: "https://i.pinimg.com/474x/c3/3a/af/c33aafcd594ac2da893ba5e8aa6ae676.jpg",
        quantity: 1,
        serviceCharge: 120,
        productCost: 79,
        includedProducts: ['Disinfectant Spray x 1', 'Hair Serum Cape x 1'],
      ),
      CartItemModel(
        id: "2",
        name: "Facial",
        price: 499,
        mrp: 999,
        duration: "3 hr 60 min",
        subtitle: "9 Steps Facial | Includes FREE silicone facial brush",
        image: "https://swicos.com.my/wp-content/uploads/2025/03/facial-treatment.jpg.webp",
        quantity: 1,
        serviceCharge: 300,
        productCost: 199,
        includedProducts: ['Facial Kit x 1', 'Serum x 1'],
      ),
      CartItemModel(
        id: "3",
        name: "Manicure",
        price: 299,
        mrp: 599,
        duration: "1 hr 45 min",
        subtitle: "Classic Manicure | Hand Massage included",
        image: "https://www.shutterstock.com/image-photo/manicure-pedicure-pink-nails-600nw-2723982651.jpg",
        quantity: 1,
        serviceCharge: 180,
        productCost: 119,
        includedProducts: ['Nail Cleanser x 1', 'Cuticle Oil x 1'],
      ),
      CartItemModel(
        id: "4",
        name: "Pedicure",
        price: 349,
        mrp: 699,
        duration: "2 hr 50 min",
        subtitle: "Relaxing Pedicure | Dead Skin Scrubbing",
        image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZBfWie79mBqW9UJYOpkhTECeNE0k4yzw4zg&s",
        quantity: 1,
        serviceCharge: 200,
        productCost: 149,
        includedProducts: ['Pedicure Salt x 1', 'Scrub Pack x 1'],
      ),
      CartItemModel(
        id: "5",
        name: "Hair Spa",
        price: 799,
        mrp: 1499,
        duration: "1 hr 90 min",
        subtitle: "Deep Conditioning Spa | Steam & Oil treatment",
        image: "https://zanya.co.in/wp-content/uploads/2024/02/woman-getting-hair-treatment.jpg",
        quantity: 1,
        serviceCharge: 450,
        productCost: 349,
        includedProducts: ['Spa Cream Mask x 1', 'Ampoule Serum x 1'],
      ),
    ]);

    _bannerTimer = Timer.periodic(
      const Duration(seconds: 4),
          (_) => showMemberText.toggle(),
    );
  }

  @override
  void onClose() {
    _bannerTimer?.cancel();
    super.onClose();
  }

  final RxList<CartItemModel> cartItems = <CartItemModel>[].obs;

  void initWithCart(List<CartItemModel> items) {
    cartItems.value = List.from(items);
  }

  void incrementItem(String id) {
    final index = cartItems.indexWhere((i) => i.id == id);
    if (index != -1) {
      cartItems[index].quantity++;
      cartItems.refresh();
    }
  }

  void decrementItem(String id) {
    final index = cartItems.indexWhere((i) => i.id == id);
    if (index == -1) return;
    if (cartItems[index].quantity <= 1) {
      cartItems.removeAt(index);
    } else {
      cartItems[index].quantity--;
      cartItems.refresh();
    }
  }

  final RxBool isEliteAdded = false.obs;
  final int elitePrice = 249;
  final int eliteMrp = 499;
  final int eliteSavings = 100;

  void toggleElite() => isEliteAdded.toggle();

  final Rx<RecipientModel?> recipient = Rx<RecipientModel?>(null);

  void setRecipient(String name, String mobile) {
    recipient.value = RecipientModel(name: name, mobile: mobile);
  }

  void clearRecipient() => recipient.value = null;

  final RxInt disposablePersons = 1.obs;
  final int disposableCostPerPerson = 60;

  void setDisposablePersons(int count) => disposablePersons.value = count;

  final Rx<DiscountType> selectedDiscount = DiscountType.none.obs;
  final RxString appliedCouponCode = ''.obs;
  final RxInt couponDiscount = 0.obs;
  final RxInt referralCoins = 120.obs;
  final RxInt walletBalance = 0.obs;

  void setDiscountType(DiscountType type) {
    if (selectedDiscount.value == type) {
      selectedDiscount.value = DiscountType.none;
    } else {
      selectedDiscount.value = type;
      appliedCouponCode.value = '';
      couponDiscount.value = 0;
    }
  }

  void applyCoupon(String code) {
    appliedCouponCode.value = code;
    couponDiscount.value = code.toUpperCase() == 'GET200' ? 200 : 0;
    selectedDiscount.value = DiscountType.none;
  }

  void applyReferralCode(String code) {
    if (code.isNotEmpty) referralCoins.value += 50;
  }

  final Rx<SelectedSlotModel?> selectedSlot = Rx<SelectedSlotModel?>(null);

  void confirmSlot(DateTime date, String timeLabel) {
    selectedSlot.value = SelectedSlotModel(date: date, timeLabel: timeLabel);
  }

  bool get isSlotSelected => selectedSlot.value != null;
  bool get canBookNow => isSlotSelected;

  final RxString selectedAddress =
      'Ffff, , 45, Vallabhacharya Rd, Green Park So...'.obs;
  final RxString paymentMethod = 'Pay with Cash'.obs;

  void changeAddress(String address) => selectedAddress.value = address;
  void setPaymentMethod(String method) => paymentMethod.value = method;

  int get itemTotal =>
      cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity).toInt());

  int get itemDiscounted => itemTotal;
  int get itemSaved => 0;
  int get disposableCost => disposableCostPerPerson * disposablePersons.value;
  int get platformFee => 499;

  int get couponOrDiscountAmount {
    if (appliedCouponCode.value.isNotEmpty) return couponDiscount.value;
    if (selectedDiscount.value == DiscountType.referralCoin) return referralCoins.value;
    if (selectedDiscount.value == DiscountType.wallet) return walletBalance.value;
    return 0;
  }

  int get toPay {
    int total = itemDiscounted + disposableCost + platformFee;
    if (isEliteAdded.value) total += elitePrice;
    total -= couponOrDiscountAmount;
    if (isEliteAdded.value) total -= eliteSavings;
    return total.clamp(0, 999999);
  }

  int get originalToPay => itemTotal + disposableCost + platformFee;
  int get totalSaved => originalToPay - toPay;
  int get cashbackAmount => (toPay * 0.05).round();

  String get savingsMessage =>
      totalSaved > 0 ? 'Hurray! You are saving ₹$totalSaved on this booking' : '';

  void placeOrder() {
    Get.snackbar(
      'Order Placed!',
      'Your booking is confirmed.',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  final RxInt selectedTabIndex = 0.obs;

  final RxBool koreanFacialExpanded = false.obs;
  final RxBool koreanManiExpanded = false.obs;

  final popularServices = [
    const PopularServiceModel(
      title: 'Korean Bikini Wax',
      imageUrl: 'https://rukminim2.flixcart.com/image/480/640/xif0q/hair-removal/b/t/q/100-korean-soft-skin-hard-wax-beans-wax-woongmi-original-imahdvz6hww6prse.jpeg?q=90',
      price: 799,
      mrp: 1499,
      duration: '1 hr',
      badge: null,
    ),
    const PopularServiceModel(
      title: 'Classic Mani & Pedi',
      imageUrl: 'https://envi.in/wp-content/uploads/2023/12/2-2-2.webp',
      price: 787,
      mrp: 1449,
      duration: '1 hr 28 mins',
      badge: null,
    ),
    const PopularServiceModel(
      title: 'Korean Waxing Ritual - Full',
      imageUrl: 'https://dgsjiq2u0d497.cloudfront.net/services/roll_on_underarms.jpg',
      price: 849,
      mrp: 1669,
      duration: '1 hr 15 mins',
      badge: 'Skin Brightening',
    ),
    const PopularServiceModel(
      title: 'Stripless Korean Bikini Wax',
      imageUrl: 'https://www.sokora.com/cdn/shop/files/Korean_wax_Hero_image.webp?v=1750161771',
      price: 799,
      mrp: 1499,
      duration: '1 hr',
      badge: null,
    ),
    const PopularServiceModel(
      title: 'Korean Body Polishing',
      imageUrl: 'https://www.skinbae.in/cdn/shop/articles/Blog720x480.gif?v=1656576364&width=2048',
      price: 1799,
      mrp: 4999,
      duration: '2 hrs 10 mins',
      badge: 'Most Booked',
    ),
    const PopularServiceModel(
      title: 'O3+ Shine Facial',
      imageUrl: 'https://glowcare.in/wp-content/uploads/2023/07/shine-glow-e1756559442696.jpg',
      price: 1349,
      mrp: 2899,
      duration: '1 hr 10 mins',
      badge: 'Oily & Combo',
    ),
  ];

  final skincareServices = [
    const PopularServiceModel(
      title: 'Korean Day & Night Sheet Mask',
      imageUrl: 'https://m.media-amazon.com/images/I/71zjJW2Ac-L.jpg',
      price: 199,
      mrp: 349,
      duration: '10 mins',
      badge: 'Last Minute Add-On',
    ),
    const PopularServiceModel(
      title: 'Eye Mask',
      imageUrl: 'https://us.drowsysleepco.com/cdn/shop/files/Drowsy-Sleep-Co.-Green-Sapphire-Sleep-Mask-Beauty-Sleep3_6e1f02d1-bd49-41fa-9364-365eb08aee02.jpg?v=1734016897&width=1000',
      price: 75,
      mrp: 199,
      duration: '5 mins',
      badge: null,
    ),
    const PopularServiceModel(
      title: 'De-Tan Sheet Mask',
      imageUrl: 'https://sarinskin.com/cdn/shop/files/Artboard5_6a2a736b-56e5-49e1-ac13-9fb064780c30.webp?v=1756537315',
      price: 119,
      mrp: 299,
      duration: '15 mins',
      badge: null,
    ),
  ];
}