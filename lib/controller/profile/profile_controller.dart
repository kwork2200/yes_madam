import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:yes_madam/controller/account/account_controller.dart';
import 'package:yes_madam/utils/app_colors.dart';

class ProfileController extends GetxController {
  final AccountController accountController = Get.find<AccountController>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final RxString selectedGender = 'Female'.obs;
  final RxString selectedMaritalStatus = 'Single'.obs;
  final RxString selectedDob = ''.obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }

  void loadUserData() {
    nameController.text = accountController.userName.value;
    // emailController.text = accountController.phoneNumber.value;

    selectedGender.value = accountController.gender.value;
    selectedMaritalStatus.value = accountController.maritalStatus.value;
    selectedDob.value = accountController.dob.value;
  }

  void selectGender(String gender) {
    selectedGender.value = gender;
  }

  void selectMaritalStatus(String status) {
    selectedMaritalStatus.value = status;
  }

  Future<void> pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(1995),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.themeColor,
              onPrimary: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      selectedDob.value = DateFormat('d MMMM yyyy').format(picked);
    }
  }

  Future<void> updateProfile() async {
    if (!formKey.currentState!.validate()) return;

    isLoading.value = true;

    await Future.delayed(const Duration(seconds: 2));

    final account = Get.find<AccountController>();

    account.userName.value = nameController.text;
    account.email.value = emailController.text;
    account.gender.value = selectedGender.value;
    account.maritalStatus.value = selectedMaritalStatus.value;
    account.dob.value = selectedDob.value;

    isLoading.value = false;

    Get.back();

    Get.snackbar(
      'Success',
      'Profile updated successfully!',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFFaf7379),
      colorText: Colors.white,
    );
  }
  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    super.onClose();
  }
}