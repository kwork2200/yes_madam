import 'package:get/get.dart';
import 'package:yes_madam/model/cart_item.dart';

class CartController extends GetxController {
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    cartItems.addAll([
      CartItemModel(
        id: "1",
        name: "Hair Cut",
        price: 199,
        quantity: 1,
        image: "https://i.pinimg.com/474x/c3/3a/af/c33aafcd594ac2da893ba5e8aa6ae676.jpg",
      ),
      CartItemModel(
        id: "2",
        name: "Facial",
        price: 499,
        quantity: 1,
        image: "https://swicos.com.my/wp-content/uploads/2025/03/facial-treatment.jpg.webp",
      ),
      CartItemModel(
        id: "3",
        name: "Manicure",
        price: 299,
        quantity: 1,
        image: "https://www.shutterstock.com/image-photo/manicure-pedicure-pink-nails-600nw-2723982651.jpg",
      ),
      CartItemModel(
        id: "4",
        name: "Pedicure",
        price: 349,
        quantity: 1,
        image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZBfWie79mBqW9UJYOpkhTECeNE0k4yzw4zg&s",
      ),
      CartItemModel(
        id: "5",
        name: "Hair Spa",
        price: 799,
        quantity: 1,
        image: "https://zanya.co.in/wp-content/uploads/2024/02/woman-getting-hair-treatment.jpg",
      ),
    ]);
  }

  void addToCart(CartItemModel item) {
    int index = cartItems.indexWhere((e) => e.id == item.id);

    if (index != -1) {
      cartItems[index].quantity++;
      cartItems.refresh();
    } else {
      cartItems.add(item);
    }
  }

  void removeFromCart(String id) {
    int index = cartItems.indexWhere((e) => e.id == id);

    if (index != -1) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity--;
      } else {
        cartItems.removeAt(index);
      }
      cartItems.refresh();
    }
  }

  int get totalServices =>
      cartItems.fold(0, (sum, item) => sum + item.quantity);

  double get totalAmount =>
      cartItems.fold(0.0, (sum, item) => sum + (item.price * item.quantity));

  bool get hasItems => cartItems.isNotEmpty;

  List<String> get previewImages =>
      cartItems.take(3).map((e) => e.image).toList();
}