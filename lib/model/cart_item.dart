import 'package:get/get.dart';

class CartItemModel {
  final String id;
  final String name;
  final double price;
  final String image;
  final double? mrp;
  final String? duration;
  final String? subtitle;
  final int? serviceCharge;
  final int? productCost;
  final List<String>? includedProducts;
  final RxInt rxQuantity;
  int get quantity => rxQuantity.value;
  set quantity(int val) => rxQuantity.value = val;

  CartItemModel({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    int quantity = 1,
    this.mrp,
    this.duration,
    this.subtitle,
    this.serviceCharge,
    this.productCost,
    this.includedProducts,
  }) : rxQuantity = quantity.obs;
}