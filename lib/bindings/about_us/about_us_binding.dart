import 'package:get/get.dart';
import 'package:yes_madam/controller/about_us/about_us_controller.dart';

class AboutUsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AboutUsController>(() => AboutUsController(),
   );
  }
}