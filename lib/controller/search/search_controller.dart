import 'package:get/get.dart';

class SearchController extends GetxController {
  final query = ''.obs;
  final selectedService = Rxn<Map<String, dynamic>>();
  final serviceCounts = <int>[].obs;

  final List<Map<String, String>> recentSearches = [
    {
      'title': 'Hair Cut',
      'image':
          'https://images.unsplash.com/photo-1560066984-138dadb4c035?w=200',
    },
    {
      'title': 'Oil Facial',
      'image':
          'https://images.unsplash.com/photo-1570172619644-dfd03ed5d881?w=200',
    },
    {'title': 'Facial', 'image': ''},
    {
      'title': 'De-Tan',
      'image':
          'https://images.unsplash.com/photo-1512290923902-8a9f81dc236c?w=200',
    },
  ];

  final List<String> trendingSearches = [
    'Waxing',
    'Facial',
    'Pedicure',
    'Korean waxing',
    'Body Polishing',
    'Mani-Pedi',
    'Spa',
    'Threading',
    'Hair Spa',
    'Head Massage',
    'Korean',
    'Hydra Facial',
    'Hair Cut',
    'Bikini Wax',
    'De-Tan',
    'Clean-Up',
    'Massage',
    'Bleach',
    'Body Massage',
    'Manicure',
  ];

  final List<Map<String, dynamic>> services = [
    {
      'title': 'Korean Clean Up',
      'keywords': 'cleanup clean-up facial korean',
      'subtitle': '7 Step Clean-Up | Free Silicone Face Brush Included',
      'duration': '50 mins',
      'price': '₹849',
      'mrp': '₹1299',
      'discount': '34 % OFF',
      'badge': '',
      'rating': '4.82 (75,365 ratings)',
      'image':
          'https://images.unsplash.com/photo-1570172619644-dfd03ed5d881?w=600',
      'hero':
          'https://images.unsplash.com/photo-1600334089648-b0d9d3028eb2?w=900',
    },
    {
      'title': 'Korean Glow Facial',
      'keywords': 'oil facial glow korean skin',
      'subtitle': 'Glow facial for smooth hydrated skin',
      'duration': '1 hr 15 mins',
      'price': '₹1,399',
      'mrp': '₹2,499',
      'discount': '44 % OFF',
      'badge': 'All Skin Types',
      'rating': '4.81 (62,410 ratings)',
      'image':
          'https://images.unsplash.com/photo-1598300188904-6287d52746ad?w=600',
      'hero':
          'https://images.unsplash.com/photo-1515377905703-c4788e51af15?w=900',
    },
    {
      'title': 'Full Arms + Underarms Waxing',
      'keywords': 'waxing wax korean arms underarms',
      'subtitle': 'Korean wax ritual for smooth skin',
      'duration': '1 hr 15 mins',
      'price': '₹849',
      'mrp': '₹1,699',
      'discount': '50 % OFF',
      'badge': '',
      'rating': '4.76 (42,900 ratings)',
      'image':
          'https://images.unsplash.com/photo-1519415510236-718bdfcd89c8?w=600',
      'hero': 'https://images.unsplash.com/photo-1556228720-195a672e8a03?w=900',
    },
    {
      'title': 'Moroccan Argan Oil Facial',
      'keywords': 'oil facial argan moroccan skin',
      'subtitle': 'Nourishing oil facial for bright skin',
      'duration': '1 hr 5 mins',
      'price': '₹939',
      'mrp': '₹2,000',
      'discount': '53 % OFF',
      'badge': 'All Skin Types',
      'rating': '4.78 (18,240 ratings)',
      'image':
          'https://images.unsplash.com/photo-1616394584738-fc6e612e71b9?w=600',
      'hero':
          'https://images.unsplash.com/photo-1570172619644-dfd03ed5d881?w=900',
    },
    {
      'title': 'Vit-C Brightening Facial',
      'keywords': 'oil facial vitamin brightening skin',
      'subtitle': 'Brightening facial for dull skin',
      'duration': '1 hr 5 mins',
      'price': '₹799',
      'mrp': '₹1,099',
      'discount': '27 % OFF',
      'badge': 'Normal & Dry Skin',
      'rating': '4.74 (12,906 ratings)',
      'image':
          'https://images.unsplash.com/photo-1616394584738-fc6e612e71b9?w=601',
      'hero':
          'https://images.unsplash.com/photo-1512290923902-8a9f81dc236c?w=900',
    },
    {
      'title': 'O3+ Shine & Glow Facial',
      'keywords': 'oil facial shine glow oily combo skin',
      'subtitle': 'Premium glow facial for oily and combo skin',
      'duration': '1 hr 10 mins',
      'price': '₹1,349',
      'mrp': '₹2,999',
      'discount': '55 % OFF',
      'badge': 'Oily & Combo Skin',
      'rating': '4.80 (20,144 ratings)',
      'image':
          'https://images.unsplash.com/photo-1522335789203-aabd1fc54bc9?w=600',
      'hero':
          'https://images.unsplash.com/photo-1596462502278-27bfdc403348?w=900',
    },
    {
      'title': 'O3+ Stay Young Facial',
      'keywords': 'oil facial stay young dry skin',
      'subtitle': 'Anti-ageing facial for soft glowing skin',
      'duration': '1 hr 10 mins',
      'price': '₹1,249',
      'mrp': '₹2,500',
      'discount': '50 % OFF',
      'badge': 'Normal & Dry Skin',
      'rating': '4.79 (15,412 ratings)',
      'image':
          'https://images.unsplash.com/photo-1515377905703-c4788e51af15?w=600',
      'hero':
          'https://images.unsplash.com/photo-1570172619644-dfd03ed5d881?w=901',
    },
    {
      'title': 'O3+ Bridal Facial',
      'keywords': 'oil facial bridal all skin',
      'subtitle': 'Bridal facial for radiance and glow',
      'duration': '1 hr 40 mins',
      'price': '₹1,827',
      'mrp': '₹5,500',
      'discount': '66 % OFF',
      'badge': 'All Skin Types',
      'rating': '4.84 (24,050 ratings)',
      'image':
          'https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?w=600',
      'hero':
          'https://images.unsplash.com/photo-1522335789203-aabd1fc54bc9?w=900',
    },
  ];

