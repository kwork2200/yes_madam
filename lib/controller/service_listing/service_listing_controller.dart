import 'package:get/get.dart';
import 'package:yes_madam/model/service_model.dart';

class ServiceListingController extends GetxController {
  var selectedCategoryIndex = (-1).obs;
  bool get isOfferSelected => selectedCategoryIndex.value == -1;

  final List<String> categories = [
    'Korean Glow',
    'Waxing',
    'Facial',
    'Body Polishing',
    'Mani-Pedi',
    'Clean-Up',
    'Bleach, Dtan & Scrub',
    'Hair',
  ];

  final RxString selectedFilterChip = 'Top Selling'.obs;
  final List<String> filterChips = [
    'Top Selling',
    'Premium Facial',
    'Classic Facial',
  ];

  final RxString selectedConcern = ''.obs;
  final RxString selectedSkinType = ''.obs;

  final RxInt cartCount = 0.obs;
  final RxList<ServiceModel> cartItems = <ServiceModel>[].obs;

  // final RxList<ServiceModel> packageItems = <ServiceModel>[].obs;

  final RxList<ServiceModel> services = <ServiceModel>[
    ServiceModel(
      id: '1',
      name: 'Korean Glow Facial',
      subtitle: '9 Steps Facial | Includes FREE Silicone Facial Brush',
      duration: '1 hr 15 mins',
      price: 1399,
      originalPrice: 2499,
      discountPercent: 44,
      rating: 4.91,
      reviewCount: 202712,
      recentBookings: '25K+ Bookings in Last 30 days',
      imageUrl: '',
      isBestseller: true,
      tag: 'Top Selling',
    ),
    ServiceModel(
      id: '2',
      name: 'O3+ Shine & Glow Facial',
      subtitle: 'Arbutin | Oily Skin Types',
      duration: '1 hr 10 mins',
      price: 1349,
      originalPrice: 2999,
      discountPercent: 55,
      rating: 4.72,
      reviewCount: 34247,
      recentBookings: '',
      imageUrl: '',
      isBestseller: false,
      tag: 'Premium Facial',
    ),
    ServiceModel(
      id: '3',
      name: 'Wax & Relax',
      subtitle: 'Multiple services',
      duration: '4 hrs 12 mins',
      price: 2647,
      originalPrice: 4746,
      discountPercent: 44,
      rating: 4.85,
      reviewCount: 12000,
      recentBookings: '2K+ Bookings in Last 30 days',
      imageUrl: '',
      isBestseller: false,
      tag: 'Top Selling',
    ),
    ServiceModel(
      id: '4',
      name: 'Korean Waxing Special',
      subtitle: 'Multiple services',
      duration: '2 hrs 45 mins',
      price: 1759,
      originalPrice: 3448,
      discountPercent: 48,
      rating: 4.90,
      reviewCount: 45000,
      recentBookings: '2K+ Bookings in Last 30 days',
      imageUrl: '',
      isBestseller: true,
      tag: 'Top Selling',
    ),
  ].obs;

  // final RxList<ServiceModel> packageServices = <ServiceModel>[
  //   ServiceModel(
  //     id: 'p1',
  //     name: 'Korean Glow Special',
  //     subtitle: 'Multiple services',
  //     duration: '4 hrs 32 mins',
  //     price: 3183,
  //     originalPrice: 6246,
  //     discountPercent: 49,
  //     rating: 4.91,
  //     reviewCount: 34000,
  //     recentBookings: '34K+ Bookings in Last 30 days',
  //     imageUrl: '',
  //     isBestseller: true,
  //     tag: '',
  //   ),
  // ].obs;

