import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yes_madam/routes/app_routes.dart';
import 'package:yes_madam/utils/app_colors.dart';
import '../../controller/cart/cart_controller.dart';

class BottomCartWidget extends GetView<CartController> {
  const BottomCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (!controller.hasItems) {
        return const SizedBox.shrink();
      }

      return GestureDetector(
        onTap: () => Get.toNamed(AppRoutes.checkout),
        child: Container(
          height: 45.h,
          margin: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 12.h,
          ),
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          decoration: BoxDecoration(
            color: AppColors.green,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 70.w,
              height: 24.h,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ...List.generate(
                    controller.previewImages.length > 3
                        ? 3
                        : controller.previewImages.length,
                        (index) {
                      final totalWidth =
                          ((controller.previewImages.length > 3
                              ? 3
                              : controller.previewImages.length) -
                              1) *
                              14.w;

                      return Positioned(
                        left: (60.w - totalWidth - 20.w) / 2 + (index * 14.w),
                        child: CircleAvatar(
                          radius: 10.r,
                          backgroundColor: AppColors.whiteColor,
                          backgroundImage: NetworkImage(
                            controller.previewImages[index],
                          ),
                        ),
                      );
                    },
                  ),

                  if (controller.totalServices > 3)
                    Positioned(
                      left: 34.w,
                      child: CircleAvatar(
                        radius: 10.r,
                        backgroundColor: AppColors.whiteColor,
                        child: Text(
                          '+${controller.totalServices - 3}',
                          style: TextStyle(
                            fontSize: 10.sp,color:AppColors.green ,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),

            Text(
              '${controller.totalServices} services added',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),

            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'VIEW CART',
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(width: 8.w),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 14.sp,
                ),
              ],
            ),
          ],
        ),
        ),
      );
    });
  }
}