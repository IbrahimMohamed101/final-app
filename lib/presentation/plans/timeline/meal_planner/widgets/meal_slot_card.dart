import 'package:basic_diet/domain/model/meal_planner_menu_model.dart';
import 'package:basic_diet/presentation/plans/timeline/meal_planner/bloc/meal_planner_bloc.dart';
import 'package:basic_diet/presentation/plans/timeline/meal_planner/bloc/meal_planner_state.dart';
import 'package:basic_diet/presentation/plans/timeline/meal_planner/widgets/carb_picker_sheet.dart';
import 'package:basic_diet/presentation/plans/timeline/meal_planner/widgets/planner_field.dart';
import 'package:basic_diet/presentation/resources/color_manager.dart';
import 'package:basic_diet/presentation/resources/font_manager.dart';
import 'package:basic_diet/presentation/resources/strings_manager.dart';
import 'package:basic_diet/presentation/resources/styles_manager.dart';
import 'package:basic_diet/presentation/resources/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class MealSlotCard extends StatelessWidget {
  final int slotNumber;
  final String proteinLabel;
  final bool hasProteinSelection;
  final List<MealPlannerSlotCarbSelection> carbSelections;
  final bool hasCarbSelection;
  final bool isProteinPremium;
  final VoidCallback? onSelectProtein;
  final List<BuilderCarbModel> carbOptions;
  final void Function(int carbIndex, String carbId)? onCarbSelected;
  final void Function(int carbIndex, int grams)? onCarbGramsChanged;
  final void Function(int carbIndex)? onRemoveCarb;
  final VoidCallback? onClear;
  final VoidCallback? onRemove;
  final bool isRemovable;
  final bool showCarbField;
  final int maxCarbItems;
  final int maxCarbTotalGrams;

  const MealSlotCard({
    super.key,
    required this.slotNumber,
    required this.proteinLabel,
    required this.hasProteinSelection,
    required this.carbSelections,
    required this.hasCarbSelection,
    required this.isProteinPremium,
    required this.onSelectProtein,
    required this.carbOptions,
    required this.onCarbSelected,
    required this.onCarbGramsChanged,
    required this.onRemoveCarb,
    required this.onClear,
    this.onRemove,
    this.isRemovable = false,
    this.showCarbField = true,
    this.maxCarbItems = 2,
    this.maxCarbTotalGrams = 300,
  });

  @override
  Widget build(BuildContext context) {
    final isComplete =
        hasProteinSelection && (!showCarbField || hasCarbSelection);
    final borderColor =
        isComplete
            ? isProteinPremium
                ? ColorManager.brandAccentBorder
                : ColorManager.brandPrimary.withValues(alpha: 0.35)
            : ColorManager.borderDefault;

    final bgColor =
        isComplete
            ? isProteinPremium
                ? ColorManager.brandAccentSoft.withValues(alpha: 0.6)
                : ColorManager.brandPrimaryTint
            : ColorManager.backgroundSurface;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: EdgeInsets.all(AppPadding.p16.w),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(AppSize.s16.r),
            border: Border.all(color: borderColor),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _SlotHeader(
                slotNumber: slotNumber,
                isComplete: isComplete,
                isProteinPremium: isProteinPremium,
                onClear: onClear,
                onRemove: onRemove,
                isRemovable: isRemovable,
                hasProteinSelection: hasProteinSelection,
              ),
              Gap(AppSize.s16.h),
              PlannerField(
                title: Strings.selectProtein.tr(),
                value:
                    hasProteinSelection
                        ? proteinLabel
                        : Strings.selectMeal.tr(),
                isSelected: hasProteinSelection,
                isPremium: isProteinPremium && hasProteinSelection,
                onTap: onSelectProtein ?? () {},
                isDisabled: onSelectProtein == null,
              ),
              if (showCarbField) ...[
                Gap(AppSize.s12.h),
                _CarbSelectionSection(
                  slotIndex: slotNumber - 1,
                  carbSelections: carbSelections,
                  carbOptions: carbOptions,
                  onCarbSelected: onCarbSelected,
                  onCarbGramsChanged: onCarbGramsChanged,
                  onRemoveCarb: onRemoveCarb,
                  maxCarbItems: maxCarbItems,
                  maxCarbTotalGrams: maxCarbTotalGrams,
                ),
              ],
            ],
          ),
        ),
        if (isProteinPremium && hasProteinSelection)
          Positioned(top: -10.h, right: -6.w, child: _PremiumBadge()),
      ],
    );
  }
}

