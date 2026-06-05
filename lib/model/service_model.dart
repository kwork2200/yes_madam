class ServiceBenefit {
  final String name;
  final String desc;

  const ServiceBenefit({required this.name, required this.desc});
}

class ServiceModel {
  final int id;
  final String title;
  final String duration;
  final String price;
  final String mrp;
  final String discount;
  final String badge;
  final String sub;
  final String rating;
  final String benefitTitle;
  final List<ServiceBenefit> benefits;
  final String image;

  const ServiceModel({
    required this.id,
    required this.title,
    required this.duration,
    required this.price,
    required this.mrp,
    required this.discount,
    required this.badge,
    required this.sub,
    required this.rating,
    required this.benefitTitle,
    required this.benefits,
    required this.image,
  });
}

class RecentSearch {
  final String label;
  final String image;

  const RecentSearch({required this.label, required this.image});
}