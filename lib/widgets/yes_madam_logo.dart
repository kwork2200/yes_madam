import 'package:flutter/material.dart';
import 'package:yes_madam/utils/app_images.dart';

class YesMadamLogo extends StatelessWidget {
  final double? width;
  final double? height;
  final BoxFit fit;
  final Color? color;
  final BlendMode blendMode;

  const YesMadamLogo({
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.color,
    this.blendMode = BlendMode.srcIn,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.yesMadamAppLogo,
      width: width,
      height: height,
      fit: fit,
      color: color,
      colorBlendMode: blendMode,
    );
  }
}