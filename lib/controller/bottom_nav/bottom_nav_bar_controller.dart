import 'package:get/get.dart';

class BottomNavBarController extends GetxController {
  final RxInt currentIndex = 0.obs;

  void changePage(int index) {
    currentIndex.value = index;
  }

  final RxBool showAddressSheet = false.obs;

  void openAddressSheet() => showAddressSheet.value = true;
  void closeAddressSheet() => showAddressSheet.value = false;
}
