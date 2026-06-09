import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yes_madam/controller/account/account_controller.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_texts.dart';
import 'package:yes_madam/widgets/common/common_text.dart';
import '../../controller/bottom_nav/bottom_nav_bar_controller.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_font_weights.dart';
import '../home/home_screen.dart';
import '../ozuzu/ozuzu_screen.dart';
import '../bookings/bookings_screen.dart';
import '../account/account_screen.dart';

class BottomNavBarScreen extends StatelessWidget {
  BottomNavBarScreen({super.key});

  final mainCtrl = Get.put(BottomNavBarController());
  final accountCtrl = Get.put(AccountController());

  final List<Widget> _pages = [
    const HomeScreen(),
    const OzuzuScreen(),
    BookingsScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: mainCtrl.currentIndex.value,
          children: _pages,
        ),
        bottomNavigationBar: _buildBottomNav(),
        floatingActionButton: _buildKoreanSummerFab(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
            color: AppColors.grey200,
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: SizedBox(
          height: 60.h,
          child: Row(
            children: [
              _navItem(0, 'YM', null, isYm: true),
              _navItem(1, 'Ozuzu', Icons.circle_outlined),
              SizedBox(width: 60.w),
              _navItem(2, 'Bookings', Icons.calendar_today_outlined),
              _navItem(3, 'Account', Icons.person_outline),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem(
    int index,
    String label,
    IconData? icon, {
    bool isYm = false,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: () => mainCtrl.changePage(index),
        behavior: HitTestBehavior.opaque,
        child: Obx(() {
          final isActive = mainCtrl.currentIndex.value == index;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isYm)
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'ym',
                        style: TextStyle(
                          fontSize: AppFontSizes.fontXMedium,
                          fontWeight: AppFontWeights.black,
                          color: isActive
                              ? AppColors.accentColor
                              : Colors.black54,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                )
              else
                Icon(
                  icon!,
                  size: 22.sp,
                  color: isActive ? AppColors.accentColor : Colors.black54,
                ),
              SizedBox(height: 2.h),
              CommonText(
                text: label,
                fontSize: AppFontSizes.fontNenoSmall,
                color: isActive ? AppColors.accentColor : Colors.black54,
                fontWeight: isActive
                    ? AppFontWeights.semiBold
                    : AppFontWeights.normal,
              ),
              if (isActive)
                Container(
                  margin: EdgeInsets.only(top: 2.h),
                  width: 20.w,
                  height: 2.h,
                  decoration: BoxDecoration(
                    color: AppColors.accentColor,
                    borderRadius: BorderRadius.circular(1.r),
                  ),
                ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildKoreanSummerFab() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 58.w,
        height: 58.w,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF4CAF50), Color(0xFF2196F3), Color(0xFFFF9800)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: CommonText(text:AppTexts.koreanSummer,
            color: AppColors.whiteColor,
            fontSize: AppFontSizes.fontNenoSmall,
            fontWeight: AppFontWeights.bold,
          )
        ),
      ),
    );
  }
}
