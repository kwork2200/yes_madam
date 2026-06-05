import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/widgets/common/common_text.dart';
import 'package:flutter/material.dart';

class NoDataFound extends StatelessWidget {
  final String message;

  const NoDataFound({super.key, required this.message,});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CommonText(
        text: message,
        fontSize: AppFontSizes.fontMedium,
        color: AppColors.greyColor,
        fontWeight: AppFontWeights.medium,
        textAlign: TextAlign.center,
      ),
    );
  }
}
