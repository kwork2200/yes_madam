import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Spacing {
  static Widget height(double height) {
    return SizedBox(height: height.h);
  }

  static Widget width(double width) {
    return SizedBox(width: width.w);
  }
}

// import 'package:get/get.dart';
//
// import 'package:yes_madam/routes/initial_binding.dart';
//
// import 'package:yes_madam/screens/splash/splash_screen.dart';
//
// import 'app_routes.dart';
//
//
//
// class AppPages {
//
//   static final pages = <GetPage>[
//
//     GetPage(
//
//       name: AppRoutes.splash,
//
//       page: () => SplashScreen(),
//
//       binding: InitialBinding(),
//
//     ),
//
//   ];
//
// }
//
// class AppRoutes {
//
//   static const splash = '/';
//
//
//
// }
//
// import 'package:get/get.dart';
//
// import 'package:yes_madam/controller/splash/splash_controller.dart';
//
//
//
// class InitialBinding extends Bindings {
//
//   @override
//
//   void dependencies() {
//
//     Get.lazyPut<SplashController>(() => SplashController());
//
//   }
//
// }import 'package:flutter/material.dart';
//
//
//
// class AppColors {
//
//   static const whiteColor = Color(0xFFFFFFFF);
//
//   static const themeColor = Color(0xFFaf7379);
//
//   // static const themeColor = Color(0xFF6a56a7);
//
//   static const accentColor = Color(0xFFB06070);
//
//   static const disableButtonColor = Color(0xFFe5e5e5);
//
//   static Color greyColor = Colors.grey;
//
//   static Color blackColor = Colors.black;
//
//   static Color redAccentColor = Colors.redAccent;
//
//   static Color primaryBlue = const Color(0xFF4087EC);
//
// }class AppDimensions {
//
//
//
//   // Padding
//
//   static double paddingSmall = 10.0;
//
//   static double paddingMedium = 16.0;
//
//   static double paddingXMedium = 20.0;
//
//   static double paddingLarge = 24.0;
//
//   static double paddingXLarge = 32.0;
//
//   static double paddingXLarge40 = 40.0;
//
//   static double paddingXLarge60 = 60.0;
//
//   static double webPaddingLarge = 80;
//
//
//
//   // Margin
//
//   static const double marginSmall = 8.0;
//
//   static const double marginMedium = 16.0;
//
//   static const double marginLarge = 24.0;
//
//   static const double marginXLarge = 32.0;
//
//
//
//   // Spacing
//
//   static const double spacingSmall = 4.0;
//
//   static const double spacingMedium = 8.0;
//
//   static const double spacingLarge = 12.0;
//
//   static const double spacingXLarge = 16.0;
//
//
//
//   // Border Radius
//
//   static const double radiusSmall = 8.0;
//
//   static const double radiusMedium = 12.0;
//
//   static const double radiusLarge = 16.0;
//
//   static const double radiusXLarge = 24.0;
//
//
//
//   // Icon Sizes
//
//   static const double iconSmall = 16.0;
//
//   static const double iconMedium = 24.0;
//
//   static const double iconLarge = 32.0;
//
//
//
// }
//
//
//
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
//
//
// class AppFontSizes {
//
//   static double fontSmall = 12.0.sp;
//
//   static double fontMedium = 14.0.sp;
//
//   static double fontXMedium = 16.0.sp;
//
//   static double fontLarge = 20.0.sp;
//
//   static double fontXLarge = 24.0.sp;
//
//   static double fontXLarge26 = 26.0.sp;
//
//   static double fontXLarge32 = 32.0.sp;
//
//   static double fontXLarge36 = 36.0.sp;
//
//   static double fontNenoSmall = 10.0.sp;
//
// }
//
//
//
// import 'package:flutter/material.dart';
//
//
//
// class AppFontWeights {
//
//   static const FontWeight thin = FontWeight.w100;
//
//   static const FontWeight extraLight = FontWeight.w200;
//
//   static const FontWeight light = FontWeight.w300;
//
//   static const FontWeight normal = FontWeight.w400;
//
//   static const FontWeight medium = FontWeight.w500;
//
//   static const FontWeight semiBold = FontWeight.w600;
//
//   static const FontWeight bold = FontWeight.w700;
//
//   static const FontWeight extraBold = FontWeight.w800;
//
//   static const FontWeight black = FontWeight.w900;
//
//   static const FontWeight originalBold = FontWeight.bold;
//
//   static const FontWeight regular = FontWeight.w400;
//
//   static const FontWeight heavy = FontWeight.w900;
//
// }class AppImages {
//
//   static const String yesMadamAppLogo = 'assets/images/ym_logo.png';
//
// }
//
// class AppTexts {
//
//   static const String splashTitle = 'Salon Expert at Home Delivery';
//
//   static const String appTitle = 'YesMadam';
//
//   static const String splashCustomers = '10 Lakh+ Happy Customers';
//
// }import 'package:yes_madam/utils/app_font_sizes.dart';
//
// import 'package:yes_madam/utils/app_font_weights.dart';
//
// import 'package:flutter/material.dart';
//
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import 'package:yes_madam/utils/app_colors.dart';
//
// import 'common_text.dart';
//
//
//
// class CommonButton extends StatelessWidget {
//
//   final String text;
//
//   final VoidCallback? onPressed;
//
//   final bool isEnabled;
//
//   final double? height;
//
//   final double? width;
//
//   final double? fontSize;
//
//   final FontWeight? fontWeight;
//
//   final Widget? icon;
//
//   final Color? backgroundColor;
//
//   final Color? borderColor;
//
//   final Color? textColor;
//
//
//
//   const CommonButton({
//
//     super.key,
//
//     required this.text,
//
//     this.onPressed,
//
//     this.isEnabled = true,
//
//     this.height,
//
//     this.width,
//
//     this.fontSize,
//
//     this.fontWeight,
//
//     this.icon,
//
//     this.backgroundColor,
//
//     this.borderColor,
//
//     this.textColor,
//
//   });
//
//
//
//   @override
//
//   Widget build(BuildContext context) {
//
//     return SizedBox(
//
//       width: width,
//
//       height: height ?? 45.h,
//
//       child: ElevatedButton(
//
//         onPressed: isEnabled ? onPressed : () => {},
//
//         style: ElevatedButton.styleFrom(
//
//           backgroundColor: backgroundColor ?? (isEnabled ? AppColors.themeColor : AppColors.disableButtonColor),
//
//           disabledBackgroundColor: AppColors.disableButtonColor,
//
//           side: borderColor != null ? BorderSide(
//
//             color: borderColor!,
//
//             width: 1.5,
//
//           ) : null,
//
//           shape: RoundedRectangleBorder(
//
//             borderRadius: BorderRadius.circular(8.r),
//
//           ),
//
//         ),
//
//         child: Row(
//
//           mainAxisSize: MainAxisSize.min,
//
//           mainAxisAlignment: MainAxisAlignment.center,
//
//           children: [
//
//             CommonText(
//
//               text: text,
//
//               fontSize: fontSize ?? AppFontSizes.fontMedium,
//
//               fontWeight: fontWeight ?? AppFontWeights.bold,
//
//               color: textColor ?? AppColors.whiteColor,
//
//             ),
//
//             if (icon != null) ...[
//
//               SizedBox(width: 8.w),
//
//               icon!,
//
//             ],
//
//           ],
//
//         ),
//
//       ),
//
//     );
//
//   }
//
// }import 'package:yes_madam/utils/app_colors.dart';
//
// import 'package:flutter/material.dart';
//
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
//
//
// class CommonText extends StatelessWidget {
//
//   final String text;
//
//   final double fontSize;
//
//   final FontWeight fontWeight;
//
//   final Color color;
//
//   final TextAlign textAlign;
//
//   final int? maxLines;
//
//   final TextOverflow? overflow;
//
//   final TextDecoration? decoration;
//
//   final bool videoScreenCheck;
//
//   final bool softWrap;
//
//   final Color? decorationColor;
//
//   final double? decorationThickness;
//
//   final double? letterSpacing;
//
//   final double? textHeight;
//
//   final FontStyle? fontStyle;
//
//
//
//   const CommonText({
//
//     super.key,
//
//     required this.text,
//
//     this.fontSize = 16,
//
//     this.fontWeight = FontWeight.normal,
//
//     this.color = AppColors.whiteColor,
//
//     this.textAlign = TextAlign.start,
//
//     this.maxLines,
//
//     this.overflow,
//
//     this.decoration,
//
//     this.videoScreenCheck = false,
//
//     this.softWrap = false,
//
//     this.decorationColor,
//
//     this.decorationThickness,
//
//     this.letterSpacing,
//
//     this.textHeight,
//
//     this.fontStyle,
//
//   });
//
//
//
//   double _responsiveFontSize(BuildContext context) {
//
//     final width = MediaQuery.of(context).size.width;
//
//     if (width >= 1440) return fontSize;
//
//     if (width >= 1024) return fontSize * 0.92;
//
//     if (width >= 600) return fontSize;
//
//     return fontSize;
//
//   }
//
//
//
//   @override
//
//   Widget build(BuildContext context) {
//
//     final double resolvedFontSize = _responsiveFontSize(context);
//
//     final effectiveColor = videoScreenCheck ? AppColors.whiteColor : color;
//
//
//
//     final TextStyle base =
//
//         Theme.of(context).textTheme.bodyMedium ?? const TextStyle();
//
//     final TextStyle style = base.copyWith(
//
//       fontSize: resolvedFontSize.sp,
//
//       fontWeight: fontWeight,
//
//       color: effectiveColor,
//
//       decoration: decoration,
//
//       decorationColor: decorationColor,
//
//       decorationThickness: decorationThickness,
//
//       letterSpacing: letterSpacing,
//
//       height: textHeight,
//
//       fontStyle: fontStyle,
//
//     );
//
//
//
//     return Text(
//
//       text,
//
//       textAlign: textAlign,
//
//       maxLines: maxLines,
//
//       overflow: overflow,
//
//       softWrap: softWrap,
//
//       style: style,
//
//     );
//
//   }
//
// }
//
// import 'package:flutter/material.dart';
//
// import 'package:flutter/services.dart';
//
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../utils/app_colors.dart';
//
// import '../../utils/app_font_sizes.dart';
//
//
//
// class CommonTextField extends StatefulWidget {
//
//   final String? hintText;
//
//   final String? labelText;
//
//   final TextEditingController? controller;
//
//   final ValueChanged<String>? onChanged;
//
//   final TextInputType? keyboardType;
//
//   final TextInputAction? textInputAction;
//
//   final bool obscureText;
//
//   final int? maxLines;
//
//   final int? maxLength;
//
//   final bool enabled;
//
//   final bool readOnly;
//
//   final VoidCallback? onTap;
//
//   final Widget? prefixIcon;
//
//   final Widget? suffixIcon;
//
//   final String? Function(String?)? validator;
//
//   final void Function(String)? onSubmitted;
//
//   final FocusNode? focusNode;
//
//   final EdgeInsetsGeometry? contentPadding;
//
//   final InputBorder? border;
//
//   final InputBorder? enabledBorder;
//
//   final InputBorder? focusedBorder;
//
//   final InputBorder? errorBorder;
//
//   final TextStyle? textStyle;
//
//   final TextStyle? hintStyle;
//
//   final Color? fillColor;
//
//   final bool filled;
//
//   final String? counterText;
//
//   final List<TextInputFormatter>? inputFormatters;
//
//   final AutovalidateMode autovalidateMode;
//
//   final InputBorder? focusedErrorBorder;
//
//
//
//   const CommonTextField({
//
//     super.key,
//
//     this.hintText,
//
//     this.labelText,
//
//     this.controller,
//
//     this.onChanged,
//
//     this.keyboardType,
//
//     this.textInputAction,
//
//     this.obscureText = false,
//
//     this.maxLines = 1,
//
//     this.maxLength,
//
//     this.enabled = true,
//
//     this.readOnly = false,
//
//     this.onTap,
//
//     this.prefixIcon,
//
//     this.suffixIcon,
//
//     this.validator,
//
//     this.onSubmitted,
//
//     this.focusNode,
//
//     this.contentPadding,
//
//     this.border,
//
//     this.enabledBorder,
//
//     this.focusedBorder,
//
//     this.errorBorder,
//
//     this.textStyle,
//
//     this.hintStyle,
//
//     this.fillColor,
//
//     this.filled = false,
//
//     this.counterText,
//
//     this.inputFormatters,
//
//     this.autovalidateMode = AutovalidateMode.disabled,
//
//     this.focusedErrorBorder,
//
//   });
//
//
//
//   @override
//
//   State<CommonTextField> createState() => _CommonTextFieldState();
//
// }
//
//
//
// class _CommonTextFieldState extends State<CommonTextField> {
//
//   // Track if the controller has been disposed
//
//   bool _isControllerDisposed = false;
//
//
//
//   @override
//
//   void initState() {
//
//     super.initState();
//
//     _isControllerDisposed = false;
//
//   }
//
//
//
//   @override
//
//   void didUpdateWidget(CommonTextField oldWidget) {
//
//     super.didUpdateWidget(oldWidget);
//
//     // Reset the flag if controller changes
//
//     if (oldWidget.controller != widget.controller) {
//
//       _isControllerDisposed = false;
//
//     }
//
//   }
//
//
//
//   @override
//
//   Widget build(BuildContext context) {
//
//     // Check if controller is null or disposed
//
//     final isControllerValid = widget.controller != null && !_isControllerDisposed;
//
//
//
//     return TextFormField(
//
//       autovalidateMode: widget.autovalidateMode,
//
//       controller: isControllerValid ? widget.controller : null,
//
//       onChanged: widget.onChanged,
//
//       keyboardType: widget.keyboardType,
//
//       textInputAction: widget.textInputAction,
//
//       obscureText: widget.obscureText,
//
//       maxLines: widget.maxLines,
//
//       maxLength: widget.maxLength,
//
//       enabled: widget.enabled,
//
//       readOnly: widget.readOnly,
//
//       onTap: widget.onTap,
//
//       validator: widget.validator,
//
//       onFieldSubmitted: widget.onSubmitted,
//
//       focusNode: widget.focusNode,
//
//       inputFormatters: widget.inputFormatters,
//
//       style: widget.textStyle ??
//
//           TextStyle(
//
//             fontSize: AppFontSizes.fontMedium,
//
//             color: AppColors.blackColor,
//
//           ),
//
//       decoration: InputDecoration(
//
//         hintText: widget.hintText,
//
//         labelText: widget.labelText,
//
//         prefixIcon: widget.prefixIcon,
//
//         suffixIcon: widget.suffixIcon,
//
//         contentPadding: widget.contentPadding ??
//
//             EdgeInsets.symmetric(
//
//               horizontal: 16.w,
//
//               vertical: 10.h,
//
//             ),
//
//
//
//         filled: widget.filled,
//
//         fillColor: widget.fillColor,
//
//         counterText: widget.counterText,
//
//
//
//         border: widget.border ??
//
//             OutlineInputBorder(
//
//               borderRadius: BorderRadius.circular(12.r),
//
//               borderSide: BorderSide(
//
//                 color: Colors.grey.shade300,
//
//               ),
//
//             ),
//
//
//
//         enabledBorder: widget.enabledBorder ??
//
//             OutlineInputBorder(
//
//               borderRadius: BorderRadius.circular(12.r),
//
//               borderSide: BorderSide(
//
//                 color: Colors.grey.shade300,
//
//               ),
//
//             ),
//
//
//
//         focusedBorder: widget.focusedBorder ??
//
//             OutlineInputBorder(
//
//               borderRadius: BorderRadius.circular(12.r),
//
//               borderSide: BorderSide(
//
//                 color: AppColors.themeColor,
//
//                 width: 1.5,
//
//               ),
//
//             ),
//
//
//
//         errorBorder: widget.errorBorder ??
//
//             OutlineInputBorder(
//
//               borderRadius: BorderRadius.circular(12.r),
//
//               borderSide: const BorderSide(
//
//                 color: Colors.red,
//
//               ),
//
//             ),
//
//
//
//         focusedErrorBorder: widget.focusedErrorBorder ??
//
//             OutlineInputBorder(
//
//               borderRadius: BorderRadius.circular(12.r),
//
//               borderSide: const BorderSide(
//
//                 color: Colors.red,
//
//               ),
//
//             ),
//
//
//
//         hintStyle: widget.hintStyle ??
//
//             TextStyle(
//
//               color: AppColors.greyColor,
//
//               fontSize: AppFontSizes.fontSmall,
//
//             ),
//
//
//
//         labelStyle: TextStyle(
//
//           color: AppColors.themeColor,
//
//           fontSize: AppFontSizes.fontSmall,
//
//         ),
//
//       ),
//
//     );
//
//   }
//
//
//
//   @override
//
//   void dispose() {
//
//     // Note: We don't dispose the controller here because it's owned by the parent
//
//     _isControllerDisposed = true;
//
//     super.dispose();
//
//   }
//
// }import 'package:flutter/widgets.dart';
//
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
//
//
// class Spacing {
//
//   static Widget height(double height) {
//
//     return SizedBox(height: height.h);
//
//   }
//
//
//
//   static Widget width(double width) {
//
//     return SizedBox(width: width.w);
//
//   }
//
// }