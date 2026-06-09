import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:yes_madam/bindings/splash/splash_binding.dart';
import 'package:yes_madam/routes/app_pages.dart';
import 'package:yes_madam/routes/app_routes.dart';
import 'package:yes_madam/theme/app_theme.dart';
import 'package:yes_madam/utils/app_texts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return Sizer(
          builder: (context, orientation, deviceType) {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: AppTexts.appTitle,
              theme: AppTheme.darkTheme,
              initialBinding: SplashBinding(),
              initialRoute: AppRoutes.splash,
              getPages: AppPages.pages,
              defaultTransition: Transition.cupertino,
            );
          },
        );
      },
    );
  }
}