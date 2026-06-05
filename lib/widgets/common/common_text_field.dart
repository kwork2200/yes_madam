import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_font_sizes.dart';

class CommonTextField extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final int? maxLines;
  final int? maxLength;
  final bool enabled;
  final bool readOnly;
  final VoidCallback? onTap;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final void Function(String)? onSubmitted;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final Color? fillColor;
  final bool filled;
  final String? counterText;
  final List<TextInputFormatter>? inputFormatters;
  final AutovalidateMode autovalidateMode;
  final InputBorder? focusedErrorBorder;

  const CommonTextField({
    super.key,
    this.hintText,
    this.labelText,
    this.controller,
    this.onChanged,
    this.keyboardType,
    this.textInputAction,
    this.obscureText = false,
    this.maxLines = 1,
    this.maxLength,
    this.enabled = true,
    this.readOnly = false,
    this.onTap,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.onSubmitted,
    this.focusNode,
    this.contentPadding,
    this.border,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.textStyle,
    this.hintStyle,
    this.fillColor,
    this.filled = false,
    this.counterText,
    this.inputFormatters,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.focusedErrorBorder,
  });

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  bool _isControllerDisposed = false;

  @override
  void initState() {
    super.initState();
    _isControllerDisposed = false;
  }

  @override
  void didUpdateWidget(CommonTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      _isControllerDisposed = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isControllerValid = widget.controller != null && !_isControllerDisposed;

    return TextFormField(
      autovalidateMode: widget.autovalidateMode,
      controller: isControllerValid ? widget.controller : null,
      onChanged: widget.onChanged,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      obscureText: widget.obscureText,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      onTap: widget.onTap,
      validator: widget.validator,
      onFieldSubmitted: widget.onSubmitted,
      focusNode: widget.focusNode,
      inputFormatters: widget.inputFormatters,
      style: widget.textStyle ?? TextStyle(fontSize: AppFontSizes.fontMedium, color: AppColors.blackColor
      ),
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        contentPadding: widget.contentPadding ??
            EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 10.h,
            ),

        filled: widget.filled,
        fillColor: widget.fillColor ?? AppColors.whiteColor,
        counterText: widget.counterText,

        border: widget.border ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: const BorderSide(
                color: AppColors.inputBorderColor,
              ),
            ),

        enabledBorder: widget.enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(
                color: AppColors.inputBorderColor,
              ),
            ),

        focusedBorder: widget.focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(
                color: AppColors.themeColor,
                width: 1.5,
              ),
            ),

        errorBorder: widget.errorBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(
                color: AppColors.errorColor,
              ),
            ),

        focusedErrorBorder: widget.focusedErrorBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(
                color: AppColors.errorColor,
                width: 1.5,
              ),
            ),

        hintStyle: widget.hintStyle ??
            TextStyle(
              color: AppColors.textHintColor,
              fontSize: AppFontSizes.fontMedium,
              fontWeight: AppFontWeights.bold,
            ),

        labelStyle: TextStyle(
          color: AppColors.themeColor,
          fontSize: AppFontSizes.fontSmall,
        ),
      ),    );
  }

  @override
  void dispose() {
    _isControllerDisposed = true;
    super.dispose();
  }
}