class _CarbSelectionSection extends StatefulWidget {
  final int slotIndex;
  final List<MealPlannerSlotCarbSelection> carbSelections;
  final List<BuilderCarbModel> carbOptions;
  final void Function(int carbIndex, String carbId)? onCarbSelected;
  final void Function(int carbIndex, int grams)? onCarbGramsChanged;
  final void Function(int carbIndex)? onRemoveCarb;
  final int maxCarbItems;
  final int maxCarbTotalGrams;

  const _CarbSelectionSection({
    required this.slotIndex,
    required this.carbSelections,
    required this.carbOptions,
    required this.onCarbSelected,
    required this.onCarbGramsChanged,
    required this.onRemoveCarb,
    required this.maxCarbItems,
    required this.maxCarbTotalGrams,
  });

  @override
  State<_CarbSelectionSection> createState() => _CarbSelectionSectionState();
}

class _CarbSelectionSectionState extends State<_CarbSelectionSection> {
  static const int _gramsStep = 50;

  late bool _showSecondSlot;

  @override
  void initState() {
    super.initState();
    _showSecondSlot = widget.carbSelections.length > 1;
  }

  @override
  void didUpdateWidget(covariant _CarbSelectionSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.carbSelections.length > 1) {
      _showSecondSlot = true;
      return;
    }
    if (!_canShowAddSecondCarb && widget.carbSelections.length < 2) {
      _showSecondSlot = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final totalGrams = widget.carbSelections.fold<int>(
      0,
      (sum, carb) => sum + carb.grams,
    );
    final remainingGrams = widget.maxCarbTotalGrams - totalGrams;
    final progressValue =
        widget.maxCarbTotalGrams == 0
            ? 0.0
            : (totalGrams / widget.maxCarbTotalGrams).clamp(0.0, 1.0);
    final showSecondSlot = _showSecondSlot || widget.carbSelections.length > 1;

    return Container(
      padding: EdgeInsets.all(AppPadding.p14.w),
      decoration: BoxDecoration(
        color: ColorManager.backgroundSurface.withValues(alpha: 0.78),
        borderRadius: BorderRadius.circular(AppSize.s16.r),
        border: Border.all(color: ColorManager.borderDefault),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  Strings.carbSelection.tr(),
                  style: getBoldTextStyle(
                    color: ColorManager.textPrimary,
                    fontSize: FontSizeManager.s14.sp,
                  ),
                ),
              ),
              _RemainingBadge(remainingGrams: remainingGrams),
            ],
          ),
          Gap(AppSize.s12.h),
          _CarbProgressBar(
            totalGrams: totalGrams,
            maxCarbTotalGrams: widget.maxCarbTotalGrams,
            progressValue: progressValue,
          ),
          Gap(AppSize.s16.h),
          _CarbSlotCard(
            title: '${Strings.carb.tr()} 1',
            carbName: _selectedCarbName(0),
            grams: _selectedGrams(0),
            gramOptions: _gramOptionsFor(0),
            canEditType: _canSelectType,
            canEditGrams: _canAdjustGrams,
            onSelectType: () => _openCarbPickerSheet(context, 0),
            onGramsSelected:
                (grams) => widget.onCarbGramsChanged?.call(0, grams),
          ),
          if (showSecondSlot) ...[
            Gap(AppSize.s12.h),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 220),
              child: _CarbSlotCard(
                key: const ValueKey('carb-slot-2'),
                title: '${Strings.carb.tr()} 2',
                carbName: _selectedCarbName(1),
                grams: _selectedGrams(1),
                gramOptions: _gramOptionsFor(1),
                canEditType: _canSelectType,
                canEditGrams: _canAdjustGrams,
                onSelectType: () => _openCarbPickerSheet(context, 1),
                onRemove:
                    widget.onRemoveCarb == null
                        ? null
                        : () {
                          widget.onRemoveCarb?.call(1);
                          setState(() => _showSecondSlot = false);
                        },
                onGramsSelected:
                    (grams) => widget.onCarbGramsChanged?.call(1, grams),
              ),
            ),
          ] else if (_canShowAddSecondCarb && _canSelectType) ...[
            OutlinedButton.icon(
              onPressed: () => setState(() => _showSecondSlot = true),
              icon: Icon(
                Icons.add_circle_outline,
                size: 18.w,
                color: ColorManager.brandPrimary,
              ),
              label: Text(
                Strings.addSecondCarb.tr(),
                style: getBoldTextStyle(
                  color: ColorManager.brandPrimary,
                  fontSize: FontSizeManager.s14.sp,
                ),
              ),
              style: OutlinedButton.styleFrom(
                minimumSize: Size(double.infinity, 44.h),
                side: BorderSide(
                  color: ColorManager.brandPrimary.withValues(alpha: 0.28),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s14.r),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  bool get _canSelectType =>
      widget.onCarbSelected != null ||
      widget.onCarbGramsChanged != null ||
      widget.onRemoveCarb != null;

  bool get _canAdjustGrams => widget.onCarbGramsChanged != null;

  bool get _canShowAddSecondCarb {
    if (widget.maxCarbItems < 2 || widget.carbSelections.isEmpty) {
      return false;
    }
    if (widget.carbSelections.length > 1) {
      return false;
    }
    return _availableGramsFor(1) >= _gramsStep;
  }

  String _selectedCarbName(int carbIndex) {
    final carbId = _selectedCarbId(carbIndex);
    if (carbId == null) {
      return Strings.chooseCarbType.tr();
    }
    for (final carb in widget.carbOptions) {
      if (carb.id == carbId) {
        return carb.name;
      }
    }
    return Strings.chooseCarbType.tr();
  }

  String? _selectedCarbId(int carbIndex) {
    if (carbIndex < 0 || carbIndex >= widget.carbSelections.length) {
      return null;
    }
    final carbId = widget.carbSelections[carbIndex].carbId;
    return carbId.isEmpty ? null : carbId;
  }

  int? _selectedGrams(int carbIndex) {
    if (carbIndex < 0 || carbIndex >= widget.carbSelections.length) {
      return null;
    }
    return widget.carbSelections[carbIndex].grams;
  }

  List<int> _gramOptionsFor(int carbIndex) {
    final maxAllowed = _availableGramsFor(carbIndex);
    final options = <int>[];
    for (var value = _gramsStep; value <= maxAllowed; value += _gramsStep) {
      options.add(value);
    }
    final selectedGrams = _selectedGrams(carbIndex);
    if (selectedGrams != null &&
        selectedGrams > 0 &&
        selectedGrams <= maxAllowed &&
        !options.contains(selectedGrams)) {
      options.add(selectedGrams);
      options.sort();
    }
    return options;
  }

  int _availableGramsFor(int carbIndex) {
    var usedGrams = 0;
    for (var index = 0; index < widget.carbSelections.length; index++) {
      if (index == carbIndex) {
        continue;
      }
      usedGrams += widget.carbSelections[index].grams;
    }
    final remaining = widget.maxCarbTotalGrams - usedGrams;
    return remaining < 0 ? 0 : remaining;
  }

  Future<void> _openCarbPickerSheet(BuildContext context, int carbIndex) {
    if (!_canSelectType) {
      return Future<void>.value();
    }

    final bloc = context.read<MealPlannerBloc>();
    final disabledIds =
        widget.carbSelections
            .asMap()
            .entries
            .where((entry) => entry.key != carbIndex)
            .map((entry) => entry.value.carbId)
            .where((id) => id.isNotEmpty)
            .toSet();

    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: ColorManager.transparent,
      builder:
          (_) => BlocProvider.value(
            value: bloc,
            child: CarbPickerSheet(
              options: widget.carbOptions,
              selectedId: _selectedCarbId(carbIndex),
              disabledIds: disabledIds,
              slotIndex: widget.slotIndex,
              carbIndex: carbIndex,
              title: '${Strings.selectCarb.tr()} ${carbIndex + 1}',
              initialGrams: _defaultGramsFor(carbIndex),
            ),
          ),
    );
  }

  int _defaultGramsFor(int carbIndex) {
    final currentGrams = _selectedGrams(carbIndex);
    if (currentGrams != null && currentGrams > 0) {
      return currentGrams;
    }
    final maxAllowed = _availableGramsFor(carbIndex);
    if (maxAllowed < _gramsStep) {
      return _gramsStep;
    }
    if (maxAllowed >= 150) {
      return 150;
    }
    return (maxAllowed ~/ _gramsStep) * _gramsStep;
  }
}

class _CarbSlotCard extends StatelessWidget {
  final String title;
  final String carbName;
  final int? grams;
  final List<int> gramOptions;
  final bool canEditType;
  final bool canEditGrams;
  final VoidCallback onSelectType;
  final VoidCallback? onRemove;
  final ValueChanged<int>? onGramsSelected;

  const _CarbSlotCard({
    super.key,
    required this.title,
    required this.carbName,
    required this.grams,
    required this.gramOptions,
    required this.canEditType,
    required this.canEditGrams,
    required this.onSelectType,
    this.onRemove,
    this.onGramsSelected,
  });

  @override
  Widget build(BuildContext context) {
    final hasSelection = grams != null;

    return Container(
      padding: EdgeInsets.all(AppPadding.p12.w),
      decoration: BoxDecoration(
        color: ColorManager.backgroundSubtle.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(AppSize.s14.r),
        border: Border.all(color: ColorManager.borderSubtle),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: getBoldTextStyle(
                    color: ColorManager.textPrimary,
                    fontSize: FontSizeManager.s14.sp,
                  ),
                ),
              ),
              if (onRemove != null)
                TextButton(
                  onPressed: canEditType ? onRemove : null,
                  child: Text(
                    Strings.removeSecondCarb.tr(),
                    style: getBoldTextStyle(
                      color: ColorManager.stateWarningEmphasis,
                      fontSize: FontSizeManager.s12.sp,
                    ),
                  ),
                ),
            ],
          ),
          Gap(AppSize.s8.h),
          InkWell(
            onTap: canEditType ? onSelectType : null,
            borderRadius: BorderRadius.circular(AppSize.s14.r),
            child: Ink(
              padding: EdgeInsets.symmetric(
                horizontal: AppPadding.p12.w,
                vertical: AppPadding.p12.h,
              ),
              decoration: BoxDecoration(
                color: ColorManager.backgroundSurface,
                borderRadius: BorderRadius.circular(AppSize.s14.r),
                border: Border.all(
                  color:
                      hasSelection
                          ? ColorManager.brandPrimary.withValues(alpha: 0.3)
                          : ColorManager.borderDefault,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      carbName,
                      style: getBoldTextStyle(
                        color:
                            hasSelection
                                ? ColorManager.textPrimary
                                : ColorManager.textSecondary,
                        fontSize: FontSizeManager.s14.sp,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 20.w,
                    color: ColorManager.iconSecondary,
                  ),
                ],
              ),
            ),
          ),
          if (hasSelection && gramOptions.isNotEmpty) ...[
            Gap(AppSize.s12.h),
            Wrap(
              spacing: AppSize.s8.w,
              runSpacing: AppSize.s8.h,
              children:
                  gramOptions
                      .map(
                        (option) => ChoiceChip(
                          label: Text('${option}g'),
                          selected: grams == option,
                          onSelected:
                              canEditGrams && onGramsSelected != null
                                  ? (_) => onGramsSelected!(option)
                                  : null,
                          labelStyle: getBoldTextStyle(
                            color:
                                grams == option
                                    ? ColorManager.textInverse
                                    : ColorManager.textPrimary,
                            fontSize: FontSizeManager.s12.sp,
                          ),
                          selectedColor: ColorManager.brandPrimary,
                          backgroundColor: ColorManager.backgroundSurface,
                          side: BorderSide(
                            color:
                                grams == option
                                    ? ColorManager.brandPrimary
                                    : ColorManager.borderDefault,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(999.r),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: AppPadding.p10.w,
                            vertical: AppPadding.p6.h,
                          ),
                        ),
                      )
                      .toList(),
            ),
          ],
        ],
      ),
    );
  }
}

