import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_font_weights.dart';
import '../../utils/app_font_sizes.dart';
import '../../utils/app_dimensions.dart';
import '../../widgets/common/common_text.dart';
import '../../widgets/common/common_app_bar.dart';

class HelpTopicDetailScreen extends StatefulWidget {
  final String question;
  final String answer;

  const HelpTopicDetailScreen({
    super.key,
    required this.question,
    required this.answer,
  });

  @override
  State<HelpTopicDetailScreen> createState() => _HelpTopicDetailScreenState();
}

class _HelpTopicDetailScreenState extends State<HelpTopicDetailScreen> {
  bool? _isHelpful;

  void _onThumbUp() {
    setState(() => _isHelpful = true);
  }

  void _onThumbDown() {
    setState(() => _isHelpful = false);
    _showFeedbackBottomSheet();
  }

  void _showFeedbackBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppDimensions.radiusMedium.r),
        ),
      ),
      builder: (_) => const _FeedbackBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundGrey,
      appBar: CommonAppBar(
        title: CommonText(
          text: 'Help Center',
          fontSize: AppFontSizes.fontXMedium,
          fontWeight: AppFontWeights.bold,
          color: AppColors.darkColor,
        ),
        showBackButton: true,
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(AppDimensions.spacingLarge.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(AppDimensions.radiusMedium.r),
              ),
              padding: EdgeInsets.all(AppDimensions.paddingMedium.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text: widget.question,
                    fontSize: AppFontSizes.fontMedium,
                    fontWeight: AppFontWeights.bold,
                    color: AppColors.darkColor,
                    maxLines: 5,
                  ),
                  SizedBox(height: AppDimensions.spacingMedium.h),
                  CommonText(
                    text: widget.answer,
                    fontSize: AppFontSizes.fontMedium,
                    color: AppColors.darkColor,
                    maxLines: 20,
                  ),
                ],
              ),
            ),
            SizedBox(height: AppDimensions.spacingLarge.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(
                  text: 'Was this Helpful?',
                  fontSize: AppFontSizes.fontMedium,
                  color: AppColors.greyColor,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: _onThumbUp,
                      child: Icon(
                        _isHelpful == true
                            ? Icons.thumb_up
                            : Icons.thumb_up_outlined,
                        size: AppFontSizes.fontXLarge.sp,
                        color: _isHelpful == true
                            ? AppColors.themeColor
                            : AppColors.greyColor,
                      ),
                    ),
                    SizedBox(width: AppDimensions.spacingLarge.w),
                    GestureDetector(
                      onTap: _onThumbDown,
                      child: Icon(
                        _isHelpful == false
                            ? Icons.thumb_down
                            : Icons.thumb_down_outlined,
                        size: AppFontSizes.fontXLarge.sp,
                        color: _isHelpful == false
                            ? AppColors.themeColor
                            : AppColors.greyColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _FeedbackBottomSheet extends StatefulWidget {
  const _FeedbackBottomSheet();

  @override
  State<_FeedbackBottomSheet> createState() => _FeedbackBottomSheetState();
}

class _FeedbackBottomSheetState extends State<_FeedbackBottomSheet> {
  int? _selectedIndex;
  bool _isSubmitting = false;

  final List<String> _options = [
    'This information is hard to understand',
    'My issue is not solved',
    'This is not what I was looking for',
    'Others',
  ];

  Future<void> _submit() async {
    if (_selectedIndex == null) return;
    setState(() => _isSubmitting = true);
    await Future.delayed(const Duration(milliseconds: 600));
    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppDimensions.paddingMedium.w,
        AppDimensions.paddingLarge.h,
        AppDimensions.paddingMedium.w,
        AppDimensions.paddingLarge.h +
            MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: 'Tell us how can we improve?',
            fontSize: AppFontSizes.fontXMedium,
            fontWeight: AppFontWeights.bold,
            color: AppColors.darkColor,
          ),
          SizedBox(height: AppDimensions.spacingLarge.h),

          ..._options.asMap().entries.map((entry) {
            final isSelected = _selectedIndex == entry.key;
            return GestureDetector(
              onTap: () => setState(() => _selectedIndex = entry.key),
              child: Padding(
                padding:
                EdgeInsets.only(bottom: AppDimensions.spacingMedium.h),
                child: Row(
                  children: [
                    Container(
                      width: 22.w,
                      height: 22.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isSelected
                              ? AppColors.themeColor
                              : AppColors.greyColor,
                          width: 2,
                        ),
                        color: isSelected
                            ? AppColors.themeColor
                            : Colors.transparent,
                      ),
                      child: isSelected
                          ? Icon(Icons.check,
                          size: 14.sp, color: AppColors.whiteColor)
                          : null,
                    ),
                    SizedBox(width: AppDimensions.spacingMedium.w),
                    Expanded(
                      child: CommonText(
                        text: entry.value,
                        fontSize: AppFontSizes.fontMedium,
                        color: AppColors.darkColor,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),

          SizedBox(height: AppDimensions.spacingLarge.h),

          SizedBox(
            width: double.infinity,
            height: 52.h,
            child: ElevatedButton(
              onPressed: _selectedIndex == null ? null : _submit,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.themeColor,
                disabledBackgroundColor: AppColors.themeColor.withOpacity(0.5),
                shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(AppDimensions.radiusMedium.r),
                ),
              ),
              child: _isSubmitting
                  ? SizedBox(
                width: 20.w,
                height: 20.w,
                child: CircularProgressIndicator(
                  color: AppColors.whiteColor,
                  strokeWidth: 2,
                ),
              )
                  : CommonText(
                text: 'Submit',
                fontSize: AppFontSizes.fontMedium,
                fontWeight: AppFontWeights.semiBold,
                color: AppColors.whiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}