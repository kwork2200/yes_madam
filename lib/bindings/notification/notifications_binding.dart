import 'package:get/get.dart';
import 'package:yes_madam/controller/notification/notifications_controller.dart';

class NotificationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationsController>(() => NotificationsController(),
   );
  }
}