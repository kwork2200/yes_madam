import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:yes_madam/utils/app_images.dart';
import '../../controller/location/location_controller.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_font_weights.dart';
import '../../utils/app_font_sizes.dart';
import '../../widgets/common/common_text.dart';

class LocationScreen extends StatelessWidget {
  LocationScreen({super.key});

  final controller = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Center(
          child: Obx(() => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    AppImages.locationLottie,
                    width: 140.w,
                    height: 130.h,
                    fit: BoxFit.contain,
                  ),
                  CommonText(
                    text: controller.locationTitle.value,
                    fontSize: AppFontSizes.fontXLarge,
                    fontWeight: AppFontWeights.black,
                    color: AppColors.darkColor,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.w),
                    child: CommonText(
                      text: controller.locationAddress.value,
                      fontSize: AppFontSizes.fontMedium,
                      color: AppColors.greyColor,
                      fontWeight: AppFontWeights.bold,
                      textAlign: TextAlign.center,
                      softWrap: true,
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
