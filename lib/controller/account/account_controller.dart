import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yes_madam/routes/app_routes.dart';
import 'package:yes_madam/screens/help/help_screen.dart';

class AccountController extends GetxController {
  final RxString userName = 'Krishna'.obs;
  final RxString phoneNumber = '+91 9106037364'.obs;
  final RxInt ymCoins = 0.obs;
  final RxDouble walletBalance = 0.0.obs;
  final RxInt referralCoins = 0.obs;
  final RxBool whatsappSubscribed = false.obs;
  final RxBool personalizedExp = false.obs;
  final RxString email = ''.obs;
  final RxString dob = ''.obs;
  final RxString gender = 'Female'.obs;
  final RxString maritalStatus = 'Single'.obs;

  final RxString profileImage = ''.obs;

  final List<Map<String, dynamic>> quickActions = [
    {
      'icon': Icons.calendar_today_outlined,
      'title': 'My Bookings',
      'onTap': () {},
    },
    {
      'icon': Icons.location_on_outlined,
      'title': 'Addresses',
      'onTap': () {},
    },
    {
      'icon': Icons.message_outlined,
      'title': 'Help Center',
      'onTap': () => Get.toNamed(AppRoutes.help)
    },
  ];

  final RxList<Map<String, dynamic>> savedAddresses = <Map<String, dynamic>>[
    {
      'title': 'Sham Nagar',
      'address':
      'To, Surat - Kamrej Hwy, Sham Nagar, Sarthana Jakat Naka, Varachha, Surat, Gujarat 395008, India',
    }
  ].obs;

  final presentAddress = {
    'title': 'Sham Nagar',
    'address':
    'To, Surat - Kamrej Hwy, Sham Nagar, Sarthana Jakat Naka, Varachha, Surat, Gujarat 395008, India',
  };

  void logout() {
    Get.offAllNamed('/');
  }

  void deleteAddress(int index) {
    savedAddresses.removeAt(index);
  }

  Future<void> pickProfileImage() async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      profileImage.value = image.path;
    }
  }
}
