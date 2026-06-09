import 'package:get/get.dart';
import 'package:yes_madam/controller/contact_us/contact_us_controller.dart';

class ContactUsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContactUsController>(() => ContactUsController());
  }
}