import 'package:get/get.dart';
import 'package:yes_madam/controller/location/location_controller.dart';

class LocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocationController>(() => LocationController());
  }
}