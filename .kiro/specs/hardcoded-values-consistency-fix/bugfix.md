# Bugfix Requirements Document

## Introduction

The Flutter project has inconsistent use of hardcoded values across all screens, violating the DRY (Don't Repeat Yourself) principle and causing maintainability issues. While common components (CommonText, CommonButton) and utility constants (AppColors, AppFontSizes, AppFontWeights, AppDimensions) have been established in the codebase, many screens bypass these abstractions and use hardcoded values directly. This leads to:

- **Inconsistent UI appearance** across different screens
- **Difficult maintenance** when design changes require updating multiple hardcoded values
- **Code duplication** and reduced reusability
- **Increased risk of errors** when applying theme changes

The fix will systematically replace all hardcoded values with the established common components and utility constants across all affected screens, while preserving the existing visual appearance and functionality.

## Bug Analysis

### Current Behavior (Defect)

1.1 WHEN rendering text in screens THEN the system uses hardcoded Text widgets with inline TextStyle definitions instead of CommonText widget
   - Example: `Text('Earn', style: TextStyle(color: AppColors.whiteColor, fontSize: AppFontSizes.fontNenoSmall))`
   - Example: `Text('Most Booked', style: TextStyle(fontSize: 16.sp, fontWeight: AppFontWeights.bold, color: Colors.black87))`
   - Example: `Text(label, style: TextStyle(fontSize: 10.sp, color: Colors.grey))`

1.2 WHEN defining colors in screens THEN the system uses direct Color constructors (Color(0xFFxxxxxx)), Colors.xxx constants, or Colors.xxx.shadeXXX instead of AppColors constants
   - Example: `color: Colors.black87` (should use AppColors.black87 or add AppColors.eliteBlack)
   - Example: `color: Colors.grey.shade300` (should use AppColors.grey300)
   - Example: `color: Colors.grey.shade200` (should use AppColors.grey200)
   - Example: `color: Colors.white` (should use AppColors.whiteColor)
   - Example: `color: Colors.grey` (should use AppColors.greyColor)
   - Example: `colors: [Color(0xFFFFB6C1), Color(0xFFFF9999)]` (should use AppColors.pinkGradientStart, AppColors.pinkGradientEnd)
   - Example: `color: const Color(0xFFFFF8F0)` (should use AppColors.creamBackground)

1.3 WHEN specifying font sizes in screens THEN the system uses hardcoded numeric values with .sp extension instead of AppFontSizes constants
   - Example: `fontSize: 28.sp` (should use AppFontSizes.fontXLarge26 or add fontXLarge28)
   - Example: `fontSize: 14.sp` (should use AppFontSizes.fontMedium)
   - Example: `fontSize: 12.sp` (should use AppFontSizes.fontSmall)
   - Example: `fontSize: 18.sp` (should use AppFontSizes.fontLarge or add fontXMedium18)
   - Example: `fontSize: 10.sp` (should use AppFontSizes.fontNenoSmall)

1.4 WHEN applying font weights in screens THEN the system uses hardcoded FontWeight values or AppFontWeights constants inconsistently
   - All font weights are using AppFontWeights correctly, but Text widgets should use CommonText instead

1.5 WHEN defining spacing, padding, or margins in screens THEN the system uses hardcoded numeric values instead of AppDimensions constants
   - Example: `padding: EdgeInsets.symmetric(horizontal: 12.w)` (should use AppDimensions.paddingSmall)
   - Example: `padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h)` (should use AppDimensions constants)
   - Example: `padding: EdgeInsets.all(16.w)` (should use AppDimensions.paddingMedium)
   - Example: `SizedBox(width: 4.w)` (should use AppDimensions.spacingSmall)
   - Example: `SizedBox(width: 8.w)` (should use AppDimensions.spacingMedium)
   - Example: `SizedBox(height: 12.h)` (should use AppDimensions.spacingLarge)
   - Example: `height: 44.h` (custom height, may need AppDimensions.buttonHeightMedium)

1.6 WHEN creating containers with background colors THEN the system uses hardcoded color values instead of AppColors constants
   - Example: `color: Colors.black87` in Container decoration (should use AppColors constant)
   - Example: `color: Colors.grey.shade200` in Container decoration (should use AppColors.grey200)
   - Example: `color: Colors.grey.shade300` in Border.all (should use AppColors.grey300)
   - Example: `const Color(0xFFFFF8F0)` in Container decoration (should use AppColors.creamBackground)

1.7 WHEN defining border radius values THEN the system uses hardcoded numeric values with .r extension instead of AppDimensions radius constants
   - Example: `borderRadius: BorderRadius.circular(20.r)` (should use AppDimensions.radiusXLarge)
   - Example: `borderRadius: BorderRadius.circular(8.r)` (should use AppDimensions.radiusSmall)
   - Example: `borderRadius: BorderRadius.circular(12.r)` (should use AppDimensions.radiusMedium)
   - Example: `borderRadius: BorderRadius.circular(4.r)` (should use AppDimensions radius constant or add radiusXSmall)
   - Example: `borderRadius: BorderRadius.circular(6.r)` (should use AppDimensions radius constant)

1.8 WHEN specifying icon sizes THEN the system uses hardcoded numeric values with .sp extension instead of AppDimensions icon size constants
   - Example: `size: 20.sp` (should use AppDimensions.iconMedium or add custom icon size)
   - Example: `size: 14.sp` (should use AppDimensions.iconSmall)
   - Example: `size: 30.sp` (should use AppDimensions.iconLarge)
   - Example: `size: 40.sp` (should add AppDimensions.iconXLarge)
   - Example: `size: 16.sp` (should use AppDimensions.iconSmall)

### Expected Behavior (Correct)

2.1 WHEN rendering text in screens THEN the system SHALL use CommonText widget with appropriate fontSize, fontWeight, and color parameters from utility constants

2.2 WHEN defining colors in screens THEN the system SHALL use AppColors constants exclusively (e.g., AppColors.whiteColor, AppColors.themeColor, AppColors.greyColor)

2.3 WHEN specifying font sizes in screens THEN the system SHALL use AppFontSizes constants (e.g., AppFontSizes.fontSmall, AppFontSizes.fontMedium, AppFontSizes.fontLarge)

2.4 WHEN applying font weights in screens THEN the system SHALL use AppFontWeights constants consistently (e.g., AppFontWeights.bold, AppFontWeights.semiBold)

2.5 WHEN defining spacing, padding, or margins in screens THEN the system SHALL use AppDimensions constants (e.g., AppDimensions.paddingMedium, AppDimensions.spacingLarge)

2.6 WHEN creating containers with background colors THEN the system SHALL use AppColors constants, adding new constants to AppColors if needed for reusable colors

2.7 WHEN defining border radius values THEN the system SHALL use AppDimensions radius constants (e.g., AppDimensions.radiusSmall, AppDimensions.radiusMedium)

2.8 WHEN specifying icon sizes THEN the system SHALL use AppDimensions icon size constants (e.g., AppDimensions.iconSmall, AppDimensions.iconMedium)

### Unchanged Behavior (Regression Prevention)

3.1 WHEN screens are rendered after refactoring THEN the system SHALL CONTINUE TO display the same visual appearance (colors, sizes, spacing) as before

3.2 WHEN user interactions occur (taps, scrolls, gestures) THEN the system SHALL CONTINUE TO respond with the same functionality as before

3.3 WHEN navigation between screens occurs THEN the system SHALL CONTINUE TO navigate correctly without breaking existing routes

3.4 WHEN state management updates occur THEN the system SHALL CONTINUE TO update UI components correctly without breaking reactive behavior

3.5 WHEN responsive layouts adjust to different screen sizes THEN the system SHALL CONTINUE TO adapt correctly using flutter_screenutil

3.6 WHEN CommonText or CommonButton widgets are used correctly (as in help_screen.dart) THEN the system SHALL CONTINUE TO render them without modification

3.7 WHEN AppColors constants are already used correctly in screens THEN the system SHALL CONTINUE TO use them without modification

3.8 WHEN custom widgets or components have legitimate reasons for unique styling THEN the system SHALL CONTINUE TO preserve those unique implementations where appropriate
