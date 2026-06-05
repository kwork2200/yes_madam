import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yes_madam/controller/account/account_controller.dart';
import 'package:yes_madam/controller/profile/profile_controller.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_dimensions.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/widgets/common/common_button.dart';
import 'package:yes_madam/widgets/common/common_text.dart';
import 'package:yes_madam/widgets/common/common_text_field.dart';
import 'package:yes_madam/widgets/components/spacing_widget.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: CommonText(
          text: 'Your Profile',
          fontSize: AppFontSizes.fontXMedium,
          fontWeight: AppFontWeights.semiBold,
          color: AppColors.blackColor,
        ),
        centerTitle: false,
      ),
      body: Form(
        key: controller.formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.paddingMedium.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacing.height(24),
              _buildProfileAvatar(),
              Spacing.height(28),
              _buildLabel('Full Name'),
              Spacing.height(8),
              CommonTextField(
                controller: controller.nameController,
                hintText: 'Enter your full name',
                keyboardType: TextInputType.name,
                validator: (val) =>
                val == null || val.isEmpty ? 'Name is required' : null,
              ),
              Spacing.height(20),
              _buildLabel('Email'),
              Spacing.height(8),
              CommonTextField(
                controller: controller.emailController,
                hintText: 'Enter your email',
                keyboardType: TextInputType.emailAddress,
                validator: (val) {
                  if (val == null || val.isEmpty) return 'Email is required';
                  if (!GetUtils.isEmail(val)) return 'Enter valid email';
                  return null;
                },
              ),
              Spacing.height(20),
              _buildLabel('Date of Birth'),
              Spacing.height(8),
              _buildDobField(context),
              Spacing.height(20),
              _buildLabel('Gender'),
              Spacing.height(12),
              _buildGenderSelector(),
              Spacing.height(20),
              _buildLabel('Marital Status'),
              Spacing.height(12),
              _buildMaritalStatusSelector(),
              Spacing.height(40),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildUpdateButton(),
    );
  }

  Widget _buildProfileAvatar() {
    final account = Get.find<AccountController>();

    return Center(
      child: Stack(
        children: [
          Obx(() {
            final img = account.profileImage.value;

            return Container(
              width: 90.w,
              height: 90.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.themeColor,
                  width: 2.0.w,
                ),
              ),
              child: CircleAvatar(
                backgroundImage:
                img.isNotEmpty ? FileImage(File(img)) : null,
                backgroundColor: Colors.grey.shade200,
                child: img.isEmpty
                    ? Icon(
                  Icons.person,
                  size: 50.r,
                  color: Colors.grey.shade400,
                )
                    : null,
              ),
            );
          }),

          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                Get.find<AccountController>().pickProfileImage();
              },
              child: Container(
                width: 24.w,
                height: 24.w,
                decoration: BoxDecoration(
                  color: AppColors.themeColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.edit_outlined,
                  color: AppColors.whiteColor,
                  size: 15.r,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(String label) {
    return CommonText(
      text: label,
      fontSize: AppFontSizes.fontSmall,
      fontWeight: AppFontWeights.semiBold,
      color: AppColors.greyColor,
    );
  }

  Widget _buildDobField(BuildContext context) {
    return Obx(
          () => GestureDetector(
        onTap: () => controller.pickDate(context),
        child: AbsorbPointer(
          child: CommonTextField(
            hintText: controller.selectedDob.value.isEmpty
                ? 'Select Date of Birth'
                : controller.selectedDob.value,
            readOnly: true,
            hintStyle: TextStyle(color: AppColors.blackColor,fontWeight: FontWeight.bold),
            suffixIcon: Icon(
              Icons.calendar_month_outlined,
              color: AppColors.blackColor,
              size: AppDimensions.iconMedium.r,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGenderSelector() {
    return Obx(
          () => Row(
        children: [
          _buildSelectableChip(
            label: 'Female',
            icon: Icons.female,
            isSelected: controller.selectedGender.value == 'Female',
            onTap: () => controller.selectGender('Female'),
          ),
          Spacing.width(12),
          _buildSelectableChip(
            label: 'Male',
            icon: Icons.male,
            isSelected: controller.selectedGender.value == 'Male',
            onTap: () => controller.selectGender('Male'),
          ),
        ],
      ),
    );
  }

  Widget _buildMaritalStatusSelector() {
    return Obx(
          () => Row(
        children: [
          _buildSelectableChip(
            label: 'Single',
            isSelected: controller.selectedMaritalStatus.value == 'Single',
            onTap: () => controller.selectMaritalStatus('Single'),
          ),
          Spacing.width(12),
          _buildSelectableChip(
            label: 'Married',
            isSelected: controller.selectedMaritalStatus.value == 'Married',
            onTap: () => controller.selectMaritalStatus('Married'),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectableChip({
    required String label,
    IconData? icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.paddingMedium.w,
          vertical: 10.h,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.themeColor.withOpacity(0.08)
              : AppColors.whiteColor,
          borderRadius: BorderRadius.circular(AppDimensions.radiusSmall.r),
          border: Border.all(
            color: isSelected ? AppColors.themeColor : Colors.grey.shade300,
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                size: AppDimensions.iconSmall.r,
                color: isSelected ? AppColors.themeColor : AppColors.greyColor,
              ),
              Spacing.width(6),
            ],
            CommonText(
              text: label,
              fontSize: AppFontSizes.fontMedium,
              fontWeight: isSelected
                  ? AppFontWeights.semiBold
                  : AppFontWeights.medium,
              color: isSelected ? AppColors.themeColor : AppColors.greyColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUpdateButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppDimensions.paddingMedium.w,
        0,
        AppDimensions.paddingMedium.w,
        24.h,
      ),
      child: Obx(
            () => CommonButton(
          text: controller.isLoading.value ? 'Updating...' : 'Update Profile',
          isEnabled: !controller.isLoading.value,
          width: double.infinity,
          height: 40.h,
          onPressed: controller.updateProfile,
        ),
      ),
    );
  }
}