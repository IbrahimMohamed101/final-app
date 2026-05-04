import 'package:basic_diet/domain/model/add_ons_model.dart';
import 'package:equatable/equatable.dart';

sealed class MealPlannerEvent extends Equatable {
  const MealPlannerEvent();

  @override
  List<Object?> get props => [];
}

final class GetMealPlannerDataEvent extends MealPlannerEvent {
  const GetMealPlannerDataEvent();
}

final class ChangeDateEvent extends MealPlannerEvent {
  final int index;
  const ChangeDateEvent(this.index);

  @override
  List<Object?> get props => [index];
}

final class RetrySelectedDayLoadEvent extends MealPlannerEvent {
  const RetrySelectedDayLoadEvent();
}

final class SetMealSlotProteinEvent extends MealPlannerEvent {
  final int slotIndex;
  final String? proteinId;

  const SetMealSlotProteinEvent({
    required this.slotIndex,
    required this.proteinId,
  });

  @override
  List<Object?> get props => [slotIndex, proteinId];
}

final class SetMealSlotCarbEvent extends MealPlannerEvent {
  final int slotIndex;
  final String? carbId;
  final int grams;
  final int carbIndex;

  const SetMealSlotCarbEvent({
    required this.slotIndex,
    required this.carbId,
    this.grams = 150,
    this.carbIndex = 0,
  });

  @override
  List<Object?> get props => [slotIndex, carbId, grams, carbIndex];
}

final class SetPremiumLargeSaladEvent extends MealPlannerEvent {
  final int slotIndex;
  final String proteinId;
  final String presetKey;
  final List<String> leafyGreens;
  final List<String> vegetables;
  final List<String> cheeseNuts;
  final List<String> fruits;
  final List<String> sauce;

  const SetPremiumLargeSaladEvent({
    required this.slotIndex,
    required this.proteinId,
    required this.presetKey,
    this.leafyGreens = const [],
    this.vegetables = const [],
    this.cheeseNuts = const [],
    this.fruits = const [],
    this.sauce = const [],
  });

  @override
  List<Object?> get props => [
    slotIndex,
    proteinId,
    presetKey,
    leafyGreens,
    vegetables,
    cheeseNuts,
    fruits,
    sauce,
  ];
}

final class ToggleAddOnSelectionEvent extends MealPlannerEvent {
  final AddOnModel addOn;

  const ToggleAddOnSelectionEvent(this.addOn);

  @override
  List<Object?> get props => [addOn];
}

/// Replaces the selected addons for a category. Pass an empty list to clear it.
final class SelectAddonForCategoryEvent extends MealPlannerEvent {
  final String category;
  final List<String> addonIds;

  const SelectAddonForCategoryEvent({
    required this.category,
    required this.addonIds,
  });

  @override
  List<Object?> get props => [category, addonIds];
}

final class DismissPendingAddonPromptEvent extends MealPlannerEvent {
  const DismissPendingAddonPromptEvent();
}

final class SaveMealPlannerChangesEvent extends MealPlannerEvent {
  const SaveMealPlannerChangesEvent();
}

final class HideBannerEvent extends MealPlannerEvent {
  const HideBannerEvent();
}

final class AddMealSlotEvent extends MealPlannerEvent {
  const AddMealSlotEvent();
}

final class RemoveMealSlotEvent extends MealPlannerEvent {
  final int index;
  const RemoveMealSlotEvent(this.index);

  @override
  List<Object?> get props => [index];
}

final class VerifyUnifiedDayPaymentEvent extends MealPlannerEvent {
  final String paymentId;

  const VerifyUnifiedDayPaymentEvent(this.paymentId);

  @override
  List<Object?> get props => [paymentId];
}

final class PaymentCancelledEvent extends MealPlannerEvent {
  const PaymentCancelledEvent();
}
