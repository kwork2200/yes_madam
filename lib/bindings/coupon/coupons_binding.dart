import 'package:get/get.dart';
import 'package:yes_madam/controller/coupons/coupons_controller.dart';

class CouponsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CouponsController>(() => CouponsController());
  }
}