class _CarbProgressBar extends StatelessWidget {
  final int totalGrams;
  final int maxCarbTotalGrams;
  final double progressValue;

  const _CarbProgressBar({
    required this.totalGrams,
    required this.maxCarbTotalGrams,
    required this.progressValue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '${totalGrams}g',
              style: getBoldTextStyle(
                color: ColorManager.textPrimary,
                fontSize: FontSizeManager.s14.sp,
              ),
            ),
            const Spacer(),
            Text(
              '${maxCarbTotalGrams}g',
              style: getRegularTextStyle(
                color: ColorManager.textSecondary,
                fontSize: FontSizeManager.s12.sp,
              ),
            ),
          ],
        ),
        Gap(AppSize.s8.h),
        ClipRRect(
          borderRadius: BorderRadius.circular(999.r),
          child: LinearProgressIndicator(
            minHeight: 8.h,
            value: progressValue,
            color: ColorManager.brandPrimary,
            backgroundColor: ColorManager.backgroundSubtle,
          ),
        ),
      ],
    );
  }
}

class _RemainingBadge extends StatelessWidget {
  final int remainingGrams;

  const _RemainingBadge({required this.remainingGrams});

  @override
  Widget build(BuildContext context) {
    final isFull = remainingGrams == 0;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppPadding.p10.w,
        vertical: AppPadding.p6.h,
      ),
      decoration: BoxDecoration(
        color:
            isFull ? ColorManager.stateWarningSurface : ColorManager.stateInfo,
        borderRadius: BorderRadius.circular(999.r),
      ),
      child: Text(
        '${Strings.remainingGrams.tr()}: ${remainingGrams < 0 ? 0 : remainingGrams}g',
        style: getBoldTextStyle(
          color:
              isFull
                  ? ColorManager.stateWarningEmphasis
                  : ColorManager.stateInfoEmphasis,
          fontSize: FontSizeManager.s12.sp,
        ),
      ),
    );
  }
}

