import 'package:basic_diet/domain/model/add_ons_model.dart';
import 'package:basic_diet/domain/model/current_subscription_overview_model.dart';
import 'package:basic_diet/domain/model/meal_planner_menu_model.dart';
import 'package:basic_diet/domain/model/subscription_day_model.dart';
import 'package:basic_diet/domain/model/timeline_model.dart';
import 'package:basic_diet/presentation/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

sealed class MealPlannerState extends Equatable {
  const MealPlannerState();

  @override
  List<Object?> get props => [];
}

final class MealPlannerInitial extends MealPlannerState {}

final class MealPlannerLoading extends MealPlannerState {}

final class MealPlannerError extends MealPlannerState {
  final String message;
  const MealPlannerError(this.message);

  @override
  List<Object?> get props => [message];
}

final class MealPlannerSlotCarbSelection extends Equatable {
  final String carbId;
  final int grams;

  const MealPlannerSlotCarbSelection({required this.carbId, required this.grams});

  @override
  List<Object?> get props => [carbId, grams];
}

final class MealPlannerSaladGroupsSelection extends Equatable {
  final List<String> leafyGreens;
  final List<String> vegetables;
  final List<String> protein;
  final List<String> cheeseNuts;
  final List<String> fruits;
  final List<String> sauce;

  const MealPlannerSaladGroupsSelection({
    this.leafyGreens = const [],
    this.vegetables = const [],
    this.protein = const [],
    this.cheeseNuts = const [],
    this.fruits = const [],
    this.sauce = const [],
  });

  @override
  List<Object?> get props => [
    leafyGreens,
    vegetables,
    protein,
    cheeseNuts,
    fruits,
    sauce,
  ];
}

final class PremiumLargeSaladSelection extends Equatable {
  final String presetKey;
  final MealPlannerSaladGroupsSelection groups;

  const PremiumLargeSaladSelection({
    required this.presetKey,
    required this.groups,
  });

  @override
  List<Object?> get props => [presetKey, groups];
}

final class MealPlannerSlotSelection extends Equatable {
  final int slotIndex;
  final String slotKey;
  final String selectionType;
  final String? proteinId;
  final List<MealPlannerSlotCarbSelection> carbs;
  final String? sandwichId;
  final PremiumLargeSaladSelection? salad;

  const MealPlannerSlotSelection({
    required this.slotIndex,
    required this.slotKey,
    this.selectionType = 'standard_meal',
    required this.proteinId,
    this.carbs = const [],
    this.sandwichId,
    this.salad,
  });

  String? get primaryCarbId => carbs.isEmpty ? null : carbs.first.carbId;

  MealPlannerSlotSelection copyWith({
    int? slotIndex,
    String? slotKey,
    String? selectionType,
    String? proteinId,
    List<MealPlannerSlotCarbSelection>? carbs,
    String? sandwichId,
    PremiumLargeSaladSelection? salad,
    bool clearProteinId = false,
    bool clearCarbs = false,
    bool clearSandwichId = false,
    bool clearSalad = false,
  }) {
    return MealPlannerSlotSelection(
      slotIndex: slotIndex ?? this.slotIndex,
      slotKey: slotKey ?? this.slotKey,
      selectionType: selectionType ?? this.selectionType,
      proteinId: clearProteinId ? null : proteinId ?? this.proteinId,
      carbs: clearCarbs ? const [] : carbs ?? this.carbs,
      sandwichId: clearSandwichId ? null : sandwichId ?? this.sandwichId,
      salad: clearSalad ? null : salad ?? this.salad,
    );
  }

  @override
  List<Object?> get props => [
    slotIndex,
    slotKey,
    selectionType,
    proteinId,
    carbs,
    sandwichId,
    salad,
  ];
}

final class PendingAddonPrompt extends Equatable {
  final String addonId;
  final String title;
  final String category;
  final int priceHalala;
  final String currency;

  const PendingAddonPrompt({
    required this.addonId,
    required this.title,
    required this.category,
    required this.priceHalala,
    required this.currency,
  });

  @override
  List<Object?> get props => [addonId, title, category, priceHalala, currency];
}

final class PremiumUsageEvaluation {
  final int coveredCount;
  final int pendingCount;
  final int pendingAmountHalala;

  const PremiumUsageEvaluation({
    required this.coveredCount,
    required this.pendingCount,
    required this.pendingAmountHalala,
  });
}

