import 'package:basic_diet/presentation/plans/timeline/meal_planner/bloc/meal_planner_bloc.dart';
import 'package:basic_diet/presentation/plans/timeline/meal_planner/bloc/meal_planner_event.dart';
import 'package:basic_diet/presentation/plans/timeline/meal_planner/bloc/meal_planner_state.dart';
import 'package:basic_diet/presentation/resources/color_manager.dart';
import 'package:basic_diet/presentation/resources/font_manager.dart';
import 'package:basic_diet/presentation/resources/strings_manager.dart';
import 'package:basic_diet/presentation/resources/styles_manager.dart';
import 'package:basic_diet/presentation/resources/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MealPlannerBottomAction extends StatelessWidget {
  final MealPlannerLoaded state;

  const MealPlannerBottomAction({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final pendingAmountHalala = state.totalPendingPaymentAmountHalala;
    final hasPendingPayment = pendingAmountHalala > 0;
    final canSave =
        state.isDirty &&
        _hasCompletedSelectedDay() &&
        state.isSelectedDayEditable;

    final String label;
    final Color bgColor;
    final bool active;

    if (!state.isSelectedDayEditable) {
      label = Strings.dayLocked.tr();
      bgColor = ColorManager.stateDisabledSurface;
      active = false;
    } else if (hasPendingPayment) {
      final amount = pendingAmountHalala / 100.0;
      final hasBackendPaymentRequirement =
          state.selectedDayDetail?.paymentRequirement?.requiresPayment == true;
      label =
          '${hasBackendPaymentRequirement ? Strings.payNow.tr() : Strings.estimatedPayNow.tr()} ${_moneyLabel(amount)}';
      bgColor = ColorManager.brandAccent;
      active = true;
    } else if (canSave) {
      label = Strings.saveChanges.tr();
      bgColor = ColorManager.brandPrimary;
      active = true;
    } else {
      label = Strings.noChangesToSave.tr();
      bgColor = ColorManager.stateDisabledSurface;
      active = false;
    }

    return Container(
      padding: EdgeInsets.all(AppPadding.p16.w),
      decoration: BoxDecoration(
        color: ColorManager.backgroundSurface,
        boxShadow: [
          BoxShadow(
            color: ColorManager.textPrimary.withValues(alpha: 0.05),
            blurRadius: 12,
            offset: const Offset(0, -6),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: _ActionButton(
          label: label,
          backgroundColor: bgColor,
          foregroundColor:
              active ? ColorManager.textInverse : ColorManager.stateDisabled,
          isLoading: state.isSaving,
          onPressed:
              active
                  ? () => context.read<MealPlannerBloc>().add(
                    const SaveMealPlannerChangesEvent(),
                  )
                  : null,
        ),
      ),
    );
  }

  bool _hasCompletedSelectedDay() {
    final required = state.selectedTimelineDay.requiredMeals;
    final slots = state.selectedSlotsPerDay[state.selectedDayIndex] ?? [];
    final completeCount =
        slots.where((slot) {
          if (slot.selectionType == 'sandwich') {
            return slot.sandwichId != null && slot.sandwichId!.isNotEmpty;
          }
          if (slot.selectionType == 'premium_large_salad') {
            return slot.salad != null &&
                slot.salad!.groups.protein.length == 1 &&
                slot.salad!.groups.sauce.length == 1 &&
                slot.carbs.isEmpty;
          }
          return slot.proteinId != null && slot.carbs.isNotEmpty;
        }).length;
    return completeCount >= required;
  }

  String _moneyLabel(double amount) {
    return "${amount.toStringAsFixed(2)} ${Strings.sar.tr()}";
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color foregroundColor;
  final bool isLoading;
  final VoidCallback? onPressed;

  const _ActionButton({
    required this.label,
    required this.backgroundColor,
    this.foregroundColor = ColorManager.textInverse,
    this.isLoading = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s16.r),
          ),
        ),
        child:
            isLoading
                ? const CircularProgressIndicator(
                  color: ColorManager.textInverse,
                )
                : Text(
                  label,
                  textAlign: TextAlign.center,
                  style: getBoldTextStyle(
                    color: foregroundColor,
                    fontSize: FontSizeManager.s15.sp,
                  ),
                ),
      ),
    );
  }
}
