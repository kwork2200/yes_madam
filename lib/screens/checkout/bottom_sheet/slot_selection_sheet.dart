import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/widgets/common/common_text.dart';
import 'package:yes_madam/widgets/components/spacing_widget.dart';

class SlotSelectionSheet extends StatefulWidget {
  final List<ProfessionalType> professionals;
  final List<DateTime> availableDates;
  final List<TimeSlot> timeSlots;
  final void Function(
    ProfessionalType professional,
    DateTime date,
    TimeSlot slot,
  ) onConfirm;

  const SlotSelectionSheet({
    super.key,
    required this.professionals,
    required this.availableDates,
    required this.timeSlots,
    required this.onConfirm,
  });

  static void show(
    BuildContext context, {
    required List<ProfessionalType> professionals,
    required List<DateTime> availableDates,
    required List<TimeSlot> timeSlots,
    required void Function(ProfessionalType, DateTime, TimeSlot) onConfirm,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => SlotSelectionSheet(
        professionals: professionals,
        availableDates: availableDates,
        timeSlots: timeSlots,
        onConfirm: onConfirm,
      ),
    );
  }

  @override
  State<SlotSelectionSheet> createState() => _SlotSelectionSheetState();
}

class _SlotSelectionSheetState extends State<SlotSelectionSheet> {
  ProfessionalType? _selectedPro;
  DateTime? _selectedDate;
  TimeSlot? _selectedSlot;

  bool get _canConfirm =>
      _selectedDate != null && _selectedSlot != null;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.85,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (_, sc) => Container(
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        ),
        child: Column(
          children: [
            // Handle
            Container(
              margin: EdgeInsets.only(top: 10.h, bottom: 8.h),
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: AppColors.borderColor,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                controller: sc,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacing.height(8),

                    // Professional selection
                    CommonText(
                      text: 'Choose Professional',
                      fontSize: AppFontSizes.fontXMedium,
                      fontWeight: AppFontWeights.bold,
                      color: AppColors.blackColor,
                    ),
                    Spacing.height(12),
                    Row(
                      children: widget.professionals
                          .map((pro) => _ProfessionalChip(
                                pro: pro,
                                isSelected: _selectedPro == pro,
                                onTap: () =>
                                    setState(() => _selectedPro = pro),
                              ))
                          .toList(),
                    ),
                    Spacing.height(20),

                    // Date selection
                    CommonText(
                      text: 'Select Date',
                      fontSize: AppFontSizes.fontXMedium,
                      fontWeight: AppFontWeights.bold,
                      color: AppColors.blackColor,
                    ),
                    Spacing.height(12),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: widget.availableDates
                            .map((date) => _DateChip(
                                  date: date,
                                  isSelected: _selectedDate == date,
                                  onTap: () =>
                                      setState(() => _selectedDate = date),
                                ))
                            .toList(),
                      ),
                    ),
                    Spacing.height(20),

                    // Time slots
                    CommonText(
                      text: 'Select Service Start Time',
                      fontSize: AppFontSizes.fontXMedium,
                      fontWeight: AppFontWeights.bold,
                      color: AppColors.blackColor,
                    ),
                    Spacing.height(4),
                    CommonText(
                      text:
                          'Professional will arrive within 15 mins of the selected slot',
                      fontSize: AppFontSizes.fontSmall,
                      color: AppColors.greyColor,
                      softWrap: true,
                    ),
                    Spacing.height(12),
                    _TimeSlotsGrid(
                      slots: widget.timeSlots,
                      selected: _selectedSlot,
                      onSelect: (slot) =>
                          setState(() => _selectedSlot = slot),
                    ),
                    Spacing.height(16),

                    // Schedule summary
                    if (_selectedDate != null && _selectedSlot != null)
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 10.h),
                        decoration: BoxDecoration(
                          color: AppColors.backgroundGrey,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.calendar_today,
                                size: 16.sp, color: AppColors.themeColor),
                            Spacing.width(8),
                            CommonText(
                              text:
                                  'Schedule At:  ${_formatDate(_selectedDate!)} | ${_selectedSlot!.label}',
                              fontSize: AppFontSizes.fontSmall,
                              fontWeight: AppFontWeights.semiBold,
                              color: AppColors.themeColor,
                            ),
                          ],
                        ),
                      ),

                    Spacing.height(20),
                  ],
                ),
              ),
            ),

            // Confirm button
            Container(
              padding:
                  EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              color: AppColors.whiteColor,
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _canConfirm
                      ? () {
                          widget.onConfirm(
                            _selectedPro ?? widget.professionals.first,
                            _selectedDate!,
                            _selectedSlot!,
                          );
                          Navigator.pop(context);
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _canConfirm
                        ? AppColors.themeColor
                        : AppColors.disableButtonColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r)),
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                  ),
                  child: CommonText(
                    text: 'CONFIRM SLOT',
                    fontSize: AppFontSizes.fontMedium,
                    fontWeight: AppFontWeights.bold,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime d) {
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    const months = [
      'Jan','Feb','Mar','Apr','May','Jun',
      'Jul','Aug','Sep','Oct','Nov','Dec'
    ];
    return '${days[d.weekday - 1]}, ${d.day} ${months[d.month - 1]}';
  }
}