final class MealPlannerLoaded extends MealPlannerState {
  final List<TimelineDayModel> timelineDays;
  final MealPlannerMenuModel menu;
  final List<AddOnModel> addOnsCatalog;
  final List<AddonSubscriptionModel> addonEntitlements;
  final List<PremiumSummaryModel> premiumSummaries;
  final int selectedDayIndex;
  final Map<int, List<MealPlannerSlotSelection>> selectedSlotsPerDay;
  final Map<int, List<MealPlannerSlotSelection>> savedSlotsPerDay;
  final Map<int, List<String>> selectedAddOnIdsByDay;
  final Map<int, List<String>> savedAddOnIdsByDay;
  final Map<int, SubscriptionDayModel> dayDetailsByIndex;
  final bool isSaving;
  final bool isRefreshingDay;
  final bool showSavedBanner;
  final String lastAddedMealName;
  final int premiumMealsRemaining;
  final bool saveSuccess;
  final int premiumMealsPendingPayment;
  final String? paymentUrl;
  final String? paymentId;
  final String? paymentError;
  final String? activePaymentKind;
  final PendingAddonPrompt? pendingAddonPrompt;
  final MealBalanceModel? mealBalance;

  const MealPlannerLoaded({
    required this.timelineDays,
    required this.menu,
    required this.addOnsCatalog,
    required this.addonEntitlements,
    required this.premiumSummaries,
    required this.selectedDayIndex,
    required this.selectedSlotsPerDay,
    required this.savedSlotsPerDay,
    required this.selectedAddOnIdsByDay,
    required this.savedAddOnIdsByDay,
    required this.dayDetailsByIndex,
    required this.premiumMealsRemaining,
    this.mealBalance,
    this.isSaving = false,
    this.isRefreshingDay = false,
    this.saveSuccess = false,
    this.showSavedBanner = false,
    this.lastAddedMealName = '',
    this.premiumMealsPendingPayment = 0,
    this.paymentUrl,
    this.paymentId,
    this.paymentError,
    this.activePaymentKind,
    this.pendingAddonPrompt,
  });

  TimelineDayModel get selectedTimelineDay => timelineDays[selectedDayIndex];

  SubscriptionDayModel? get selectedDayDetail => dayDetailsByIndex[selectedDayIndex];

  List<String> get selectedAddOnIds => selectedAddOnIdsByDay[selectedDayIndex] ?? const [];

  List<String> get savedAddOnIds => savedAddOnIdsByDay[selectedDayIndex] ?? const [];

  List<AddonSelectionModel> get addonSelections =>
      selectedDayDetail?.addonSelections ?? const [];

  List<AddOnModel> get plannerAddOnsCatalog =>
      addOnsCatalog.where((addon) => addon.isItem && addon.isFlatOnce).toList();

  Map<String, List<AddOnModel>> get groupedAddons {
    if (menu.addonsByCategory.isNotEmpty) {
      return menu.addonsByCategory;
    }
    final grouped = <String, List<AddOnModel>>{};
    for (final addon in plannerAddOnsCatalog) {
      grouped.putIfAbsent(addon.category, () => <AddOnModel>[]).add(addon);
    }
    return grouped;
  }

  List<AddOnModel> get selectedAddOnModels {
    final catalogMap = {for (final addon in plannerAddOnsCatalog) addon.id: addon};
    return selectedAddOnIds
        .where((id) => catalogMap.containsKey(id))
        .map((id) => catalogMap[id]!)
        .toList();
  }

  List<AddOnModel> selectedAddonsForCategory(String category) {
    return selectedAddOnModels.where((addon) => addon.category == category).toList();
  }

  String addonSelectionStatusFor(
    String addonId, {
    List<String>? selectedAddonIdsOverride,
  }) {
    final backendSelection = addonSelections
        .where((selection) => selection.addonId == addonId)
        .cast<AddonSelectionModel?>()
        .firstWhere((selection) => selection != null, orElse: () => null);
    if (backendSelection != null && selectedAddonIdsOverride == null) {
      return backendSelection.status;
    }
    return _computeLocalAddonStatus(
      addonId,
      selectedAddonIds: selectedAddonIdsOverride ?? selectedAddOnIds,
    );
  }

