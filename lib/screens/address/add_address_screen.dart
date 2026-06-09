import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:yes_madam/controller/address/add_address_controller.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_dimensions.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/widgets/common/common_text.dart';
import 'package:yes_madam/widgets/common/common_text_field.dart';
import 'package:yes_madam/widgets/common/common_button.dart';

class AddAddressScreen extends GetView<AddAddressController> {
  const AddAddressScreen({super.key});

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
          text: 'Add New Address',
          fontSize: AppFontSizes.fontXMedium,
          fontWeight: AppFontWeights.semiBold,
          color: AppColors.darkColor,
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Obx(
                      () => GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: LatLng(controller.lat.value, controller.lng.value),
                      zoom: 16,
                    ),
                    onMapCreated: controller.onMapCreated,
                    onCameraMove: controller.onCameraMove,
                    onCameraIdle: controller.onCameraIdle,
                    myLocationEnabled: false,
                    zoomControlsEnabled: false,
                    mapToolbarEnabled: false,
                  ),
                ),
                Positioned(
                  top: 12.h,
                  left: 12.w,
                  right: 12.w,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius:
                      BorderRadius.circular(AppDimensions.radiusMedium.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: CommonTextField(
                      controller: controller.searchController,
                      hintText: 'Search for area, street name...',
                      prefixIcon: Icon(
                        Icons.search,
                        color: AppColors.greyColor,
                        size: AppDimensions.iconMedium.r,
                      ),
                      keyboardType: TextInputType.streetAddress,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            AppDimensions.radiusMedium.r),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            AppDimensions.radiusMedium.r),
                        borderSide: BorderSide.none,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 14.w, vertical: 8.h),
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius:
                          BorderRadius.circular(AppDimensions.radiusSmall.r),
                        ),
                        child: CommonText(
                          text: 'Professional will arrive here',
                          fontSize: AppFontSizes.fontMedium,
                          fontWeight: AppFontWeights.semiBold,
                          color: Colors.white,
                          textAlign: TextAlign.center,
                          softWrap: true,
                        ),
                      ),
                      CustomPaint(
                        size: Size(14.w, 7.h),
                        painter: _TrianglePainter(),
                      ),
                      CommonText(
                        text: 'Pin the pin to your exact location',
                        fontSize: AppFontSizes.fontNenoSmall,
                        fontWeight: AppFontWeights.normal,
                        color: Colors.black54,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 4.h),
                      // Map pin icon
                      Icon(
                        Icons.location_on,
                        size: 36.sp,
                        color: AppColors.accentColor,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 16.h,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: GestureDetector(
                      onTap: controller.goToCurrentLocation,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 10.h),
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(30.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.12),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Obx(
                              () => Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              controller.isFetchingLocation.value
                                  ? SizedBox(
                                width: 16.w,
                                height: 16.h,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: AppColors.accentColor,
                                ),
                              )
                                  : Icon(
                                Icons.my_location,
                                size: 18.sp,
                                color: AppColors.accentColor,
                              ),
                              SizedBox(width: 8.w),
                              CommonText(
                                text: 'Go to current location',
                                fontSize: AppFontSizes.fontMedium,
                                fontWeight: AppFontWeights.medium,
                                color: AppColors.accentColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: AppColors.whiteColor,
            padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: 'Your service will be delivered here',
                  fontSize: AppFontSizes.fontMedium,
                  fontWeight: AppFontWeights.bold,
                  color: AppColors.darkColor,
                ),
                SizedBox(height: 10.h),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 12.w, vertical: 12.h),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius:
                    BorderRadius.circular(AppDimensions.radiusMedium.r),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: AppDimensions.iconSmall.sp,
                        color: AppColors.accentColor,
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Obx(
                              () => CommonText(
                            text: controller.resolvedAddress.value.isEmpty
                                ? 'Fetching address...'
                                : controller.resolvedAddress.value,
                            fontSize: AppFontSizes.fontSmall,
                            fontWeight: AppFontWeights.normal,
                            color: AppColors.darkColor,
                            softWrap: true,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                CommonTextField(
                  controller: controller.houseFlatController,
                  hintText: 'House / Flat / Building*',
                  keyboardType: TextInputType.text,
                  validator: (val) => val == null || val.isEmpty
                      ? 'This field is required'
                      : null,
                ),
                SizedBox(height: 14.h),
                Obx(() => CommonButton(
                    text: controller.isSaving.value
                        ? 'Saving...'
                        : 'SAVE ADDRESS',
                    isEnabled: !controller.isSaving.value,
                    width: double.infinity,
                    height: 50.h,
                    onPressed: controller.saveAddress,
                    backgroundColor: controller.isSaving.value
                        ? AppColors.disableButtonColor
                        : AppColors.themeColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.black87;
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width / 2, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_) => false;
}