import 'package:get/get.dart';

class NotificationsController extends GetxController {
  final whatsappSubscribed = true.obs;
  final personalizedExp = false.obs;

  void toggleWhatsapp(bool value) {
    whatsappSubscribed.value = value;
  }

  void togglePersonalizedExp(bool value) {
    personalizedExp.value = value;
  }
}