  String _computeLocalAddonStatus(
    String addonId, {
    required List<String> selectedAddonIds,
  }) {
    final targetAddon = plannerAddOnsCatalog
        .where((addon) => addon.id == addonId)
        .cast<AddOnModel?>()
        .firstWhere((addon) => addon != null, orElse: () => null);

    if (targetAddon == null) {
      return 'pending_payment';
    }

    final allowances = <String, int>{};
    for (final entitlement in addonEntitlements) {
      if ((entitlement.status == 'active' || entitlement.status.isEmpty) &&
          entitlement.includedCount > 0) {
        allowances[entitlement.category] =
            (allowances[entitlement.category] ?? 0) + entitlement.includedCount;
      }
    }

    final catalogById = {for (final addon in plannerAddOnsCatalog) addon.id: addon};
    for (final id in selectedAddonIds) {
      final addon = catalogById[id];
      if (addon == null) continue;
      final remaining = allowances[addon.category] ?? 0;
      if (addon.id == targetAddon.id) {
        return remaining > 0 ? 'subscription' : 'pending_payment';
      }
      if (remaining > 0) {
        allowances[addon.category] = remaining - 1;
      }
    }

    final remaining = allowances[targetAddon.category] ?? 0;
    return remaining > 0 ? 'subscription' : 'pending_payment';
  }

  int get localAddonPendingAmountHalala {
    var total = 0;
    for (final addon in selectedAddOnModels) {
      if (addonSelectionStatusFor(addon.id) == 'pending_payment') {
        total += addon.priceHalala;
      }
    }
    return total;
  }

  int get localAddonPendingCount {
    var total = 0;
    for (final addon in selectedAddOnModels) {
      if (addonSelectionStatusFor(addon.id) == 'pending_payment') {
        total++;
      }
    }
    return total;
  }

  int get addonPendingPaymentCount =>
      selectedDayDetail?.paymentRequirement?.addonPendingPaymentCount ??
      localAddonPendingCount;

  int get addonPendingPaymentAmountHalala =>
      selectedDayDetail?.paymentRequirement?.pendingAmountHalala != null &&
              (selectedDayDetail?.paymentRequirement?.blockingReason
                          ?.toUpperCase() ==
                      'ADDON_PAYMENT_REQUIRED' ||
                  (selectedDayDetail?.paymentRequirement?.addonPendingPaymentCount ?? 0) > 0)
          ? selectedDayDetail!.paymentRequirement!.pendingAmountHalala
          : localAddonPendingAmountHalala;

  int get premiumPendingPaymentAmountHalala {
    final requirement = selectedDayDetail?.paymentRequirement;
    if (requirement != null &&
        ((requirement.blockingReason?.toUpperCase() ==
                'PREMIUM_PAYMENT_REQUIRED') ||
            requirement.premiumPendingPaymentCount > 0)) {
      return requirement.pendingAmountHalala > 0
          ? requirement.pendingAmountHalala
          : requirement.amountHalala;
    }
    return evaluatePremiumUsage().pendingAmountHalala;
  }

  int get totalPendingPaymentAmountHalala {
    final requirement = selectedDayDetail?.paymentRequirement;
    if (requirement != null && requirement.requiresPayment) {
      return requirement.pendingAmountHalala > 0
          ? requirement.pendingAmountHalala
          : requirement.amountHalala;
    }
    return premiumPendingPaymentAmountHalala + addonPendingPaymentAmountHalala;
  }

  String get paymentCurrency {
    final dayCurrency = selectedDayDetail?.paymentRequirement?.currency;
    if (dayCurrency != null && dayCurrency.isNotEmpty) {
      return dayCurrency;
    }
    if (menu.currency.isNotEmpty) return menu.currency;
    return Strings.sar.tr();
  }

  int get maxMeals => selectedDaySlots.length;

  List<MealPlannerSlotSelection> get selectedDaySlots =>
      selectedSlotsPerDay[selectedDayIndex] ?? const [];

  int get displayMaxConsumableMealsNow {
    if (mealBalance?.maxConsumableMealsNow != null) {
      return mealBalance!.maxConsumableMealsNow!;
    }
    // Fallback to initial required meals if mealBalance is missing
    return initialRequiredMeals;
  }

  bool get canAddMoreMeals {
    if (!isSelectedDayEditable) return false;
    if (mealBalance != null) {
      if (mealBalance?.canConsumeNow == false) return false;
      if (mealBalance?.dailyMealLimitEnforced == true) return false;
      // Also ensure we have remaining meals globally if available
      if (mealBalance?.remainingMeals != null && mealBalance!.remainingMeals! <= 0) {
        return false;
      }
    }

    return maxMeals < displayMaxConsumableMealsNow;
  }

