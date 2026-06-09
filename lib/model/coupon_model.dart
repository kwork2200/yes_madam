class CouponModel {
  final String code;
  final String title;
  final String description;
  final String tagLabel;

  const CouponModel({
    required this.code,
    required this.title,
    required this.description,
    this.tagLabel = 'FLAT OFF',
  });
}