// ─── Models ──────────────────────────────────────────────────────────────────

class ProfessionalType {
  final String label;
  final String? iconUrl;
  ProfessionalType({required this.label, this.iconUrl});
}

class TimeSlot {
  final String label; // e.g. "09:00 AM"
  final int? surgePrice; // e.g. 100 for "+₹100"
  TimeSlot({required this.label, this.surgePrice});
}

// ─── Sub-widgets ─────────────────────────────────────────────────────────────

class _ProfessionalChip extends StatelessWidget {
  final ProfessionalType pro;
  final bool isSelected;
  final VoidCallback onTap;

  const _ProfessionalChip(
      {required this.pro, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: 12.w),
        child: Column(
          children: [
            Container(
              width: 60.w,
              height: 60.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? AppColors.themeColor
                      : AppColors.borderColor,
                  width: isSelected ? 2.5 : 1,
                ),
                color: AppColors.lightPinkColor,
              ),
              child: pro.iconUrl != null
                  ? ClipOval(
                      child: Image.network(pro.iconUrl!,
                          fit: BoxFit.cover))
                  : Icon(Icons.person,
                      size: 30.sp, color: AppColors.themeColor),
            ),
            Spacing.height(6),
            CommonText(
              text: pro.label,
              fontSize: AppFontSizes.fontSmall,
              fontWeight: isSelected
                  ? AppFontWeights.semiBold
                  : AppFontWeights.normal,
              color: AppColors.blackColor,
            ),
          ],
        ),
      ),
    );
  }
}

class _DateChip extends StatelessWidget {
  final DateTime date;
  final bool isSelected;
  final VoidCallback onTap;

  const _DateChip(
      {required this.date, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    const days = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];
    final dayName = days[date.weekday - 1];

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 52.w,
        margin: EdgeInsets.only(right: 10.w),
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.themeColor : AppColors.whiteColor,
          border: Border.all(
            color: isSelected
                ? AppColors.themeColor
                : AppColors.inputBorderColor,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          children: [
            CommonText(
              text: dayName,
              fontSize: AppFontSizes.fontNenoSmall,
              fontWeight: AppFontWeights.semiBold,
              color:
                  isSelected ? AppColors.whiteColor : AppColors.greyColor,
              textAlign: TextAlign.center,
            ),
            Spacing.height(4),
            CommonText(
              text: '${date.day}',
              fontSize: AppFontSizes.fontXMedium,
              fontWeight: AppFontWeights.bold,
              color: isSelected
                  ? AppColors.whiteColor
                  : AppColors.blackColor,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _TimeSlotsGrid extends StatelessWidget {
  final List<TimeSlot> slots;
  final TimeSlot? selected;
  final void Function(TimeSlot) onSelect;

  const _TimeSlotsGrid(
      {required this.slots, required this.selected, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 2.4,
        crossAxisSpacing: 8.w,
        mainAxisSpacing: 8.h,
      ),
      itemCount: slots.length,
      itemBuilder: (_, i) {
        final slot = slots[i];
        final isSelected = selected == slot;
        return GestureDetector(
          onTap: () => onSelect(slot),
          child: Container(
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.themeColor.withOpacity(0.1)
                  : AppColors.whiteColor,
              border: Border.all(
                color: isSelected
                    ? AppColors.themeColor
                    : AppColors.inputBorderColor,
                width: isSelected ? 1.5 : 1,
              ),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonText(
                  text: slot.label,
                  fontSize: AppFontSizes.fontSmall,
                  fontWeight: isSelected
                      ? AppFontWeights.semiBold
                      : AppFontWeights.normal,
                  color: isSelected
                      ? AppColors.themeColor
                      : AppColors.blackColor,
                  textAlign: TextAlign.center,
                ),
                if (slot.surgePrice != null)
                  CommonText(
                    text: '+₹${slot.surgePrice}',
                    fontSize: AppFontSizes.fontNenoSmall,
                    color: AppColors.greyColor,
                    textAlign: TextAlign.center,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
