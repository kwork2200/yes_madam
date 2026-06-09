import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yes_madam/routes/app_routes.dart';
import 'package:yes_madam/screens/help/help_screen.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_dimensions.dart';
import 'package:yes_madam/widgets/show_address_bottom_sheet.dart';

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
  late final List<Map<String, dynamic>> quickActions = [
    {
      'icon': Icons.calendar_today_outlined,
      'title': 'My Bookings',
      'onTap': () {
        Get.toNamed(AppRoutes.eliteMembership);
      },
    },
    {
      'icon': Icons.location_on_outlined,
      'title': 'Addresses',
      'onTap': () {
        showAddressBottomSheet();
        },
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

  final RxMap<String, dynamic> presentAddress = <String, dynamic>{
    'title': 'Sham Nagar',
    'address': 'To, Surat - Kamrej Hwy, Sham Nagar, Sarthana Jakat Naka, Varachha, Surat, Gujarat 395008, India',
  }.obs;


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

  void showAddressBottomSheet() {
    Get.bottomSheet(
      Stack(
        clipBehavior: Clip.none,
        children: [

          AddressBottomSheet(),
          Positioned(
            top: -45.h,
            right: 10.w,
            child: GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                padding: EdgeInsets.all(8.r),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.close,
                  color: AppColors.blackColor,
                  size: 22.r,
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppDimensions.paddingMedium.r),
        ),
      ),
      isScrollControlled: true,
    );
  }

  void updatePresentAddress(String title, String address) {
    presentAddress.value = {'title': title, 'address': address};
  }
}
