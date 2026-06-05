import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yes_madam/model/ritual_model.dart';
import 'package:yes_madam/utils/app_texts.dart';

class HomeController extends GetxController {
  final PageController bannerController = PageController();
  final currentBannerIndex = 0.obs;
  Timer? bannerTimer;
  late Timer eliteTimer;

  final List<String> bannerImages = [
    'https://tattvaspa.com/wp-content/uploads/2026/03/March-5th.webp',
    'https://d2ki7eiqd260sq.cloudfront.net/Offers-7-cb55e3b8-9fb9-4227-a2e3-775c0da88b49.jpg',
    'https://5.imimg.com/data5/BD/UM/DK/ANDROID-56012161/product-jpeg.jpg',
    'https://images.template.net/373698/Salon-Special-Offer-Banner-Template-edit-online-1.jpg',
    'https://www.urbancompany.com/img?bucket=urbanclap-prod&quality=90&format=auto/w_335,dpr_2,fl_progressive:steep,q_auto:low,f_auto,c_limit/images/supply/customer-app-supply/1766137492257-952c07.jpeg',
  ];

  final currentBottomTab = 0.obs;
  final trendingTab = 0.obs;

  @override
  void onInit() {
    super.onInit();
    startAutoScroll();
    initRitualCounts(rituals.length);
    initMostBookedCounts();
    initTrendingCounts();
    initBestSellerCounts();
    eliteTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      eliteTextIndex.value = (eliteTextIndex.value + 1) % eliteMessages.length;
    });
  }

  final RxInt eliteTextIndex = 0.obs;

  final List<Map<String, String>> eliteMessages = [
    {"highlight": AppTexts.eliteDiscount, "message": AppTexts.onAllBookings},
    {"highlight": "Elite @ ₹279", "message": " - Only For You"},
  ];

  final List<String> trendingTabs = [
    'Waxing',
    'Facial',
    'Mani-Pedi',
    'Body Polish',
  ];

  final List<Map<String, dynamic>> categories = [
    {
      'label': 'Salon for Women',
      'isNew': false,
      'color': Color(0xFFFFE4EE),
      "image":
          "https://img.magnific.com/free-photo/female-hairdresser-using-hairbrush-hair-dryer_329181-1929.jpg?semt=ais_hybrid&w=740&q=80",
    },
    {
      'label': 'Body Polishing',
      'isNew': true,
      'color': Color(0xFFE8F5E9),
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3LdHbN-wYCt6OpR0fkubj5YJhtpA2TlqAwA&s",
    },
    {
      'label': 'Waxing',
      'isNew': false,
      'color': Color(0xFFFFF3E0),
      "image":
          "https://spinsalon.in/wp-content/uploads/2025/10/BlogSpinsalon_The-Ultimate-Guide-to-Face-Waxing-for-Women-Benefits-Process-Aftercare.jpg",
    },
    {
      'label': 'Facials',
      'isNew': false,
      'color': Color(0xFFE3F2FD),
      "image":
          "https://i-media.vyaparify.com/vcards/services/88379/MEDI-FACIALS-header.jpg",
    },
  ];

  final List<Map<String, dynamic>> mostBooked = [
    {
      'title': 'Full Arms + Full Legs\n+ Underarms Korean...',
      'duration': '1 hr 15 mins',
      'price': '₹849',
      'mrp': '₹1699',
      'discount': '50% OFF',
      'badge': '',
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFruiIVtIRrZBHEIz5EVkrf4mDVKW_unfm2Lvt0h4-Jw&s",
    },
    {
      'title': 'Korean Body\nPolishing',
      'duration': '2 hrs 10 mins',
      'price': '₹1799',
      'mrp': '₹4999',
      'discount': '64% OFF',
      'badge': 'Most Booked',
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlNDQm6HWXfH1KOT7m7_OY_KDBMq2SyFIqPw&s",
    },
    {
      'title': 'Korean\nCandle Massage',
      'duration': '1 hr 55 mins',
      'price': '₹1089',
      'mrp': '₹2199',
      'discount': '50% OFF',
      'badge': 'Candle Massage',
      "image":
          "https://m.media-amazon.com/images/I/61zKdEsnbpL._AC_UF1000,1000_QL80_.jpg",
    },
    {
      'title': 'Korean Cleanup\n& Glow Facial',
      'duration': '1 hr 20 mins',
      'price': '₹999',
      'mrp': '₹1999',
      'discount': '50% OFF',
      'badge': 'Trending',
      'image':
          'https://images.unsplash.com/photo-1515377905703-c4788e51af15?w=600',
    },
    {
      'title': 'Detan + Bleach\nCombo',
      'duration': '50 mins',
      'price': '₹699',
      'mrp': '₹1299',
      'discount': '46% OFF',
      'badge': '',
      'image':
          'https://images.unsplash.com/photo-1522335789203-aabd1fc54bc9?w=600',
    },
    {
      'title': 'Luxury Hair Spa\nwith Head Massage',
      'duration': '1 hr 45 mins',
      'price': '₹1299',
      'mrp': '₹2499',
      'discount': '48% OFF',
      'badge': 'Best Seller',
      'image':
          'https://images.unsplash.com/photo-1562322140-8baeececf3df?w=600',
    },
  ];

  final List<Map<String, dynamic>> trendingWaxing = [
    {
      'badge': 'Korean Wax Ritual',
      'title': 'Full Arms + Full Legs\n+ Underarms Korean...',
      'duration': '1 hr 15 mins',
      'price': '₹849',
      'mrp': '₹1699',
      'discount': '50% OFF',
      'image':
          'https://images.jdmagicbox.com/quickquotes/images_main/full-arms-full-legs-under-arms-waxing-2223691645-qv5nowr0.jpg',
    },
    {
      'badge': 'Rica Tin Wax',
      'title': 'Full Arms, Underarms\n& Full Legs - Rica Tin...',
      'duration': '1 hr 5 mins',
      'price': '₹898',
      'mrp': '₹1599',
      'discount': '43% OFF',
      'image':
          'https://cdn.prod.website-files.com/6680826684515a60a2de75f2/66a2853a54f27d4192e28f08_under-arm.webp',
    },
    {
      'badge': 'Honey Aloe',
      'title': 'Full Arms +\n+ Underarm...',
      'duration': '1 hr 5 mins',
      'price': '₹549',
      'mrp': '₹899',
      'discount': '39% OFF',
      'image':
          'https://media.sciencephoto.com/f0/24/74/33/f0247433-800px-wm.jpg',
    },
  ];

  final List<Map<String, dynamic>> trendingFacial = [
    {
      'badge': 'Glow Facial',
      'title': 'Korean Cleanup\n& Glow Facial',
      'duration': '1 hr 20 mins',
      'price': '₹999',
      'mrp': '₹1999',
      'discount': '50% OFF',
      'image':
          'https://images.unsplash.com/photo-1515377905703-c4788e51af15?w=600',
    },
    {
      'badge': 'HydraGlo',
      'title': 'HydraGlo Skin\nBrightening Facial',
      'duration': '1 hr 10 mins',
      'price': '₹1299',
      'mrp': '₹2499',
      'discount': '48% OFF',
      'image':
          'https://images.unsplash.com/photo-1570172619644-dfd03ed5d881?w=600',
    },
    {
      'badge': 'Detan',
      'title': 'Detan + Bleach\nCombo',
      'duration': '50 mins',
      'price': '₹699',
      'mrp': '₹1299',
      'discount': '46% OFF',
      'image':
          'https://images.unsplash.com/photo-1522335789203-aabd1fc54bc9?w=600',
    },
  ];

  final List<Map<String, dynamic>> trendingManiPedi = [
    {
      'badge': 'Mani-Pedi',
      'title': 'Classic Manicure\n& Pedicure',
      'duration': '1 hr 30 mins',
      'price': '₹899',
      'mrp': '₹1599',
      'discount': '44% OFF',
      'image':
          'https://images.unsplash.com/photo-1604654894610-df63bc536371?w=600',
    },
    {
      'badge': 'Spa Care',
      'title': 'Luxury Spa\nMani-Pedi',
      'duration': '1 hr 45 mins',
      'price': '₹1199',
      'mrp': '₹2199',
      'discount': '45% OFF',
      'image':
          'https://images.unsplash.com/photo-1610992015732-2449b76344bc?w=600',
    },
    {
      'badge': 'Gel Polish',
      'title': 'Gel Polish\nHands & Feet',
      'duration': '1 hr',
      'price': '₹799',
      'mrp': '₹1499',
      'discount': '47% OFF',
      'image':
          'https://images.unsplash.com/photo-1632345031435-8727f6897d53?w=600',
    },
  ];

  final List<Map<String, dynamic>> trendingBodyPolish = [
    {
      'badge': 'Body Polish',
      'title': 'Korean Body\nPolishing',
      'duration': '2 hrs 10 mins',
      'price': '₹1799',
      'mrp': '₹4999',
      'discount': '64% OFF',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlNDQm6HWXfH1KOT7m7_OY_KDBMq2SyFIqPw&s',
    },
    {
      'badge': 'Full Body',
      'title': 'Full Body Glow\nPolishing Ritual',
      'duration': '1 hr 50 mins',
      'price': '₹1499',
      'mrp': '₹2999',
      'discount': '50% OFF',
      'image':
          'https://images.unsplash.com/photo-1596462502278-27bfdc403348?w=600',
    },
    {
      'badge': 'Scrub',
      'title': 'Body Scrub\n& Detan Polish',
      'duration': '1 hr 20 mins',
      'price': '₹1099',
      'mrp': '₹1999',
      'discount': '45% OFF',
      'image':
          'https://images.unsplash.com/photo-1600334089648-b0d9d3028eb2?w=600',
    },
  ];

  List<List<Map<String, dynamic>>> get trendingServicesByTab => [
    trendingWaxing,
    trendingFacial,
    trendingManiPedi,
    trendingBodyPolish,
  ];

  List<Map<String, dynamic>> get selectedTrendingServices =>
      trendingServicesByTab[trendingTab.value];

  final List<Map<String, dynamic>> salonAtHome = [
    {'label': 'Waxing'},
    {'label': 'Clean-Up'},
    {'label': 'Mani-Pedi'},
    {'label': 'Facial'},
    {'label': 'Body Polishing'},
    {'label': 'Bleach, Dtan\nScrub'},
  ];

  final List<Map<String, dynamic>> bestSellers = [
    {
      'brand': 'RICA',
      'title': 'Full Arms + Half Legs + Underarms Waxing ..',
      'price': '₹677',
      'mrp': '₹1499',
      'duration': '50 mins',
      'bgColor': Color(0xFFB8860B),
    },
    {
      'brand': 'SOKORA',
      'title': 'Korean Glo...',
      'price': '₹1399',
      'mrp': '₹2499',
      'duration': '60 mins',
      'bgColor': Color(0xFF8B1A1A),
    },
  ];

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

  final List<Map<String, dynamic>> koreanCards = [
    {
      "title": "Glow Facial",
      "image":
          "https://japaniplexpress.com/wp-content/uploads/2025/09/TheraRed-Treatment.gif",
    },
    {
      "title": "Body Polishing",
      "image":
          "https://houseofsolandluna.com/cdn/shop/articles/OILPALM-ezgif.com-video-to-gif-converter_1f1f32b2-c700-481b-a7fd-dd80c93c8af3.gif?v=1779180915",
    },
    {
      "title": "Waxing Ritual",
      "image":
          "https://static.shumailas.com/wp-content/uploads/2025/09/Gif-Waxing-1-1.gif",
    },
    {
      "title": "Mani-Pedi",
      "image":
          "https://media.tenor.com/x11hMEnF8RsAAAAM/pedicure-dumb-and-dumber.gif",
    },
    {
      "title": "HydraGlo Facial",
      "image":
          "https://cafemom.com/wp-content/uploads/2024/08/img-of-media-slide-rv-13719-91520.gif",
    },
    {
      "title": "Body Spa",
      "image":
          "https://media1.giphy.com/media/v1.Y2lkPTZjMDliOTUycTUzZXl6YXdkZXViaWRuazY3NzN5MnFnMXprMGZlb3lmZmtxOHpoMCZlcD12MV9naWZzX3NlYXJjaCZjdD1n/l49JB8FjsS0eZj61O/giphy.gif",
    },
  ];

  var rituals = <RitualModel>[
    RitualModel(
      title: "Stripless Korean Bikini Wax",
      price: "₹799",
      mrp: "₹1499",
      duration: "60 mins",
      tags: [
        "Single-Use Wax",
        "Skin Brightening",
        "Free Hygiene Kit",
        "No Ingrowns",
      ],
      image:
          'https://media.post.rvohealth.io/wp-content/uploads/2020/10/waxing-bikini-1200x628-facebook-1200x628.jpg',
    ),
    RitualModel(
      title: "Korean Glow Wax",
      price: "₹1399",
      mrp: "₹2499",
      duration: "75 mins",
      tags: ["Glass Glow", "Step Facial", "Brightening", "Hydration"],
      image:
          'https://dgsjiq2u0d497.cloudfront.net/services/Korean_Wax_No_Broker.png',
    ),
    RitualModel(
      title: "Korean Full Body Glow Ritual",
      price: "₹1899",
      mrp: "₹2999",
      duration: "90 mins",
      tags: [
        "Full Body Wax",
        "Hydration Boost",
        "Silky Finish",
        "Premium Care",
      ],
      image: 'https://images.unsplash.com/photo-1596462502278-27bfdc403348',
    ),
    RitualModel(
      title: "Korean Underarm Brightening Wax",
      price: "₹499",
      mrp: "₹899",
      duration: "30 mins",
      tags: [
        "Underarm Care",
        "No Dark Patches",
        "Sensitive Skin Safe",
        "Quick Service",
      ],
      image: 'https://images.unsplash.com/photo-1600334089648-b0d9d3028eb2',
    ),
  ].obs;

  final RxList<int> packageCounts = <int>[0, 0, 0, 0].obs;

  var ritualCounts = <int>[].obs;

  void initRitualCounts(int length) {
    ritualCounts.value = List.generate(length, (index) => 0);
  }

  void incrementRitual(int index) {
    ritualCounts[index]++;
  }

  void decrementRitual(int index) {
    if (ritualCounts[index] > 0) {
      ritualCounts[index]--;
    }
  }

  void incrementPackage(int index) {
    packageCounts[index]++;
  }

  void decrementPackage(int index) {
    if (packageCounts[index] > 0) {
      packageCounts[index]--;
    }
  }

  final List<String> cities = [
    'Agra',
    'Aligarh',
    'Amritsar',
    'Bareilly',
    'Chandigarh',
    'Delhi',
    'Faridabad',
    'Ghaziabad',
    'Gurugram',
    'Lucknow',
    'Noida',
    'Bangalore',
    'Chennai',
    'Hyderabad',
    'Mysore',
    'Vijayawada',
    'Ahmedabad',
    'Mumbai',
    'Pune',
    'Surat',
    'Kolkata',
    'Bhubaneshwar',
    'Guwahati',
    'Patna',
    'Bhopal',
    'Indore',
    'Nagpur',
    'Raipur',
  ];

  void startAutoScroll() {
    bannerTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (!bannerController.hasClients) return;

      int nextPage = currentBannerIndex.value + 1;

      if (nextPage >= bannerImages.length) {
        nextPage = 0;
      }

      bannerController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  final List<RxList<int>> trendingCountsByTab = [];

  RxList<int> get selectedTrendingCounts =>
      trendingCountsByTab[trendingTab.value];

  void initTrendingCounts() {
    trendingCountsByTab
      ..clear()
      ..addAll(
        trendingServicesByTab.map(
          (services) => List.generate(services.length, (_) => 0).obs,
        ),
      );
  }

  void incrementTrending(int index) {
    selectedTrendingCounts[index]++;
  }

  void decrementTrending(int index) {
    if (selectedTrendingCounts[index] > 0) {
      selectedTrendingCounts[index]--;
    }
  }

  RxList<int> mostBookedCounts = <int>[].obs;
  RxList<int> bestSellerCounts = <int>[].obs;

  void initMostBookedCounts() {
    mostBookedCounts.value = List.generate(mostBooked.length, (_) => 0);
  }

  void incrementMostBooked(int index) {
    mostBookedCounts[index]++;
  }

  void decrementMostBooked(int index) {
    if (mostBookedCounts[index] > 0) {
      mostBookedCounts[index]--;
    }
  }

  void initBestSellerCounts() {
    bestSellerCounts.value = List.generate(bestSellers.length, (_) => 0);
  }

  void incrementBestSeller(int index) {
    bestSellerCounts[index]++;
  }

  void decrementBestSeller(int index) {
    if (bestSellerCounts[index] > 0) {
      bestSellerCounts[index]--;
    }
  }

  @override
  void onClose() {
    bannerTimer?.cancel();
    bannerController.dispose();
    eliteTimer.cancel();
    super.onClose();
  }
}
