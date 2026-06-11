import 'package:get/get.dart';
import 'package:yes_madam/controller/checkout/checkout_controller.dart';

class CheckOutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckoutController>(() => CheckoutController());
  }
}