import 'package:basic_diet/domain/model/meal_planner_menu_model.dart';
import 'package:basic_diet/presentation/plans/timeline/meal_planner/bloc/meal_planner_bloc.dart';
import 'package:basic_diet/presentation/plans/timeline/meal_planner/bloc/meal_planner_event.dart';
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

class CarbPickerSheet extends StatelessWidget {
  final List<BuilderCarbModel> options;
  final String? selectedId;
  final Set<String> disabledIds;
  final int slotIndex;
  final int carbIndex;
  final String title;
  final int initialGrams;

  const CarbPickerSheet({
    super.key,
    required this.options,
    required this.selectedId,
    this.disabledIds = const <String>{},
    required this.slotIndex,
    required this.carbIndex,
    this.title = '',
    this.initialGrams = 150,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.4,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: ColorManager.backgroundSurface,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(AppSize.s24.r),
            ),
          ),
          child: Column(
            children: [
              Gap(AppSize.s10.h),
              _SheetHandle(),
              Gap(AppSize.s12.h),
              _SheetHeader(
                title: title.isEmpty ? Strings.chooseCarbType.tr() : title,
              ),
              Gap(AppSize.s8.h),
              Expanded(
                child: ListView.separated(
                  controller: scrollController,
                  padding: EdgeInsets.only(
                    left: AppPadding.p16.w,
                    right: AppPadding.p16.w,
                    bottom: 24.h,
                  ),
                  itemCount: options.length,
                  separatorBuilder: (_, __) => Gap(AppSize.s10.h),
                  itemBuilder: (context, index) {
                    final carb = options[index];
                    final isSelected = selectedId == carb.id;
                    final isDisabled =
                        disabledIds.contains(carb.id) && !isSelected;
                    return _CarbItem(
                      carb: carb,
                      isSelected: isSelected,
                      isDisabled: isDisabled,
                      slotIndex: slotIndex,
                      carbIndex: carbIndex,
                      initialGrams: initialGrams,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _CarbItem extends StatelessWidget {
  final BuilderCarbModel carb;
  final bool isSelected;
  final bool isDisabled;
  final int slotIndex;
  final int carbIndex;
  final int initialGrams;

  const _CarbItem({
    required this.carb,
    required this.isSelected,
    required this.isDisabled,
    required this.slotIndex,
    required this.carbIndex,
    required this.initialGrams,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          isDisabled
              ? null
              : () {
                context.read<MealPlannerBloc>().add(
                  SetMealSlotCarbEvent(
                    slotIndex: slotIndex,
                    carbId: carb.id,
                    grams: initialGrams,
                    carbIndex: carbIndex,
                  ),
                );
                Navigator.pop(context);
              },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.all(AppPadding.p12.w),
        decoration: BoxDecoration(
          color:
              isDisabled
                  ? ColorManager.backgroundSubtle
                  : isSelected
                  ? ColorManager.brandPrimaryTint
                  : ColorManager.backgroundSurface,
          borderRadius: BorderRadius.circular(AppSize.s16.r),
          border: Border.all(
            color:
                isDisabled
                    ? ColorManager.borderSubtle
                    : isSelected
                    ? ColorManager.brandPrimary
                    : ColorManager.borderDefault,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                carb.name,
                style: getBoldTextStyle(
                  color:
                      isDisabled
                          ? ColorManager.textMuted
                          : ColorManager.textPrimary,
                  fontSize: FontSizeManager.s14.sp,
                ),
              ),
            ),
            Gap(AppSize.s8.w),
            Icon(
              isSelected ? Icons.check_circle : Icons.radio_button_unchecked,
              color:
                  isDisabled
                      ? ColorManager.stateDisabled
                      : isSelected
                      ? ColorManager.brandPrimary
                      : ColorManager.stateDisabled,
              size: 22.w,
            ),
          ],
        ),
      ),
    );
  }
}

class _SheetHandle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48.w,
      height: 5.h,
      decoration: BoxDecoration(
        color: ColorManager.backgroundSubtle,
        borderRadius: BorderRadius.circular(99.r),
      ),
    );
  }
}

class _SheetHeader extends StatelessWidget {
  final String title;

  const _SheetHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p16.w),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: getBoldTextStyle(
                color: ColorManager.textPrimary,
                fontSize: FontSizeManager.s18.sp,
              ),
            ),
          ),
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.close,
              color: ColorManager.iconSecondary,
              size: 20.w,
            ),
          ),
        ],
      ),
    );
  }
}