  final packageList = [
    {
      "title": "Korean Glow Special",
      "services": "Multiple services",
      "price": "₹3138",
      "mrp": "₹6246",
      "discount": "49% OFF",
      "duration": "4 hrs 32 mins",
      "images": [
        "https://images.unsplash.com/photo-1515377905703-c4788e51af15?w=500",
        "https://images.unsplash.com/photo-1522335789203-aabd1fc54bc9?w=500",
        "https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?w=500",
        "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=500",
      ],
      "items": [
        "Waxing: Full Arms, Full Legs & Underarms",
        "Premium Facial: Korean Glow Facial",
        "Manicure & Pedicure: Mani-Pedi Combo",
        "Facial Hair Removal: Eyebrows",
      ],
    },

    {
      "title": "Korean Wax & Glow",
      "services": "Multiple services",
      "price": "₹2185",
      "mrp": "₹4198",
      "discount": "47% OFF",
      "duration": "2 hrs 30 mins",
      "images": [
        "https://images.unsplash.com/photo-1522335789203-aabd1fc54bc9?w=500",
        "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=500",
        "https://images.unsplash.com/photo-1515377905703-c4788e51af15?w=500",
        "https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?w=500",
      ],
      "items": [
        "Waxing: Full Arms, Full Legs & Underarms",
        "Premium Facial: Korean Glow Facial",
      ],
    },

    {
      "title": "Korean Waxing Special",
      "services": "Multiple services",
      "price": "₹1759",
      "mrp": "₹3448",
      "discount": "48% OFF",
      "duration": "2 hrs 45 mins",
      "images": [
        "https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?w=500",
        "https://images.unsplash.com/photo-1515377905703-c4788e51af15?w=500",
        "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=500",
        "https://images.unsplash.com/photo-1522335789203-aabd1fc54bc9?w=500",
      ],
      "items": [
        "Waxing: Full Arms, Full Legs & Underarms",
        "Intimate Waxing: Bikini Wax",
        "Facial Hair Removal: Full Face",
      ],
    },
    {
      "title": "Korean Bridal Glow",
      "services": "Multiple services",
      "price": "₹4299",
      "mrp": "₹7999",
      "discount": "46% OFF",
      "duration": "5 hrs 15 mins",
      "images": [
        "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=500",
        "https://images.unsplash.com/photo-1522335789203-aabd1fc54bc9?w=500",
        "https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?w=500",
        "https://images.unsplash.com/photo-1515377905703-c4788e51af15?w=500",
      ],
      "items": [
        "Premium Facial: Korean Glass Skin Facial",
        "Manicure & Pedicure: Luxury Spa Combo",
        "Hair Spa: Keratin Smooth Treatment",
        "Threading: Eyebrows & Upper Lips",
      ],
    },
  ];

  void selectCategory(int index) {
    selectedCategoryIndex.value = index;
  }

  void selectFilterChip(String chip) {
    selectedFilterChip.value = chip;
  }

  void addToCart(ServiceModel service) {
    final existing = cartItems.firstWhereOrNull((s) => s.id == service.id);
    if (existing == null) {
      cartItems.add(service.copyWith(quantity: 1));
    } else {
      final index = cartItems.indexWhere((s) => s.id == service.id);
      cartItems[index] = existing.copyWith(quantity: existing.quantity + 1);
    }
    cartCount.value = cartItems.fold(0, (sum, s) => sum + s.quantity);
  }

  void removeFromCart(ServiceModel service) {
    final existing = cartItems.firstWhereOrNull((s) => s.id == service.id);
    if (existing == null) return;
    if (existing.quantity <= 1) {
      cartItems.removeWhere((s) => s.id == service.id);
    } else {
      final index = cartItems.indexWhere((s) => s.id == service.id);
      cartItems[index] = existing.copyWith(quantity: existing.quantity - 1);
    }
    cartCount.value = cartItems.fold(0, (sum, s) => sum + s.quantity);
  }

  int getItemQuantity(String id) {
    return cartItems.firstWhereOrNull((s) => s.id == id)?.quantity ?? 0;
  }

  int get totalCartPrice =>
      cartItems.fold(0, (sum, s) => sum + (s.price * s.quantity));
}