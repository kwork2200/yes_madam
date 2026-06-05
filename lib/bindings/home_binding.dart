import 'package:get/get.dart';
import 'package:yes_madam/controller/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(),
   );
  }
}