import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../utils/app_colors.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final bool showBackButton;
  final VoidCallback? onBackPressed;
  final bool? centerTitle;
  final bool showBottomDivider;
  final List<Widget>? actions;
  final Color? backgroundColor;

  const CommonAppBar({
    super.key,
    this.title,
    this.showBackButton = false,
    this.onBackPressed,
    this.centerTitle,
    this.showBottomDivider = false,
    this.actions,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDarkBackground = backgroundColor == AppColors.themeColor;
    final Color iconColor = isDarkBackground ? AppColors.whiteColor : AppColors.blackColor;
    
    return AppBar(
      backgroundColor: backgroundColor ?? AppColors.whiteColor,
      elevation: 0,
      toolbarHeight: title != null ? kToolbarHeight : 0,
      leading: showBackButton
          ? IconButton(
              onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: iconColor,
                size: 16,
              ),
            )
          : null,
      title: title,
      centerTitle: centerTitle,
      actions: actions,
      bottom: showBottomDivider
          ? PreferredSize(
              preferredSize: const Size.fromHeight(1),
              child: Container(
                height: 1,
                width: double.infinity,
                color: AppColors.greyColor.withValues(alpha: 0.35),
              ),
            )
          : null,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: AppColors.themeColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );
  }

  @override
  Size get preferredSize {
    final double toolbar = title != null ? kToolbarHeight : 0;
    final double bottom = showBottomDivider ? 1 : 0;
    return Size.fromHeight(toolbar + bottom);
  }
}
