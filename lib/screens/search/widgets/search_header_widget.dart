import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/widgets/components/search_text_field.dart';

class SearchHeaderWidget extends StatelessWidget {
  final TextEditingController controller;
  final String query;
  final VoidCallback onBack;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;

  const SearchHeaderWidget({super.key,
    required this.controller,
    required this.query,
    required this.onBack,
    required this.onChanged,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFFF8EF),
      padding: EdgeInsets.fromLTRB(20.w, 50.h, 20.w, 20.h),
      child: Row(
        children: [
          Expanded(
            child: SearchTextField(
              controller: controller,
              hintText: 'Search for waxing, facial, spa, & more',
              onChanged: onChanged,
              hidePrefixIcon: false,
              prefixIcon: Icon(Icons.arrow_back_ios, color: AppColors.blackColor),
              contentPadding: EdgeInsets.symmetric(vertical: 6.h),
              hintColor: AppColors.greyColor,
              showClearIcon: query.isNotEmpty,
              onClear: onClear,
            ),
          ),
        ],
      ),
    );
  }
}