  List<Map<String, dynamic>> get popularPicks => services.take(3).toList();

  List<Map<String, dynamic>> get filteredServices {
    final value = query.value.trim().toLowerCase();
    if (value.isEmpty) return services;
    final words = value
        .split(RegExp(r'\s+'))
        .where((word) => word.trim().isNotEmpty)
        .toList();

    final exactMatches = services.where((service) {
      final searchable =
          '${service['title']} ${service['subtitle']} ${service['keywords']}'
              .toLowerCase();
      return searchable.contains(value);
    }).toList();

    if (exactMatches.isNotEmpty) return exactMatches.take(1).toList();

    final wordMatches = services.where((service) {
      final searchable =
          '${service['title']} ${service['subtitle']} ${service['keywords']}'
              .toLowerCase();
      return words.any(searchable.contains);
    }).toList();

    return wordMatches.isNotEmpty
        ? wordMatches.take(1).toList()
        : services.take(1).toList();
  }

  @override
  void onInit() {
    super.onInit();
    serviceCounts.value = List.generate(services.length, (_) => 0);
  }

  int indexOfService(Map<String, dynamic> service) => services.indexOf(service);

  void setQuery(String value) {
    query.value = value;
  }

  void clearQuery() {
    query.value = '';
  }

  void openService(Map<String, dynamic> service) {
    selectedService.value = service;
  }

  void closeService() {
    selectedService.value = null;
  }

  void incrementService(int index) {
    if (index >= 0 && index < serviceCounts.length) {
      serviceCounts[index]++;
    }
  }

  void decrementService(int index) {
    if (index >= 0 &&
        index < serviceCounts.length &&
        serviceCounts[index] > 0) {
      serviceCounts[index]--;
    }
  }
}