class _SlotHeader extends StatelessWidget {
  final int slotNumber;
  final bool isComplete;
  final bool isProteinPremium;
  final VoidCallback? onClear;
  final VoidCallback? onRemove;
  final bool isRemovable;
  final bool hasProteinSelection;

  const _SlotHeader({
    required this.slotNumber,
    required this.isComplete,
    required this.isProteinPremium,
    required this.onClear,
    this.onRemove,
    this.isRemovable = false,
    required this.hasProteinSelection,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40.w,
          width: 40.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color:
                isComplete
                    ? isProteinPremium
                        ? ColorManager.brandAccent
                        : ColorManager.brandPrimary
                    : ColorManager.backgroundSubtle,
            borderRadius: BorderRadius.circular(AppSize.s14.r),
          ),
          child: Text(
            '$slotNumber',
            style: getBoldTextStyle(
              color:
                  isComplete
                      ? ColorManager.textInverse
                      : ColorManager.stateDisabled,
              fontSize: FontSizeManager.s18.sp,
            ),
          ),
        ),
        Gap(AppSize.s12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${Strings.meal.tr()} $slotNumber',
                style: getBoldTextStyle(
                  color: ColorManager.textPrimary,
                  fontSize: FontSizeManager.s16.sp,
                ),
              ),
              Gap(2.h),
              Text(
                isComplete ? Strings.complete.tr() : Strings.buildYourMeal.tr(),
                style: getRegularTextStyle(
                  color: ColorManager.textSecondary,
                  fontSize: FontSizeManager.s12.sp,
                ),
              ),
            ],
          ),
        ),
        if (onClear != null && hasProteinSelection)
          IconButton(
            onPressed: onClear,
            icon: Icon(
              Icons.restart_alt,
              size: 18.w,
              color: ColorManager.iconSecondary,
            ),
            tooltip: Strings.reset.tr(),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        if (isRemovable && onRemove != null) ...[
          Gap(AppSize.s8.w),
          IconButton(
            onPressed: onRemove,
            icon: Icon(
              Icons.delete_outline,
              size: 18.w,
              color: ColorManager.stateError,
            ),
            tooltip: Strings.remove.tr(),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ],
    );
  }
}

class _PremiumBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: ColorManager.brandAccent,
        borderRadius: BorderRadius.circular(99.r),
        boxShadow: [
          BoxShadow(
            color: ColorManager.textPrimary.withValues(alpha: 0.12),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.star, color: ColorManager.textInverse, size: 14.w),
          Gap(4.w),
          Text(
            Strings.premiumMealsText.tr(),
            style: getBoldTextStyle(
              color: ColorManager.textInverse,
              fontSize: FontSizeManager.s12.sp,
            ),
          ),
        ],
      ),
    );
  }
}
