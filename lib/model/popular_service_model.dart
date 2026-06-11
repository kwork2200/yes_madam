class PopularServiceModel {
  final String title;
  final String imageUrl;
  final int price;
  final int mrp;
  final String duration;
  final String? badge;

  const PopularServiceModel({
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.mrp,
    required this.duration,
    this.badge,
  });
}