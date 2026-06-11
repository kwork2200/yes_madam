import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/widgets/common/common_text.dart';
import 'package:yes_madam/widgets/components/spacing_widget.dart';

class DisposableCostSelector extends StatelessWidget {
  final int costPerPerson;
  final RxInt selectedPersons;
  final void Function(int) onChanged;

  const DisposableCostSelector({
    super.key,
    required this.costPerPerson,
    required this.selectedPersons,
    required this.onChanged,
  });

  int get totalCost => costPerPerson * selectedPersons.value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  CommonText(
                    text: 'Disposable Cost',
                    fontSize: AppFontSizes.fontSmall,
                    color: AppColors.blackColor,
                    fontWeight: AppFontWeights.medium,
                  ),
                  Spacing.width(4),
                  Icon(
                    Icons.info_outline,
                    size: 16.sp,
                    color: AppColors.coinOrange,
                  ),
                ],
              ),
            ),

            Obx(
                  () => CommonText(
                text: '₹$totalCost',
                fontSize: AppFontSizes.fontSmall,
                fontWeight: AppFontWeights.normal,
                color: AppColors.blackColor,
              ),
            ),

            Spacing.width(10),

            GestureDetector(
              onTap: () => DisposablePersonsSelectorSheet.show(
                context,
                initialCount: selectedPersons.value,
                onConfirm: onChanged,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.black54),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Obx(
                      () => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CommonText(
                        text: '${selectedPersons.value} person',
                        fontSize: AppFontSizes.fontNenoSmall,
                        color: AppColors.blackColor,
                      ),
                      Spacing.width(4),
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 16.sp,
                        color: AppColors.blackColor,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DisposablePersonsSelectorSheet {
  static void show(
      BuildContext context, {
        required int initialCount,
        required void Function(int) onConfirm,
      }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      isDismissible: true,
      enableDrag: true,
      builder: (_) {
        return _DisposablePersonsBottomSheet(
          initialCount: initialCount,
          onConfirm: onConfirm,
        );
      },
    );
  }
}

class _DisposablePersonsBottomSheet extends StatefulWidget {
  final int initialCount;
  final void Function(int count) onConfirm;

  const _DisposablePersonsBottomSheet({
    required this.initialCount,
    required this.onConfirm,
  });

  @override
  State<_DisposablePersonsBottomSheet> createState() =>
      _DisposablePersonsBottomSheetState();
}

class _DisposablePersonsBottomSheetState
    extends State<_DisposablePersonsBottomSheet> {
  late int _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.initialCount;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.r),
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 20.w,
              right: 20.w,
              top: 20.h,
              bottom: MediaQuery.of(context).viewInsets.bottom + 20.h,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CommonText(
                        text: 'How many people do you need product(s) for?',
                        fontSize: AppFontSizes.fontXMedium,
                        fontWeight: AppFontWeights.bold,
                        color: AppColors.blackColor,
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
                Spacing.height(8),
                ...List.generate(5, (i) {
                  final count = i + 1;
                  final label = count == 1 ? '1 person' : '$count persons';

                  return Column(
                    children: [
                      _PersonOption(
                        label: label,
                        isSelected: _selected == count,
                        onTap: () {
                          setState(() => _selected = count);
                          widget.onConfirm(count);
                          Navigator.pop(context);
                        },
                      ),

                      if (i != 4)
                        Divider(
                          height: 1,
                          thickness: 1,
                          color: AppColors.grey100,
                        ),
                    ],
                  );
                }),
              ],
            ),
          ),
          Positioned(
            top: -35.h,
            right: 10.w,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: EdgeInsets.all(5.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Icon(
                  Icons.close,
                  size: 18.sp,
                  color: AppColors.blackColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PersonOption extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _PersonOption({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Row(
          children: [
            Container(
              width: 18.w,
              height: 18.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? AppColors.themeColor
                      : AppColors.themeColor,
                  width: isSelected ? 6 : 1.5,
                ),
                color: isSelected
                    ? AppColors.themeColor
                    : AppColors.whiteColor,
              ),
              child: isSelected
                  ? Center(
                child: Container(
                  width: 8.w,
                  height: 8.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              )
                  : null,
            ),
            Spacing.width(14),
            CommonText(
              text: label,
              fontSize: AppFontSizes.fontXMedium,
              fontWeight:
              isSelected ? AppFontWeights.semiBold : AppFontWeights.normal,
              color: AppColors.blackColor,
            ),
          ],
        ),
      ),
    );
  }
}