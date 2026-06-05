import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GradientText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final int? maxLines;

  const GradientText({
    super.key,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white,
            Colors.white70,
            Colors.white30,
            Colors.transparent,
          ],
        ).createShader(bounds);
      },
      blendMode: BlendMode.srcIn,
      child: Text(
        text,
        maxLines: maxLines,
        style: GoogleFonts.namdhinggo(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: Colors.white,
          shadows: [
            Shadow(
              color: Colors.black.withOpacity(0.6),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
      ),
    );
  }
}