  String? get canAddMoreMealsReason {
    if (!isSelectedDayEditable) return "DAY_NOT_EDITABLE";
    if (mealBalance != null) {
      if (mealBalance?.canConsumeNow == false) return "CANNOT_CONSUME_NOW";
      if (mealBalance?.dailyMealLimitEnforced == true) return "DAILY_LIMIT_ENFORCED";
      if (mealBalance?.remainingMeals != null && mealBalance!.remainingMeals! <= 0) {
        return "NO_REMAINING_MEALS";
      }
    }
    if (maxMeals >= displayMaxConsumableMealsNow) return "MAX_MEALS_REACHED";
    return null;
  }

  bool get dailyMealLimitEnforced =>
      mealBalance?.dailyMealLimitEnforced ?? true;

  int get initialRequiredMeals => selectedTimelineDay.requiredMeals;


  bool get isSelectedDayEditable {
    if (selectedTimelineDay.isHistoricalOnly) {
      return false;
    }

    final detail = selectedDayDetail;
    final commercialState = detail?.commercialState ?? selectedTimelineDay.commercialState;
    final blockingReason = detail?.paymentRequirement?.blockingReason?.toUpperCase();
    if (blockingReason == 'DAY_LOCKED_BEFORE_DELIVERY' ||
        blockingReason == 'DELIVERY_TIME_UNAVAILABLE' ||
        blockingReason == 'LOCKED' ||
        blockingReason == 'DAY_ALREADY_CONFIRMED') {
      return false;
    }
    if (commercialState.toLowerCase() == 'confirmed') {
      return false;
    }
    return true;
  }

  bool get hasPendingAddonPayment =>
      (selectedDayDetail?.paymentRequirement?.addonPendingPaymentCount ?? 0) > 0;

  bool get hasPendingPremiumPayment =>
      (selectedDayDetail?.paymentRequirement?.premiumPendingPaymentCount ?? premiumMealsPendingPayment) > 0;

  bool get hasAnyPendingPayment =>
      selectedDayDetail?.paymentRequirement?.requiresPayment ??
      (hasPendingPremiumPayment || hasPendingAddonPayment);

  bool get isDirty {
    for (final entry in selectedSlotsPerDay.entries) {
      final current = entry.value;
      final saved = savedSlotsPerDay[entry.key];
      if (saved == null || current.length != saved.length) return true;
      for (var i = 0; i < current.length; i++) {
        if (current[i] != saved[i]) return true;
      }
    }

    for (final entry in selectedAddOnIdsByDay.entries) {
      final current = entry.value;
      final saved = savedAddOnIdsByDay[entry.key] ?? const [];
      if (!listEquals(current, saved)) return true;
    }

    return false;
  }

  @override
  List<Object?> get props => [
    timelineDays,
    menu,
    addOnsCatalog,
    addonEntitlements,
    premiumSummaries,
    selectedDayIndex,
    selectedSlotsPerDay,
    savedSlotsPerDay,
    selectedAddOnIdsByDay,
    savedAddOnIdsByDay,
    dayDetailsByIndex,
    isSaving,
    isRefreshingDay,
    showSavedBanner,
    lastAddedMealName,
    premiumMealsRemaining,
    saveSuccess,
    premiumMealsPendingPayment,
    paymentUrl,
    paymentId,
    paymentError,
    activePaymentKind,
    pendingAddonPrompt,
    mealBalance,
  ];

