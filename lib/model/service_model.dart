class ServiceModel {
  final String id;
  final String name;
  final String subtitle;
  final String duration;
  final int price;
  final int originalPrice;
  final int discountPercent;
  final double rating;
  final int reviewCount;
  final String recentBookings;
  final String imageUrl;
  final bool isBestseller;
  final String tag;
  final int quantity;

  ServiceModel({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.duration,
    required this.price,
    required this.originalPrice,
    required this.discountPercent,
    required this.rating,
    required this.reviewCount,
    required this.recentBookings,
    required this.imageUrl,
    required this.isBestseller,
    required this.tag,
    this.quantity = 0,
  });

  ServiceModel copyWith({
    String? id,
    String? name,
    String? subtitle,
    String? duration,
    int? price,
    int? originalPrice,
    int? discountPercent,
    double? rating,
    int? reviewCount,
    String? recentBookings,
    String? imageUrl,
    bool? isBestseller,
    String? tag,
    int? quantity,
  }) {
    return ServiceModel(
      id: id ?? this.id,
      name: name ?? this.name,
      subtitle: subtitle ?? this.subtitle,
      duration: duration ?? this.duration,
      price: price ?? this.price,
      originalPrice: originalPrice ?? this.originalPrice,
      discountPercent: discountPercent ?? this.discountPercent,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      recentBookings: recentBookings ?? this.recentBookings,
      imageUrl: imageUrl ?? this.imageUrl,
      isBestseller: isBestseller ?? this.isBestseller,
      tag: tag ?? this.tag,
      quantity: quantity ?? this.quantity,
    );
  }
}