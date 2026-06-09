class CartItemModel {
  final String id;
  final String name;
  final String image;
  final double price;
  int quantity;

  CartItemModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    this.quantity = 1,
  });
}