  MealPlannerLoaded copyWith({
    List<TimelineDayModel>? timelineDays,
    MealPlannerMenuModel? menu,
    List<AddOnModel>? addOnsCatalog,
    List<AddonSubscriptionModel>? addonEntitlements,
    List<PremiumSummaryModel>? premiumSummaries,
    int? selectedDayIndex,
    Map<int, List<MealPlannerSlotSelection>>? selectedSlotsPerDay,
    Map<int, List<MealPlannerSlotSelection>>? savedSlotsPerDay,
    Map<int, List<String>>? selectedAddOnIdsByDay,
    Map<int, List<String>>? savedAddOnIdsByDay,
    Map<int, SubscriptionDayModel>? dayDetailsByIndex,
    bool? isSaving,
    bool? isRefreshingDay,
    bool? showSavedBanner,
    String? lastAddedMealName,
    int? premiumMealsRemaining,
    bool? saveSuccess,
    int? premiumMealsPendingPayment,
    String? paymentUrl,
    String? paymentId,
    String? paymentError,
    String? activePaymentKind,
    PendingAddonPrompt? pendingAddonPrompt,
    MealBalanceModel? mealBalance,
    bool clearPaymentUrl = false,
    bool clearPaymentId = false,
    bool clearPaymentError = false,
    bool clearPendingAddonPrompt = false,
  }) {
    return MealPlannerLoaded(
      timelineDays: timelineDays ?? this.timelineDays,
      menu: menu ?? this.menu,
      addOnsCatalog: addOnsCatalog ?? this.addOnsCatalog,
      addonEntitlements: addonEntitlements ?? this.addonEntitlements,
      premiumSummaries: premiumSummaries ?? this.premiumSummaries,
      selectedDayIndex: selectedDayIndex ?? this.selectedDayIndex,
      selectedSlotsPerDay: selectedSlotsPerDay ?? this.selectedSlotsPerDay,
      savedSlotsPerDay: savedSlotsPerDay ?? this.savedSlotsPerDay,
      selectedAddOnIdsByDay:
          selectedAddOnIdsByDay ?? this.selectedAddOnIdsByDay,
      savedAddOnIdsByDay: savedAddOnIdsByDay ?? this.savedAddOnIdsByDay,
      dayDetailsByIndex: dayDetailsByIndex ?? this.dayDetailsByIndex,
      isSaving: isSaving ?? this.isSaving,
      isRefreshingDay: isRefreshingDay ?? this.isRefreshingDay,
      showSavedBanner: showSavedBanner ?? this.showSavedBanner,
      lastAddedMealName: lastAddedMealName ?? this.lastAddedMealName,
      premiumMealsRemaining:
          premiumMealsRemaining ?? this.premiumMealsRemaining,
      saveSuccess: saveSuccess ?? this.saveSuccess,
      premiumMealsPendingPayment:
          premiumMealsPendingPayment ?? this.premiumMealsPendingPayment,
      paymentUrl: clearPaymentUrl ? null : paymentUrl ?? this.paymentUrl,
      paymentId: clearPaymentId ? null : paymentId ?? this.paymentId,
      paymentError:
          clearPaymentError ? null : paymentError ?? this.paymentError,
      activePaymentKind: activePaymentKind ?? this.activePaymentKind,
      pendingAddonPrompt:
          clearPendingAddonPrompt
              ? null
              : pendingAddonPrompt ?? this.pendingAddonPrompt,
      mealBalance: mealBalance ?? this.mealBalance,
    );
  }

