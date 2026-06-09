import 'package:get/get.dart';
import 'package:yes_madam/controller/address/add_address_controller.dart';

class AddAddressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddAddressController>(() => AddAddressController());
  }
}