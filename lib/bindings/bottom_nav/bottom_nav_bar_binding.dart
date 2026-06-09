import 'package:get/get.dart';
import 'package:yes_madam/controller/bottom_nav/bottom_nav_bar_controller.dart';
import 'package:yes_madam/controller/home/home_controller.dart';

class BottomNavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavBarController>(() => BottomNavBarController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
