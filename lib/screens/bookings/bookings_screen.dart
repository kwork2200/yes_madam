import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yes_madam/routes/app_routes.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_font_weights.dart';
import '../../utils/app_font_sizes.dart';
import '../../utils/app_dimensions.dart';
import '../../widgets/common/common_text.dart';
import '../../widgets/common/common_app_bar.dart';

class BookingsController extends GetxController {
  final RxInt selectedTab = 0.obs;
}

class BookingsScreen extends StatelessWidget {
  BookingsScreen({super.key});

  final ctrl = Get.put(BookingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CommonAppBar(
        title: CommonText(
          text: 'Bookings',
          fontSize: AppFontSizes.fontXMedium,
          fontWeight: AppFontWeights.bold,
          color: AppColors.darkColor,
        ),
        centerTitle: false,
        actions: [
          TextButton(
            onPressed: () {
              Get.toNamed(AppRoutes.help);
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.spacingLarge.w,
                vertical: AppDimensions.spacingSmall.h,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.grey200),
                borderRadius: BorderRadius.circular(AppDimensions.radiusSmall.r),
              ),
              child: CommonText(
                text: 'HELP',
                fontSize: AppFontSizes.fontSmall,
                fontWeight: AppFontWeights.bold,
                color: AppColors.accentColor,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimensions.paddingMedium.w),
            child:Container(
                  height: 44.h,
                  decoration: BoxDecoration(
                    color: AppColors.greyLight,
                    borderRadius: BorderRadius.circular(22.r),
                  ),
                  child: Row(
                    children: [
                      _tabItem('Bookings', 0),
                      _tabItem('Multisession', 1),
                    ],
                  ),
                ),
          ),
          SizedBox(height: AppDimensions.spacingXLarge.h),
          Expanded(
            child: Obx(() => ctrl.selectedTab.value == 0
                ? _buildNoBookings()
                : _buildNoMultisession()),
          ),
        ],
      ),
    );
  }

  Widget _tabItem(String label, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () => ctrl.selectedTab.value = index,
        child: Obx(() => AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                color: ctrl.selectedTab.value == index
                    ? AppColors.themeColor
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(22.r),
              ),
              child: Center(
                child: CommonText(
                  text: label,
                  fontSize: AppFontSizes.fontSmall,
                  fontWeight: AppFontWeights.semiBold,
                  color: ctrl.selectedTab.value == index
                      ? AppColors.whiteColor
                      : AppColors.darkColor,
                ),
              ),
            )),
      ),
    );
  }

  Widget _buildNoBookings() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120.w,
            height: 100.w,
            decoration: BoxDecoration(
              color: AppColors.darkColor,
              borderRadius: BorderRadius.circular(AppDimensions.radiusMedium.r),
            ),
            child: Center(
              child: Container(
                width: 60.w,
                height: 60.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.workspace_premium,
                  color: AppColors.goldColor,
                  size: 50.sp,
                ),
              ),
            ),
          ),
          SizedBox(height: AppDimensions.radiusXLarge.h),
          CommonText(
            text: 'No Bookings Yet!',
            fontSize: AppFontSizes.fontLarge,
            fontWeight: AppFontWeights.bold,
            color: AppColors.darkColor,
          ),
          SizedBox(height: AppDimensions.spacingMedium.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimensions.paddingXLarge40.w),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(fontSize: AppFontSizes.fontMedium, color: AppColors.blackColor),
                children: [
                  const TextSpan(text: 'You can get '),
                  TextSpan(
                    text: '10% OFF',
                    style: TextStyle(
                      fontWeight: AppFontWeights.originalBold,
                      color: AppColors.darkColor,
                    ),
                  ),
                  const TextSpan(text: ' on all bookings with Elite membership'),
                ],
              ),
            ),
          ),
          SizedBox(height: AppDimensions.radiusXLarge.h),
          GestureDetector(
            onTap: (){
              Get.toNamed(AppRoutes.eliteMembership);
            },
            child: Container(
              width: 210.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: AppColors.themeColor,
                borderRadius: BorderRadius.circular(AppDimensions.radiusMedium.r),
              ),
              child: Center(
                child: CommonText(
                  text: '₹249 For 6 Months',
                  fontSize: AppFontSizes.fontMedium,
                  fontWeight: AppFontWeights.bold,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNoMultisession() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                width: 90.w,
                height: 90.w,
                decoration: BoxDecoration(
                  color: AppColors.lightBlue,
                  borderRadius: BorderRadius.circular(AppDimensions.radiusMedium.r),
                ),
                child: Icon(
                  Icons.calendar_today,
                  color: AppColors.darkBlue,
                  size: 50.sp,
                ),
              ),
              Container(
                width: 32.w,
                height: 32.w,
                decoration: BoxDecoration(
                  color: AppColors.successGreen,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check,
                  color: AppColors.whiteColor,
                  size: 18.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: AppDimensions.radiusXLarge.h),
          CommonText(
            text: 'No multisessions found',
            fontSize: AppFontSizes.fontXMedium,
            fontWeight: AppFontWeights.bold,
            color: AppColors.darkColor,
          ),
          SizedBox(height: AppDimensions.spacingSmall.h),
          CommonText(
            text: "Looks like you haven't placed any\nmultisessions booking yet!",
            fontSize: AppFontSizes.fontSmall,
            color: AppColors.blackColor,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
