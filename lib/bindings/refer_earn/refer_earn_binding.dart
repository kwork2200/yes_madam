import 'package:get/get.dart';
import 'package:yes_madam/controller/refer_earn/refer_earn_controller.dart';

class ReferEarnBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReferEarnController>(() => ReferEarnController());
  }
}