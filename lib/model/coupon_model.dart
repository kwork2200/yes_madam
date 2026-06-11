class CouponModel {
  final String code;
  final String title;
  final String description;
  final String tagLabel;
  final List<String> termsList;

  const CouponModel({
    required this.code,
    required this.title,
    required this.description,
    this.tagLabel = 'FLAT OFF',
    this.termsList = const [
      'Applicable only once on this account',
      'Offer can not be clubbed with wallet, referral earnings or any other coupon',
      'offer valid till 10 June, 2026 04:27 PM',
    ],
  });
}
