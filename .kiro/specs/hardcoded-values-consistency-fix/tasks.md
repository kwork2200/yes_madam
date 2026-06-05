# Implementation Plan

- [ ] 1. Write bug condition exploration test
  - **Property 1: Bug Condition** - Hardcoded Values Detection Test
  - **IMPORTANT**: Write this property-based test BEFORE implementing the fix
  - **GOAL**: Surface counterexamples that demonstrate hardcoded values exist in screens
  - **Scoped PBT Approach**: Scope the property to concrete screens with known hardcoded values: home_screen.dart, account_screen.dart, bookings_screen.dart, wallet_screen.dart
  - Test that screens contain Text widgets with inline TextStyle instead of CommonText (from Bug Condition in design: isBugCondition checks for "widget is Text AND widget.style contains inline TextStyle")
  - Test that screens contain Colors.xxx or Color(0xFFxxxxxx) instead of AppColors constants
  - Test that screens contain numeric.sp, numeric.w, numeric.h, numeric.r without corresponding utility constant references
  - Run test on UNFIXED code - expect FAILURE (this confirms the bug exists)
  - Document counterexamples found (e.g., "home_screen.dart line 45: Text('Earn', style: TextStyle(...)) instead of CommonText")
  - **CRITICAL**: This test MUST FAIL on unfixed code - failure confirms the bug exists
  - **DO NOT attempt to fix the test or the code when it fails**
  - **NOTE**: This test encodes the expected behavior - it will validate the fix when it passes after implementation
  - Mark task complete when test is written, run, and failures are documented
  - _Requirements: 1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7, 1.8_

- [ ] 2. Write preservation property tests (BEFORE implementing fix)
  - **Property 2: Preservation** - Visual and Functional Behavior Preservation
  - **IMPORTANT**: Follow observation-first methodology
  - Observe: Take screenshots of all screens on UNFIXED code (home, help, account, bookings, wallet) - establish visual baseline
  - Observe: Test all interactive elements (button taps, scrolls, navigation) on UNFIXED code - document current behavior
  - Observe: Verify help_screen.dart already uses CommonText correctly - should remain unchanged
  - Write property-based test: for all screens, visual appearance (colors, sizes, spacing) must match baseline screenshots (from Preservation Requirements in design)
  - Write property-based test: for all user interactions, functionality must match baseline behavior
  - Write property-based test: for all correctly implemented screens (like help_screen.dart), source code must remain unchanged
  - Verify tests pass on UNFIXED code
  - **EXPECTED OUTCOME**: Tests PASS (this confirms baseline behavior to preserve)
  - Mark task complete when tests are written, run, and passing on unfixed code
  - _Requirements: 3.1, 3.2, 3.3, 3.4, 3.5, 3.6, 3.7, 3.8_

