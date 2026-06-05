import 'package:get/get.dart';
import 'package:yes_madam/controller/elite/elite_membership_controller.dart';

class EliteMembershipBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EliteMembershipController>(() => EliteMembershipController());
  }
}