import 'package:get/get.dart';
import 'package:yes_madam/controller/service_listing/service_listing_controller.dart';

class ServiceListingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ServiceListingController>(() => ServiceListingController());
  }
}