  PremiumUsageEvaluation evaluatePremiumUsage({
    Map<int, List<MealPlannerSlotSelection>>? selectedSlotsPerDay,
  }) {
    if (premiumSummaries.isEmpty) {
      return _evaluatePremiumUsageByGenericCredits(selectedSlotsPerDay);
    }

    final allowances =
        premiumSummaries
            .where((summary) => summary.remainingQtyTotal > 0)
            .map(
              (summary) => _PremiumAllowanceEntry(
                premiumMealId: summary.premiumMealId,
                premiumKey: summary.premiumKey,
                normalizedName: _normalizePremiumMealName(summary.name),
                remainingCount: summary.remainingQtyTotal,
              ),
            )
            .toList();

    var coveredCount = 0;
    var pendingCount = 0;
    var pendingAmountHalala = 0;
    final slots =
        (selectedSlotsPerDay ?? this.selectedSlotsPerDay)[selectedDayIndex] ??
            const [];

    for (final slot in slots) {
      // --- Premium large salad slot ---
      if (slot.selectionType == 'premium_large_salad') {
        final salad = menu.builderCatalog.premiumLargeSalad;
        if (salad == null) continue;

        final keyMatchIndex = allowances.indexWhere(
          (entry) =>
              entry.remainingCount > 0 &&
              entry.premiumKey.isNotEmpty &&
              entry.premiumKey == salad.premiumKey,
        );
        final idMatchIndex = keyMatchIndex == -1
            ? allowances.indexWhere(
                (entry) =>
                    entry.remainingCount > 0 &&
                    entry.premiumMealId == salad.id,
              )
            : -1;

        final matchIndex =
            keyMatchIndex != -1 ? keyMatchIndex : idMatchIndex;

        if (matchIndex != -1) {
          allowances[matchIndex].remainingCount -= 1;
          coveredCount += 1;
        } else {
          pendingCount += 1;
          pendingAmountHalala += salad.extraFeeHalala;
        }
        continue;
      }

      // --- Regular / premium protein slot ---
      final proteinId = slot.proteinId;
      if (proteinId == null) continue;

      final protein = menu.builderCatalog.allProteins
          .where((item) => item.id == proteinId)
          .cast<BuilderProteinModel?>()
          .firstWhere((item) => item != null, orElse: () => null);

      if (protein == null || !protein.isPremium) continue;

      final normalizedProteinName = _normalizePremiumMealName(protein.name);

      // Match priority: premiumKey → premiumMealId → normalized name
      final keyMatchIndex = protein.premiumKey.isNotEmpty
          ? allowances.indexWhere(
              (entry) =>
                  entry.remainingCount > 0 &&
                  entry.premiumKey.isNotEmpty &&
                  entry.premiumKey == protein.premiumKey,
            )
          : -1;
      final idMatchIndex = keyMatchIndex == -1
          ? allowances.indexWhere(
              (entry) =>
                  entry.remainingCount > 0 &&
                  entry.premiumMealId == protein.id,
            )
          : -1;
      final nameMatchIndex =
          keyMatchIndex == -1 && idMatchIndex == -1
              ? allowances.indexWhere(
                  (entry) =>
                      entry.remainingCount > 0 &&
                      entry.normalizedName == normalizedProteinName,
                )
              : -1;

      final matchIndex = keyMatchIndex != -1
          ? keyMatchIndex
          : idMatchIndex != -1
          ? idMatchIndex
          : nameMatchIndex;

      if (matchIndex != -1) {
        allowances[matchIndex].remainingCount -= 1;
        coveredCount += 1;
        continue;
      }

      pendingCount += 1;
      pendingAmountHalala += protein.extraFeeHalala;
    }

    return PremiumUsageEvaluation(
      coveredCount: coveredCount,
      pendingCount: pendingCount,
      pendingAmountHalala: pendingAmountHalala,
    );
  }

  PremiumUsageEvaluation _evaluatePremiumUsageByGenericCredits(
    Map<int, List<MealPlannerSlotSelection>>? selectedSlotsPerDay,
  ) {
    var coveredCount = 0;
    var pendingCount = 0;
    var pendingAmountHalala = 0;
    var usedCredits = 0;
    final slots =
        (selectedSlotsPerDay ?? this.selectedSlotsPerDay)[selectedDayIndex] ??
            const [];

    for (final slot in slots) {
      // --- Premium large salad slot ---
      if (slot.selectionType == 'premium_large_salad') {
        final salad = menu.builderCatalog.premiumLargeSalad;
        if (salad == null) continue;
        usedCredits += 1;
        if (usedCredits > premiumMealsRemaining) {
          pendingCount += 1;
          pendingAmountHalala += salad.extraFeeHalala;
        } else {
          coveredCount += 1;
        }
        continue;
      }

      // --- Regular / premium protein slot ---
      final proteinId = slot.proteinId;
      if (proteinId == null) continue;

      final protein = menu.builderCatalog.allProteins
          .where((item) => item.id == proteinId)
          .cast<BuilderProteinModel?>()
          .firstWhere((item) => item != null, orElse: () => null);

      if (protein == null || !protein.isPremium) continue;

      final cost = protein.premiumCreditCost == 0 ? 1 : protein.premiumCreditCost;
      usedCredits += cost;

      if (usedCredits > premiumMealsRemaining) {
        pendingCount += 1;
        pendingAmountHalala += protein.extraFeeHalala;
      } else {
        coveredCount += 1;
      }
    }

    return PremiumUsageEvaluation(
      coveredCount: coveredCount,
      pendingCount: pendingCount,
      pendingAmountHalala: pendingAmountHalala,
    );
  }
}

final class _PremiumAllowanceEntry {
  final String premiumMealId;
  final String premiumKey;
  final String normalizedName;
  int remainingCount;

  _PremiumAllowanceEntry({
    required this.premiumMealId,
    required this.premiumKey,
    required this.normalizedName,
    required this.remainingCount,
  });
}

String _normalizePremiumMealName(String value) {
  return value.trim().toLowerCase();
}