- [ ] 3. Fix for hardcoded values consistency

  - [ ] 3.1 Add missing constants to utility files (if needed)
    - Review all hardcoded values from bug condition test counterexamples
    - Add missing AppColors constants: `black87`, `grey200`, `grey300`, `creamBackground`, `pinkGradientStart`, `pinkGradientEnd` (if not already present)
    - Add missing AppDimensions constants: `radiusXSmall = 4.0`, `iconXLarge = 40.0`, `buttonHeightMedium = 44.0` (if needed)
    - Ensure all new constants match exact numeric values being replaced
    - Verify no existing constants are modified (preservation requirement)
    - _Bug_Condition: isBugCondition(widget) where widget contains hardcoded values without corresponding utility constants_
    - _Expected_Behavior: All hardcoded values have corresponding utility constants available_
    - _Preservation: Existing utility constants remain unchanged (only additions)_
    - _Requirements: 2.2, 2.5, 2.7, 2.8_

  - [ ] 3.2 Replace Text widgets with CommonText in home_screen.dart
    - Find all `Text(...)` widgets with inline `TextStyle` definitions
    - Replace with `CommonText(text: ..., fontSize: ..., fontWeight: ..., color: ...)`
    - Map hardcoded font sizes to AppFontSizes constants
    - Map hardcoded colors to AppColors constants
    - Map hardcoded font weights to AppFontWeights constants
    - Preserve all text properties: maxLines, overflow, textAlign
    - Example: `Text('Earn', style: TextStyle(color: AppColors.whiteColor, fontSize: AppFontSizes.fontNenoSmall))` → `CommonText(text: 'Earn', fontSize: AppFontSizes.fontNenoSmall, color: AppColors.whiteColor)`
    - _Bug_Condition: isBugCondition(widget) where widget is Text AND widget.style contains inline TextStyle_
    - _Expected_Behavior: All Text widgets use CommonText with utility constants_
    - _Preservation: Visual appearance (exact same colors, sizes) must remain identical_
    - _Requirements: 2.1, 2.3, 2.4_

  - [ ] 3.3 Replace hardcoded colors with AppColors constants in home_screen.dart
    - Find all `Colors.black87`, `Colors.grey.shade300`, `Colors.white`, `Colors.grey`, `Color(0xFFxxxxxx)`
    - Replace with AppColors constants: `AppColors.black87`, `AppColors.grey300`, `AppColors.whiteColor`, etc.
    - Verify each color constant matches the exact original color value
    - Example: `color: Colors.black87` → `color: AppColors.black87` (or `AppColors.eliteBlack`)
    - Example: `color: Color(0xFFFFF8F0)` → `color: AppColors.creamBackground`
    - _Bug_Condition: isBugCondition(widget) where widget contains Colors.xxx or Color(0xFFxxxxxx)_
    - _Expected_Behavior: All colors use AppColors constants exclusively_
    - _Preservation: Exact same color values preserved_
    - _Requirements: 2.2, 2.6_

  - [ ] 3.4 Replace hardcoded spacing with AppDimensions in home_screen.dart
    - Find all hardcoded padding, margin, SizedBox values: `12.w`, `4.w`, `8.w`, `12.h`, `16.w`
    - Replace with AppDimensions constants: `AppDimensions.paddingSmall.w`, `AppDimensions.spacingSmall.w`, `AppDimensions.spacingMedium.w`, `AppDimensions.spacingLarge.h`, `AppDimensions.paddingMedium.w`
    - Example: `padding: EdgeInsets.symmetric(horizontal: 12.w)` → `padding: EdgeInsets.symmetric(horizontal: AppDimensions.paddingSmall.w)`
    - Example: `SizedBox(width: 4.w)` → `SizedBox(width: AppDimensions.spacingSmall.w)`
    - _Bug_Condition: isBugCondition(widget) where widget contains numeric.w or numeric.h without AppDimensions reference_
    - _Expected_Behavior: All spacing uses AppDimensions constants_
    - _Preservation: Exact same spacing values preserved_
    - _Requirements: 2.5_

  - [ ] 3.5 Replace hardcoded border radius with AppDimensions in home_screen.dart
    - Find all `borderRadius: BorderRadius.circular(20.r)`, `8.r`, `12.r`, `4.r`, `6.r`
    - Replace with AppDimensions radius constants: `AppDimensions.radiusXLarge.r`, `AppDimensions.radiusSmall.r`, `AppDimensions.radiusMedium.r`, `AppDimensions.radiusXSmall.r`
    - Example: `borderRadius: BorderRadius.circular(20.r)` → `borderRadius: BorderRadius.circular(AppDimensions.radiusXLarge.r)`
    - _Bug_Condition: isBugCondition(widget) where widget contains numeric.r without AppDimensions radius reference_
    - _Expected_Behavior: All border radius uses AppDimensions constants_
    - _Preservation: Exact same radius values preserved_
    - _Requirements: 2.7_

  - [ ] 3.6 Replace hardcoded icon sizes with AppDimensions in home_screen.dart
    - Find all icon sizes: `20.sp`, `14.sp`, `30.sp`, `40.sp`, `16.sp`
    - Replace with AppDimensions icon constants: `AppDimensions.iconMedium.sp`, `AppDimensions.iconSmall.sp`, `AppDimensions.iconLarge.sp`, `AppDimensions.iconXLarge.sp`
    - Example: `size: 20.sp` → `size: AppDimensions.iconMedium.sp`
    - _Bug_Condition: isBugCondition(widget) where widget contains icon size as numeric.sp without AppDimensions reference_
    - _Expected_Behavior: All icon sizes use AppDimensions constants_
    - _Preservation: Exact same icon sizes preserved_
    - _Requirements: 2.8_

  - [ ] 3.7 Apply same refactoring to other affected screens
    - Refactor account_screen.dart using same pattern (Text → CommonText, Colors.xxx → AppColors, numeric values → utility constants)
    - Refactor bookings_screen.dart using same pattern
    - Refactor wallet_screen.dart using same pattern
    - Refactor notifications_screen.dart using same pattern
    - Refactor location_screen.dart using same pattern
    - Skip help_screen.dart (already uses CommonText correctly - preservation requirement)
    - Preserve any custom widgets with legitimate unique styling
    - _Bug_Condition: isBugCondition(screen.widgets) for each screen_
    - _Expected_Behavior: All screens use common components and utility constants_
    - _Preservation: Screens already using correct patterns remain unchanged_
    - _Requirements: 2.1, 2.2, 2.3, 2.4, 2.5, 2.6, 2.7, 2.8, 3.6, 3.7, 3.8_

  - [ ] 3.8 Verify bug condition exploration test now passes
    - **Property 1: Expected Behavior** - Hardcoded Values Eliminated
    - **IMPORTANT**: Re-run the SAME test from task 1 - do NOT write a new test
    - The test from task 1 encodes the expected behavior (all screens use CommonText, AppColors, utility constants)
    - When this test passes, it confirms the expected behavior is satisfied
    - Run bug condition exploration test from step 1
    - **EXPECTED OUTCOME**: Test PASSES (confirms hardcoded values are eliminated)
    - Review counterexamples: all previously documented hardcoded values should now use utility constants
    - _Requirements: 2.1, 2.2, 2.3, 2.4, 2.5, 2.6, 2.7, 2.8_

  - [ ] 3.9 Verify preservation tests still pass
    - **Property 2: Preservation** - Visual and Functional Behavior Unchanged
    - **IMPORTANT**: Re-run the SAME tests from task 2 - do NOT write new tests
    - Run preservation property tests from step 2
    - Compare post-fix screenshots with baseline screenshots - must be pixel-perfect identical
    - Test all interactive elements - must function identically
    - Verify help_screen.dart source code is unchanged (already correct)
    - Verify responsive layouts work correctly at different breakpoints
    - **EXPECTED OUTCOME**: Tests PASS (confirms no regressions)
    - Confirm all tests still pass after fix (no visual or functional changes)
    - _Requirements: 3.1, 3.2, 3.3, 3.4, 3.5, 3.6, 3.7, 3.8_

- [ ] 4. Checkpoint - Ensure all tests pass
  - Run all property-based tests (bug condition + preservation)
  - Run visual regression tests (screenshot comparison)
  - Run integration tests (full app navigation flow)
  - Verify no compilation errors or runtime errors
  - Verify all screens render correctly
  - Ask the user if questions arise
