import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:flutter/material.dart';

class UnderlinedTextLink extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final double? fontSize;

  const UnderlinedTextLink({
    super.key,
    required this.text,
    this.onTap,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize ?? AppFontSizes.fontSmall,
          color: AppColors.themeColor,
          decoration: TextDecoration.underline,
          decorationColor: AppColors.themeColor,
        ),
      ),
    );
  }
}