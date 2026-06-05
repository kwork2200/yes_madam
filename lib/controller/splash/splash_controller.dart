import 'package:get/get.dart';
import 'package:yes_madam/routes/app_routes.dart';

class SplashController extends GetxController  {

  Future<void> navigateToLogin() async {
    await Future.delayed(const Duration(seconds: 3));

    Get.offAllNamed(AppRoutes.login);
  }
}