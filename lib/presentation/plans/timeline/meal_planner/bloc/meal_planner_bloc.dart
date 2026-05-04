import 'package:basic_diet/data/network/failure.dart';
import 'package:basic_diet/data/request/day_selection_request.dart';
import 'package:basic_diet/domain/model/current_subscription_overview_model.dart';
import 'package:basic_diet/domain/model/meal_planner_menu_model.dart';
import 'package:basic_diet/domain/model/premium_payment_model.dart';
import 'package:basic_diet/domain/model/subscription_day_model.dart';
import 'package:basic_diet/domain/model/timeline_model.dart';
import 'package:basic_diet/domain/usecase/confirm_day_selection_usecase.dart';
import 'package:basic_diet/domain/usecase/create_unified_day_payment_usecase.dart';
import 'package:basic_diet/domain/usecase/get_meal_planner_menu_usecase.dart';
import 'package:basic_diet/domain/usecase/get_subscription_day_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:basic_diet/domain/usecase/save_day_selection_usecase.dart';
import 'package:basic_diet/domain/usecase/validate_day_selection_usecase.dart';
import 'package:basic_diet/domain/usecase/verify_unified_day_payment_usecase.dart';
import 'package:basic_diet/presentation/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'meal_planner_event.dart';
import 'meal_planner_state.dart';

class MealPlannerBloc extends Bloc<MealPlannerEvent, MealPlannerState> {
  static const int _carbGramStep = 50;
  static const String _dayPaymentRevisionMismatchCode =
      'DAY_PAYMENT_REVISION_MISMATCH';

  final GetMealPlannerMenuUseCase _getMealPlannerMenuUseCase;
  final GetSubscriptionDayUseCase _getSubscriptionDayUseCase;
  final ValidateDaySelectionUseCase _validateDaySelectionUseCase;
  final SaveDaySelectionUseCase _saveDaySelectionUseCase;
  final CreateUnifiedDayPaymentUseCase _createUnifiedDayPaymentUseCase;
  final VerifyUnifiedDayPaymentUseCase _verifyUnifiedDayPaymentUseCase;
  final ConfirmDaySelectionUseCase _confirmDaySelectionUseCase;
  final List<TimelineDayModel> initialTimelineDays;
  final List<AddonSubscriptionModel> addonEntitlements;
  final List<PremiumSummaryModel> premiumSummaries;
  final int initialDayIndex;
  final int premiumMealsRemaining;
  final String subscriptionId;
  final MealBalanceModel? mealBalance;

  MealPlannerBloc(
    GetMealPlannerMenuUseCase getMealPlannerMenuUseCase,
    GetSubscriptionDayUseCase getSubscriptionDayUseCase,
    ValidateDaySelectionUseCase validateDaySelectionUseCase,
    SaveDaySelectionUseCase saveDaySelectionUseCase,
    CreateUnifiedDayPaymentUseCase createUnifiedDayPaymentUseCase,
    VerifyUnifiedDayPaymentUseCase verifyUnifiedDayPaymentUseCase,
    ConfirmDaySelectionUseCase confirmDaySelectionUseCase, {
    required this.initialTimelineDays,
    required this.addonEntitlements,
    required this.premiumSummaries,
    required this.initialDayIndex,
    int? premiumMealsRemaining,
    this.mealBalance,
    String? subscriptionId,
  })  : _getMealPlannerMenuUseCase = getMealPlannerMenuUseCase,
        _getSubscriptionDayUseCase = getSubscriptionDayUseCase,
        _validateDaySelectionUseCase = validateDaySelectionUseCase,
        _saveDaySelectionUseCase = saveDaySelectionUseCase,
        _createUnifiedDayPaymentUseCase = createUnifiedDayPaymentUseCase,
        _verifyUnifiedDayPaymentUseCase = verifyUnifiedDayPaymentUseCase,
        _confirmDaySelectionUseCase = confirmDaySelectionUseCase,
        premiumMealsRemaining = premiumMealsRemaining ?? 0,
        subscriptionId = subscriptionId ?? '',
        super(
          MealPlannerLoaded(
            timelineDays: initialTimelineDays,
            menu: MealPlannerMenuModel(
              currency: 'SAR',
              builderCatalog: BuilderCatalogModel(
                categories: const [],
                proteins: const [],
                premiumProteins: const [],
                carbs: const [],
                sandwiches: const [],
                rules: BuilderRulesModel(
                  version: '1',
                  beef: BeefRuleModel(
                    proteinFamilyKey: 'beef',
                    maxSlotsPerDay: 1,
                  ),
                ),
              ),
            ),
            addOnsCatalog: const [],
            addonEntitlements: addonEntitlements,
            premiumSummaries: premiumSummaries,
            selectedDayIndex: initialDayIndex,
            selectedSlotsPerDay: const {},
            savedSlotsPerDay: const {},
            selectedAddOnIdsByDay: const {},
            savedAddOnIdsByDay: const {},
            dayDetailsByIndex: const {},
            premiumMealsRemaining: premiumMealsRemaining ?? 0,
            mealBalance: mealBalance,
          ),
        ) {
    on<GetMealPlannerDataEvent>(_onGetData);
    on<ChangeDateEvent>(_onChangeDate);
    on<RetrySelectedDayLoadEvent>(_onRetrySelectedDayLoad);
    on<SetMealSlotProteinEvent>(_onSetProtein);
    on<SetMealSlotCarbEvent>(_onSetCarb);
    on<SetPremiumLargeSaladEvent>(_onSetPremiumLargeSalad);
    on<ToggleAddOnSelectionEvent>(_onToggleAddonSelection);
    on<SelectAddonForCategoryEvent>(_onSelectAddonForCategory);
    on<DismissPendingAddonPromptEvent>(_onDismissPendingAddonPrompt);
    on<SaveMealPlannerChangesEvent>(_onSave);
    on<HideBannerEvent>(_onHideBanner);
    on<VerifyUnifiedDayPaymentEvent>(_onVerifyUnifiedDayPayment);
    on<AddMealSlotEvent>(_onAddMealSlot);
    on<RemoveMealSlotEvent>(_onRemoveMealSlot);
    on<PaymentCancelledEvent>(_onPaymentCancelled);
  }

  Future<void> _onGetData(
    GetMealPlannerDataEvent event,
    Emitter<MealPlannerState> emit,
  ) async {
    emit(MealPlannerLoading());

    final menuResult = await _getMealPlannerMenuUseCase.execute(null);
    final menuFailure = menuResult.fold((failure) => failure, (_) => null);
    if (menuFailure != null) {
      emit(MealPlannerError(_formatFailure(menuFailure)));
      return;
    }

    final menu = menuResult.getOrElse(() => throw Exception());
    final slotsByDay = <int, List<MealPlannerSlotSelection>>{};
    final savedSlotsByDay = <int, List<MealPlannerSlotSelection>>{};
    final selectedAddOnIdsByDay = <int, List<String>>{};
    final savedAddOnIdsByDay = <int, List<String>>{};

    for (int dayIndex = 0; dayIndex < initialTimelineDays.length; dayIndex++) {
      final slots = _buildSlotsFromTimelineDay(initialTimelineDays[dayIndex]);
      slotsByDay[dayIndex] = slots;
      savedSlotsByDay[dayIndex] = List<MealPlannerSlotSelection>.from(slots);
      selectedAddOnIdsByDay[dayIndex] = const [];
      savedAddOnIdsByDay[dayIndex] = const [];
    }

    debugPrint(
      'MealPlannerBloc: Initialized with mealBalance: '
      'canConsumeNow=${mealBalance?.canConsumeNow}, '
      'limitEnforced=${mealBalance?.dailyMealLimitEnforced}, '
      'maxConsumable=${mealBalance?.maxConsumableMealsNow}, '
      'remaining=${mealBalance?.remainingMeals}',
    );

    final initialState = MealPlannerLoaded(

      timelineDays: initialTimelineDays,
      menu: menu,
      addOnsCatalog: menu.addons,
      addonEntitlements: addonEntitlements,
      premiumSummaries: premiumSummaries,
      selectedDayIndex: initialDayIndex,
      selectedSlotsPerDay: slotsByDay,
      savedSlotsPerDay: savedSlotsByDay,
      selectedAddOnIdsByDay: selectedAddOnIdsByDay,
      savedAddOnIdsByDay: savedAddOnIdsByDay,
      dayDetailsByIndex: const {},
      premiumMealsRemaining: premiumMealsRemaining,
      mealBalance: mealBalance,
    );

    emit(initialState.copyWith(isRefreshingDay: true));
    await _loadDayDetails(emit, initialState, initialDayIndex, force: true);
  }

  Future<void> _onChangeDate(
    ChangeDateEvent event,
    Emitter<MealPlannerState> emit,
  ) async {
    if (state is! MealPlannerLoaded) return;
    final current = state as MealPlannerLoaded;
    final next = current.copyWith(
      selectedDayIndex: event.index,
      isRefreshingDay: true,
      clearPaymentError: true,
      clearPendingAddonPrompt: true,
    );
    emit(next);
    await _loadDayDetails(emit, next, event.index, force: true);
  }

  Future<void> _onRetrySelectedDayLoad(
    RetrySelectedDayLoadEvent event,
    Emitter<MealPlannerState> emit,
  ) async {
    if (state is! MealPlannerLoaded) return;
    final current = state as MealPlannerLoaded;
    emit(current.copyWith(isRefreshingDay: true, clearPaymentError: true));
    await _loadDayDetails(emit, current, current.selectedDayIndex, force: true);
  }

  void _onSetProtein(
    SetMealSlotProteinEvent event,
    Emitter<MealPlannerState> emit,
  ) {
    if (state is! MealPlannerLoaded) return;
    final current = state as MealPlannerLoaded;
    if (!current.isSelectedDayEditable) {
      emit(current.copyWith(paymentError: _dayNotEditableReason(current)));
      return;
    }

    final slots = _currentSlots(current);
    if (event.slotIndex < 0 || event.slotIndex >= slots.length) return;

    final previous = slots[event.slotIndex];
    final selectedProtein =
        event.proteinId == null
            ? null
            : _findProteinById(current.menu, event.proteinId!);
    final selectedSandwich =
        event.proteinId == null
            ? null
            : _findSandwichById(current.menu, event.proteinId!);

    MealPlannerSlotSelection updated;
    if (event.proteinId == null) {
      updated = previous.copyWith(
        selectionType: 'standard_meal',
        clearProteinId: true,
        clearCarbs: true,
        clearSandwichId: true,
        clearSalad: true,
      );
    } else if (selectedSandwich != null) {
      updated = previous.copyWith(
        selectionType: 'sandwich',
        sandwichId: selectedSandwich.id,
        clearProteinId: true,
        clearCarbs: true,
        clearSalad: true,
      );
    } else {
      updated = previous.copyWith(
        selectionType:
            selectedProtein?.isPremium == true
                ? 'premium_meal'
                : 'standard_meal',
        proteinId: event.proteinId,
        clearSandwichId: true,
        clearSalad: true,
      );
    }

    slots[event.slotIndex] = updated;
    emit(
      current.copyWith(
        selectedSlotsPerDay: _updatedSelectedSlots(current, slots),
        showSavedBanner: event.proteinId != null,
        lastAddedMealName:
            selectedProtein?.name ??
            selectedSandwich?.name ??
            current.lastAddedMealName,
        premiumMealsPendingPayment: _calculatePendingPaymentCount(
          current,
          selectedSlotsPerDay: _updatedSelectedSlots(current, slots),
        ),
        clearPaymentError: true,
      ),
    );
  }

  void _onSetCarb(SetMealSlotCarbEvent event, Emitter<MealPlannerState> emit) {
    if (state is! MealPlannerLoaded) return;
    final current = state as MealPlannerLoaded;
    if (!current.isSelectedDayEditable) {
      emit(current.copyWith(paymentError: _dayNotEditableReason(current)));
      return;
    }

    final slots = _currentSlots(current);
    if (event.slotIndex < 0 || event.slotIndex >= slots.length) return;
    final previous = slots[event.slotIndex];
    final rules = current.menu.builderCatalog.rules;
    final maxItems = _maxCarbItems(rules);
    final carbs = List<MealPlannerSlotCarbSelection>.from(previous.carbs);
    final carbIndex = event.carbIndex.clamp(0, maxItems - 1).toInt();
    if (event.carbId == null) {
      if (carbIndex < carbs.length) {
        carbs.removeAt(carbIndex);
      }
    } else {
      final duplicateIndex = carbs.indexWhere(
        (carb) => carb.carbId == event.carbId,
      );
      final targetIndex = carbIndex > carbs.length ? carbs.length : carbIndex;
      if (duplicateIndex != -1 && duplicateIndex != targetIndex) {
        emit(current.copyWith(clearPaymentError: true));
        return;
      }
      final updatedSelection = MealPlannerSlotCarbSelection(
        carbId: event.carbId!,
        grams: event.grams,
      );
      if (targetIndex < carbs.length) {
        carbs[targetIndex] = updatedSelection;
      } else {
        carbs.add(updatedSelection);
      }
    }
    final normalizedCarbs = _normalizeCarbSelections(carbs, rules);

    slots[event.slotIndex] = previous.copyWith(
      carbs: normalizedCarbs,
      selectionType: _resolvePlateSelectionType(
        current.menu,
        previous.proteinId,
      ),
      clearSandwichId: true,
      clearSalad: true,
    );

    final updatedSlotsByDay = _updatedSelectedSlots(current, slots);
    emit(
      current.copyWith(
        selectedSlotsPerDay: updatedSlotsByDay,
        premiumMealsPendingPayment: _calculatePendingPaymentCount(
          current,
          selectedSlotsPerDay: updatedSlotsByDay,
        ),
        clearPaymentError: true,
      ),
    );
  }

  void _onSetPremiumLargeSalad(
    SetPremiumLargeSaladEvent event,
    Emitter<MealPlannerState> emit,
  ) {
    if (state is! MealPlannerLoaded) return;
    final current = state as MealPlannerLoaded;
    if (!current.isSelectedDayEditable) {
      emit(current.copyWith(paymentError: _dayNotEditableReason(current)));
      return;
    }

    final slots = _currentSlots(current);
    if (event.slotIndex < 0 || event.slotIndex >= slots.length) return;

    slots[event.slotIndex] = slots[event.slotIndex].copyWith(
      selectionType: 'premium_large_salad',
      proteinId: event.proteinId,
      carbs: const [],
      salad: PremiumLargeSaladSelection(
        presetKey: event.presetKey,
        groups: MealPlannerSaladGroupsSelection(
          leafyGreens: event.leafyGreens,
          vegetables: event.vegetables,
          protein: [event.proteinId],
          cheeseNuts: event.cheeseNuts,
          fruits: event.fruits,
          sauce: event.sauce,
        ),
      ),
      clearSandwichId: true,
    );

    final updatedSlotsByDay = _updatedSelectedSlots(current, slots);
    emit(
      current.copyWith(
        selectedSlotsPerDay: updatedSlotsByDay,
        showSavedBanner: true,
        lastAddedMealName:
            current.menu.builderCatalog.premiumLargeSalad?.name ??
            current.lastAddedMealName,
        premiumMealsPendingPayment: _calculatePendingPaymentCount(
          current,
          selectedSlotsPerDay: updatedSlotsByDay,
        ),
        clearPaymentError: true,
      ),
    );
  }

  void _onToggleAddonSelection(
    ToggleAddOnSelectionEvent event,
    Emitter<MealPlannerState> emit,
  ) {
    if (state is! MealPlannerLoaded) return;
    final current = state as MealPlannerLoaded;
    if (!current.isSelectedDayEditable) {
      emit(current.copyWith(paymentError: _dayNotEditableReason(current)));
      return;
    }

    final currentIds = List<String>.from(current.selectedAddOnIds);
    if (currentIds.contains(event.addOn.id)) {
      currentIds.remove(event.addOn.id);
    } else {
      currentIds.add(event.addOn.id);
    }

    emit(
      current.copyWith(
        selectedAddOnIdsByDay: Map<int, List<String>>.from(
          current.selectedAddOnIdsByDay,
        )..[current.selectedDayIndex] = currentIds,
        clearPendingAddonPrompt: true,
        clearPaymentError: true,
      ),
    );
  }

  void _onSelectAddonForCategory(
    SelectAddonForCategoryEvent event,
    Emitter<MealPlannerState> emit,
  ) {
    if (state is! MealPlannerLoaded) return;
    final current = state as MealPlannerLoaded;
    if (!current.isSelectedDayEditable) {
      emit(current.copyWith(paymentError: _dayNotEditableReason(current)));
      return;
    }

    final categoryAddonIds =
        current.addOnsCatalog
            .where((a) => a.category == event.category)
            .map((a) => a.id)
            .toSet();
    final currentIds =
        List<String>.from(current.selectedAddOnIds)
          ..removeWhere((id) => categoryAddonIds.contains(id))
          ..addAll(event.addonIds.where((id) => categoryAddonIds.contains(id)));

    emit(
      current.copyWith(
        selectedAddOnIdsByDay: Map<int, List<String>>.from(
          current.selectedAddOnIdsByDay,
        )..[current.selectedDayIndex] = currentIds,
        clearPendingAddonPrompt: true,
        clearPaymentError: true,
      ),
    );
  }

  void _onDismissPendingAddonPrompt(
    DismissPendingAddonPromptEvent event,
    Emitter<MealPlannerState> emit,
  ) {
    if (state is! MealPlannerLoaded) return;
    emit((state as MealPlannerLoaded).copyWith(clearPendingAddonPrompt: true));
  }

  Future<void> _onSave(
    SaveMealPlannerChangesEvent event,
    Emitter<MealPlannerState> emit,
  ) async {
    if (state is! MealPlannerLoaded) return;
    await _saveAndMaybeContinue(emit, state as MealPlannerLoaded);
  }

  void _onHideBanner(HideBannerEvent event, Emitter<MealPlannerState> emit) {
    if (state is! MealPlannerLoaded) return;
    emit((state as MealPlannerLoaded).copyWith(showSavedBanner: false));
  }

  Future<void> _onVerifyUnifiedDayPayment(
    VerifyUnifiedDayPaymentEvent event,
    Emitter<MealPlannerState> emit,
  ) async {
    await _verifyPayment(emit, event.paymentId);
  }

  Future<void> _onPaymentCancelled(
    PaymentCancelledEvent event,
    Emitter<MealPlannerState> emit,
  ) async {
    if (state is! MealPlannerLoaded) return;
    final current = state as MealPlannerLoaded;
    final cleared = current.copyWith(
      isSaving: false,
      clearPaymentUrl: true,
      clearPaymentId: true,
      clearPaymentError: true,
    );
    emit(cleared);
    await _loadDayDetails(emit, cleared, cleared.selectedDayIndex, force: true);
  }

  Future<void> _loadDayDetails(
    Emitter<MealPlannerState> emit,
    MealPlannerLoaded baseState,
    int dayIndex, {
    bool force = false,
  }) async {
    if (!force && baseState.dayDetailsByIndex.containsKey(dayIndex)) {
      emit(baseState.copyWith(isRefreshingDay: false));
      return;
    }

    final day = baseState.timelineDays[dayIndex];
    final result = await _getSubscriptionDayUseCase.execute(
      GetSubscriptionDayUseCaseInput(subscriptionId, day.date),
    );

    result.fold(
      (failure) {
        if (!emit.isDone) {
          emit(
            baseState.copyWith(
              isRefreshingDay: false,
              paymentError: _formatFailure(failure),
            ),
          );
        }
      },
      (dayDetail) {
        if (emit.isDone) return;
        final next = _applyUpdatedDay(
          baseState,
          dayDetail,
          dayIndex: dayIndex,
        ).copyWith(
          selectedDayIndex: dayIndex,
          isRefreshingDay: false,
          clearPaymentError: true,
        );
        emit(next);
      },
    );
  }

  Future<void> _saveAndMaybeContinue(
    Emitter<MealPlannerState> emit,
    MealPlannerLoaded current,
  ) async {
    if (!current.isSelectedDayEditable) {
      emit(current.copyWith(paymentError: _dayNotEditableReason(current)));
      return;
    }

    final carbValidationMessage = _validateCurrentCarbSelections(current);
    if (carbValidationMessage != null) {
      emit(current.copyWith(paymentError: carbValidationMessage));
      return;
    }

    final request = _buildRequest(current);
    final currentDay = current.selectedTimelineDay;

    emit(
      current.copyWith(
        isSaving: true,
        saveSuccess: false,
        clearPaymentError: true,
        clearPendingAddonPrompt: true,
      ),
    );

    final validation = await _validateDaySelectionUseCase.execute(
      ValidateDaySelectionUseCaseInput(
        subscriptionId,
        currentDay.date,
        request,
      ),
    );
    final validationFailure = validation.fold(
      (failure) => failure,
      (_) => null,
    );
    if (validationFailure != null) {
      emit(
        current.copyWith(
          isSaving: false,
          paymentError: _formatFailure(validationFailure),
        ),
      );
      return;
    }

    final validationResult = validation.getOrElse(() => throw Exception());
    if (!validationResult.valid) {
      final firstError =
          validationResult.slotErrors?.isNotEmpty == true
              ? validationResult.slotErrors!.first.message
              : Strings.validationFailed.tr();
      emit(current.copyWith(isSaving: false, paymentError: firstError));
      return;
    }

    final result = await _saveDaySelectionUseCase.execute(
      SaveDaySelectionUseCaseInput(subscriptionId, currentDay.date, request),
    );

    await result.fold(
      (failure) async {
        if (!emit.isDone) {
          emit(
            current.copyWith(
              isSaving: false,
              paymentError: _formatFailure(failure),
            ),
          );
        }
      },
      (updatedDay) async {
        if (emit.isDone) return;

        final updatedState = _applyUpdatedDay(current, updatedDay).copyWith(
          isSaving: true,
          clearPaymentError: true,
        );
        emit(updatedState);

        final requiresPayment =
            updatedDay.paymentRequirement?.requiresPayment ?? false;

        if (!requiresPayment && _canConfirm(updatedDay.paymentRequirement)) {
          await _confirmAndFinalize(emit, updatedState, currentDay.date);
          return;
        }

        if (updatedDay.paymentRequirement?.canCreatePayment == true) {
          await _createUnifiedDayPayment(emit, updatedState, updatedDay);
          return;
        }

        emit(
          updatedState.copyWith(
            isSaving: false,
            saveSuccess: false,
            paymentError: _blockingReasonMessage(updatedDay.paymentRequirement),
          ),
        );
      },
    );
  }

  bool _canConfirm(PaymentRequirementModel? requirement) {
    if (requirement?.requiresPayment == true) return false;
    final reason = requirement?.blockingReason?.toUpperCase();
    return reason == null || reason.isEmpty || reason == 'PLANNER_UNCONFIRMED';
  }

  String _blockingReasonMessage(PaymentRequirementModel? requirement) {
    final reason = requirement?.blockingReason;
    return reason?.isNotEmpty == true ? reason! : Strings.paymentRequiredMessage.tr();
  }

  Future<void> _confirmAndFinalize(
    Emitter<MealPlannerState> emit,
    MealPlannerLoaded current,
    String date,
  ) async {
    final confirmResult = await _confirmDaySelectionUseCase.execute(
      ConfirmDaySelectionUseCaseInput(subscriptionId, date),
    );

    await confirmResult.fold(
      (failure) async {
        if (!emit.isDone) {
          emit(
            current.copyWith(
              isSaving: false,
              paymentError: _formatFailure(failure),
            ),
          );
        }
      },
      (confirmedDay) async {
        if (emit.isDone) return;
        var finalDay = confirmedDay;
        final refreshed = await _getSubscriptionDayUseCase.execute(
          GetSubscriptionDayUseCaseInput(subscriptionId, date),
        );
        refreshed.fold((failure) => null, (day) {
          finalDay = day;
          return null;
        });
        if (emit.isDone) return;
        emit(
          _applyUpdatedDay(current, finalDay).copyWith(
            isSaving: false,
            saveSuccess: true,
            premiumMealsPendingPayment: 0,
            clearPaymentError: true,
          ),
        );
      },
    );
  }

  Future<void> _createUnifiedDayPayment(
    Emitter<MealPlannerState> emit,
    MealPlannerLoaded stateAfterSave,
    SubscriptionDayModel updatedDay,
  ) async {
    final day = stateAfterSave.selectedTimelineDay;
    var paymentState = stateAfterSave;
    var paymentDay = updatedDay;

    if (paymentDay.plannerRevisionHash.isEmpty) {
      final refreshed = await _reloadPaymentDay(emit, paymentState, day.date);
      if (refreshed == null) return;
      paymentState = refreshed.state;
      paymentDay = refreshed.day;
    }

    final paymentResult = await _createUnifiedDayPaymentUseCase.execute(
      CreateUnifiedDayPaymentUseCaseInput(
        subscriptionId,
        day.date,
        plannerRevisionHash: paymentDay.plannerRevisionHash,
      ),
    );

    await paymentResult.fold(
      (failure) async {
        if (!_isDayPaymentRevisionMismatch(failure)) {
          if (!emit.isDone) {
            emit(
              paymentState.copyWith(
                isSaving: false,
                paymentError: _formatFailure(failure),
              ),
            );
          }
          return;
        }

        final refreshed = await _reloadPaymentDay(emit, paymentState, day.date);
        if (refreshed == null) return;

        final retryResult = await _createUnifiedDayPaymentUseCase.execute(
          CreateUnifiedDayPaymentUseCaseInput(
            subscriptionId,
            day.date,
            plannerRevisionHash: refreshed.day.plannerRevisionHash,
          ),
        );

        retryResult.fold(
          (_) {
            if (!emit.isDone) {
              emit(
                refreshed.state.copyWith(
                  isSaving: false,
                  paymentError: Strings.daySelectionChangedReview.tr(),
                ),
              );
            }
          },
          (paymentModel) {
            _emitPaymentReady(emit, refreshed.state, paymentModel);
          },
        );
      },
      (paymentModel) async {
        _emitPaymentReady(emit, paymentState, paymentModel);
      },
    );
  }

  Future<({MealPlannerLoaded state, SubscriptionDayModel day})?>
  _reloadPaymentDay(
    Emitter<MealPlannerState> emit,
    MealPlannerLoaded baseState,
    String date,
  ) async {
    final refreshed = await _getSubscriptionDayUseCase.execute(
      GetSubscriptionDayUseCaseInput(subscriptionId, date),
    );

    return refreshed.fold(
      (failure) {
        if (!emit.isDone) {
          emit(
            baseState.copyWith(
              isSaving: false,
              paymentError: _formatFailure(failure),
            ),
          );
        }
        return null;
      },
      (freshDay) {
        if (emit.isDone) return null;
        final freshState = _applyUpdatedDay(
          baseState,
          freshDay,
        ).copyWith(isSaving: true, clearPaymentError: true);
        emit(freshState);
        return (state: freshState, day: freshDay);
      },
    );
  }

  void _emitPaymentReady(
    Emitter<MealPlannerState> emit,
    MealPlannerLoaded paymentState,
    PremiumPaymentModel paymentModel,
  ) {
    if (!emit.isDone) {
      emit(
        paymentState.copyWith(
          isSaving: false,
          paymentUrl: paymentModel.paymentUrl,
          paymentId: paymentModel.paymentId,
          activePaymentKind: 'unified_day',
        ),
      );
    }
  }

  bool _isDayPaymentRevisionMismatch(Failure failure) {
    return failure.code?.toString().toUpperCase() ==
        _dayPaymentRevisionMismatchCode;
  }

  Future<void> _verifyPayment(
    Emitter<MealPlannerState> emit,
    String paymentId,
  ) async {
    if (state is! MealPlannerLoaded) return;
    final current = state as MealPlannerLoaded;
    final day = current.selectedTimelineDay;

    emit(
      current.copyWith(
        isSaving: true,
        saveSuccess: false,
        clearPaymentError: true,
      ),
    );

    final result = await _verifyUnifiedDayPaymentUseCase.execute(
      VerifyUnifiedDayPaymentUseCaseInput(
        subscriptionId,
        day.date,
        paymentId,
      ),
    );

    final verificationFailure = result.fold((failure) => failure, (_) => null);
    if (verificationFailure != null) {
      emit(
        current.copyWith(
          isSaving: false,
          paymentError: _formatFailure(verificationFailure),
          clearPaymentUrl: true,
          clearPaymentId: true,
        ),
      );
      return;
    }

    final verificationModel = result.getOrElse(() => throw Exception());
    if (verificationModel.paymentStatus != 'paid') {
      emit(
        current.copyWith(
          isSaving: false,
          paymentError: verificationModel.message,
          clearPaymentUrl: true,
          clearPaymentId: true,
        ),
      );
      return;
    }

    // Payment confirmed — refresh day then confirm.
    final refreshed = await _getSubscriptionDayUseCase.execute(
      GetSubscriptionDayUseCaseInput(subscriptionId, day.date),
    );

    await refreshed.fold(
      (failure) async {
        emit(
          current.copyWith(
            isSaving: false,
            paymentError: _formatFailure(failure),
            clearPaymentUrl: true,
            clearPaymentId: true,
          ),
        );
      },
      (updatedDay) async {
        final updatedState = _applyUpdatedDay(current, updatedDay).copyWith(
          isSaving: false,
          clearPaymentUrl: true,
          clearPaymentId: true,
          activePaymentKind: 'unified_day',
        );
        final requirement = updatedDay.paymentRequirement;
        if (_canConfirm(requirement)) {
          await _confirmAndFinalize(emit, updatedState, day.date);
          return;
        }
        emit(
          updatedState.copyWith(
            paymentError: _blockingReasonMessage(requirement),
          ),
        );
      },
    );
  }

  MealPlannerLoaded _applyUpdatedDay(
    MealPlannerLoaded state,
    SubscriptionDayModel updatedDay, {
    int? dayIndex,
  }) {
    final selectedIndex = dayIndex ?? state.selectedDayIndex;
    final newSlots = _buildSlotsFromSubscriptionDay(
      updatedDay,
      state.timelineDays[selectedIndex].requiredMeals,
    );
    final addonIds =
        updatedDay.addonSelections
            .map((selection) => selection.addonId)
            .where((id) => id.isNotEmpty)
            .toList();

    final updatedTimelineDays = List<TimelineDayModel>.from(state.timelineDays);
    updatedTimelineDays[selectedIndex] = _mergeTimelineDayWithDetail(
      updatedTimelineDays[selectedIndex],
      updatedDay,
    );

    return state.copyWith(
      timelineDays: updatedTimelineDays,
      selectedSlotsPerDay: Map<int, List<MealPlannerSlotSelection>>.from(
        state.selectedSlotsPerDay,
      )..[selectedIndex] = newSlots,
      savedSlotsPerDay: Map<int, List<MealPlannerSlotSelection>>.from(
        state.savedSlotsPerDay,
      )..[selectedIndex] = List<MealPlannerSlotSelection>.from(newSlots),
      selectedAddOnIdsByDay: Map<int, List<String>>.from(
        state.selectedAddOnIdsByDay,
      )..[selectedIndex] = addonIds,
      savedAddOnIdsByDay: Map<int, List<String>>.from(state.savedAddOnIdsByDay)
        ..[selectedIndex] = List<String>.from(addonIds),
      dayDetailsByIndex: Map<int, SubscriptionDayModel>.from(
        state.dayDetailsByIndex,
      )..[selectedIndex] = updatedDay,
      premiumMealsPendingPayment:
          updatedDay.paymentRequirement?.premiumPendingPaymentCount ?? 0,
      mealBalance: updatedDay.mealBalance ?? state.mealBalance,
      clearPaymentError: true,
      clearPendingAddonPrompt: true,

    );
  }

  TimelineDayModel _mergeTimelineDayWithDetail(
    TimelineDayModel base,
    SubscriptionDayModel detail,
  ) {
    return TimelineDayModel(
      date: base.date,
      day: base.day,
      month: base.month,
      dayNumber: base.dayNumber,
      status: detail.status,
      statusLabel: base.statusLabel,
      commercialState: detail.commercialState ?? base.commercialState,
      commercialStateLabel: base.commercialStateLabel,
      canBePrepared: base.canBePrepared,
      fulfillmentReady: base.fulfillmentReady,
      planningReady: detail.plannerMeta?.isDraftValid ?? base.planningReady,
      isFulfillable: base.isFulfillable,
      fulfillmentMode: base.fulfillmentMode,
      consumptionState: base.consumptionState,
      selectedMeals:
          detail.plannerMeta?.completeSlotCount ?? base.selectedMeals,
      requiredMeals:
          detail.plannerMeta?.requiredSlotCount ?? base.requiredMeals,
      specifiedMealCount: base.specifiedMealCount,
      unspecifiedMealCount: base.unspecifiedMealCount,
      hasCustomerSelections: base.hasCustomerSelections,
      selections: base.selections,
      premiumSelections: base.premiumSelections,
      selectedMealIds: base.selectedMealIds,
      paymentRequirement: detail.paymentRequirement,
      mealSlots:
          detail.mealSlots
              .map(
                (slot) => TimelineMealSlot(
                  slotIndex: slot.slotIndex,
                  slotKey: slot.slotKey,
                  selectionType: slot.selectionType,
                  proteinId: slot.proteinId,
                  carbs: slot.carbs,
                  sandwichId: slot.sandwichId,
                  salad: slot.salad,
                  premiumKey: slot.premiumKey,
                  premiumSource: slot.premiumSource,
                  premiumExtraFeeHalala: slot.premiumExtraFeeHalala,
                ),
              )
              .toList(),
    );
  }

  List<MealPlannerSlotSelection> _buildSlotsFromTimelineDay(
    TimelineDayModel day,
  ) {
    if (day.mealSlots.isNotEmpty) {
      final count = day.mealSlots.length > day.requiredMeals
          ? day.mealSlots.length
          : day.requiredMeals;
      return List.generate(count, (index) {
        final slot = index < day.mealSlots.length ? day.mealSlots[index] : null;
        return MealPlannerSlotSelection(
          slotIndex: index + 1,
          slotKey: slot?.slotKey ?? 'slot_${index + 1}',
          selectionType: slot?.selectionType ?? 'standard_meal',
          proteinId: slot?.proteinId,
          carbs:
              slot?.carbs
                  .map(
                    (carb) => MealPlannerSlotCarbSelection(
                      carbId: carb.carbId,
                      grams: carb.grams,
                    ),
                  )
                  .toList() ??
              const [],
          sandwichId: slot?.sandwichId,
          salad:
              slot?.salad == null
                  ? null
                  : PremiumLargeSaladSelection(
                    presetKey: slot!.salad!.presetKey ?? 'large_salad',
                    groups: MealPlannerSaladGroupsSelection(
                      leafyGreens: slot.salad!.groups.leafyGreens,
                      vegetables: slot.salad!.groups.vegetables,
                      protein: slot.salad!.groups.protein,
                      cheeseNuts: slot.salad!.groups.cheeseNuts,
                      fruits: slot.salad!.groups.fruits,
                      sauce: slot.salad!.groups.sauce,
                    ),
                  ),
        );
      });
    }

    final selections = [...day.selections, ...day.premiumSelections];
    return List.generate(day.requiredMeals, (index) {
      final proteinId = index < selections.length ? selections[index] : null;
      return MealPlannerSlotSelection(
        slotIndex: index + 1,
        slotKey: 'slot_${index + 1}',
        selectionType: _defaultSelectionType(proteinId),
        proteinId: proteinId,
      );
    });
  }

  List<MealPlannerSlotSelection> _buildSlotsFromSubscriptionDay(
    SubscriptionDayModel day,
    int requiredMeals,
  ) {
    final count = day.mealSlots.length > requiredMeals
        ? day.mealSlots.length
        : requiredMeals;
    return List.generate(count, (index) {
      final slot = index < day.mealSlots.length ? day.mealSlots[index] : null;
      return MealPlannerSlotSelection(
        slotIndex: index + 1,
        slotKey: slot?.slotKey ?? 'slot_${index + 1}',
        selectionType: slot?.selectionType ?? 'standard_meal',
        proteinId: slot?.proteinId,
        carbs:
            slot?.carbs
                .map(
                  (carb) => MealPlannerSlotCarbSelection(
                    carbId: carb.carbId,
                    grams: carb.grams,
                  ),
                )
                .toList() ??
            const [],
        sandwichId: slot?.sandwichId,
        salad:
            slot?.salad == null
                ? null
                : PremiumLargeSaladSelection(
                  presetKey: slot!.salad!.presetKey ?? 'large_salad',
                  groups: MealPlannerSaladGroupsSelection(
                    leafyGreens: slot.salad!.groups.leafyGreens,
                    vegetables: slot.salad!.groups.vegetables,
                    protein: slot.salad!.groups.protein,
                    cheeseNuts: slot.salad!.groups.cheeseNuts,
                    fruits: slot.salad!.groups.fruits,
                    sauce: slot.salad!.groups.sauce,
                  ),
                ),
      );
    });
  }

  bool _isCompleteSlot(MealPlannerSlotSelection slot) {
    if (slot.selectionType == 'sandwich') {
      return slot.sandwichId != null && slot.sandwichId!.isNotEmpty;
    }
    if (slot.selectionType == 'premium_large_salad') {
      return slot.salad != null &&
          slot.salad!.groups.protein.length == 1 &&
          slot.salad!.groups.sauce.length == 1 &&
          slot.carbs.isEmpty;
    }
    if (state is! MealPlannerLoaded) {
      return slot.proteinId != null && slot.carbs.isNotEmpty;
    }
    final rules = (state as MealPlannerLoaded).menu.builderCatalog.rules;
    return slot.proteinId != null && _hasValidCarbSelections(slot.carbs, rules);
  }

  BuilderProteinModel? _findProteinById(MealPlannerMenuModel menu, String id) {
    for (final protein in menu.builderCatalog.allProteins) {
      if (protein.id == id) return protein;
    }
    return null;
  }

  BuilderSandwichModel? _findSandwichById(
    MealPlannerMenuModel menu,
    String id,
  ) {
    for (final sandwich in menu.builderCatalog.sandwiches) {
      if (sandwich.id == id) return sandwich;
    }
    return null;
  }

  String _resolvePlateSelectionType(
    MealPlannerMenuModel menu,
    String? proteinId,
  ) {
    final protein =
        proteinId == null ? null : _findProteinById(menu, proteinId);
    return protein?.isPremium == true ? 'premium_meal' : 'standard_meal';
  }

  String _defaultSelectionType(String? proteinId) {
    if (proteinId == null) {
      return 'standard_meal';
    }
    return 'standard_meal';
  }

  int _calculatePendingPaymentCount(
    MealPlannerLoaded state, {
    Map<int, List<MealPlannerSlotSelection>>? selectedSlotsPerDay,
  }) {
    return state
        .evaluatePremiumUsage(selectedSlotsPerDay: selectedSlotsPerDay)
        .pendingCount;
  }

  DaySelectionRequest _buildRequest(MealPlannerLoaded current) {
    final slots = _currentSlots(current).where(_isCompleteSlot).toList();
    return DaySelectionRequest(
      slots.map((slot) {
        if (slot.selectionType == 'sandwich') {
          return MealSlotRequest(
            slotIndex: slot.slotIndex,
            slotKey: slot.slotKey,
            selectionType: 'sandwich',
            sandwichId: slot.sandwichId,
          );
        }
        if (slot.selectionType == 'premium_large_salad' && slot.salad != null) {
          return MealSlotRequest(
            slotIndex: slot.slotIndex,
            slotKey: slot.slotKey,
            selectionType: 'premium_large_salad',
            proteinId: slot.proteinId,
            salad: SaladRequest(
              presetKey: slot.salad!.presetKey,
              groups: SaladGroupsRequest(
                leafyGreens: slot.salad!.groups.leafyGreens,
                vegetables: slot.salad!.groups.vegetables,
                protein: slot.salad!.groups.protein,
                cheeseNuts: slot.salad!.groups.cheeseNuts,
                fruits: slot.salad!.groups.fruits,
                sauce: slot.salad!.groups.sauce,
              ),
            ),
          );
        }

        return MealSlotRequest(
          slotIndex: slot.slotIndex,
          slotKey: slot.slotKey,
          selectionType: slot.selectionType,
          proteinId: slot.proteinId,
          carbs:
              slot.carbs
                  .map(
                    (carb) => MealSlotCarbRequest(
                      carbId: carb.carbId,
                      grams: carb.grams,
                    ),
                  )
                  .toList(),
        );
      }).toList(),
      addonsOneTime: current.selectedAddOnIds,
    );
  }

  List<MealPlannerSlotSelection> _currentSlots(MealPlannerLoaded current) {
    return List<MealPlannerSlotSelection>.from(
      current.selectedSlotsPerDay[current.selectedDayIndex] ?? const [],
    );
  }


  Map<int, List<MealPlannerSlotSelection>> _updatedSelectedSlots(
    MealPlannerLoaded current,
    List<MealPlannerSlotSelection> slots,
  ) {
    return Map<int, List<MealPlannerSlotSelection>>.from(
      current.selectedSlotsPerDay,
    )..[current.selectedDayIndex] = slots;
  }

  String _dayNotEditableReason(MealPlannerLoaded current) {
    final blocker =
        current.selectedDayDetail?.paymentRequirement?.blockingReason;
    return blocker?.isNotEmpty == true ? blocker! : 'LOCKED';
  }

  String? _validateCurrentCarbSelections(MealPlannerLoaded current) {
    final rules = current.menu.builderCatalog.rules;
    for (final slot in _currentSlots(current)) {
      if (slot.selectionType == 'sandwich' ||
          slot.selectionType == 'premium_large_salad' ||
          slot.proteinId == null) {
        continue;
      }

      if (slot.carbs.isEmpty) {
        return Strings.selectAtLeastOneCarb.tr();
      }

      if (slot.carbs.any((carb) => carb.grams <= 0)) {
        return Strings.carbGramsRequired.tr();
      }

      if (!_hasValidCarbSelections(slot.carbs, rules)) {
        return Strings.carbTotalLimitExceeded.tr();
      }
    }
    return null;
  }

  bool _hasValidCarbSelections(
    List<MealPlannerSlotCarbSelection> carbs,
    BuilderRulesModel rules,
  ) {
    if (carbs.isEmpty) return false;
    if (carbs.length > _maxCarbItems(rules)) return false;
    final seenIds = <String>{};
    var totalGrams = 0;
    for (final carb in carbs) {
      if (carb.carbId.isEmpty || carb.grams <= 0 || !seenIds.add(carb.carbId)) {
        return false;
      }
      totalGrams += carb.grams;
    }
    return totalGrams <= _maxCarbTotalGrams(rules);
  }

  List<MealPlannerSlotCarbSelection> _normalizeCarbSelections(
    List<MealPlannerSlotCarbSelection> carbs,
    BuilderRulesModel rules,
  ) {
    final normalized = <MealPlannerSlotCarbSelection>[];
    final seenIds = <String>{};
    final maxItems = _maxCarbItems(rules);
    final maxTotal = _maxCarbTotalGrams(rules);
    var consumedGrams = 0;

    for (final carb in carbs) {
      if (normalized.length >= maxItems || carb.carbId.isEmpty) {
        continue;
      }
      if (!seenIds.add(carb.carbId)) {
        continue;
      }

      final remainingGrams = maxTotal - consumedGrams;
      final normalizedGrams = _normalizeCarbGrams(
        carb.grams,
        maxAllowed: remainingGrams,
      );
      if (normalizedGrams <= 0) {
        continue;
      }

      normalized.add(
        MealPlannerSlotCarbSelection(
          carbId: carb.carbId,
          grams: normalizedGrams,
        ),
      );
      consumedGrams += normalizedGrams;
    }

    return normalized;
  }

  int _normalizeCarbGrams(int grams, {required int maxAllowed}) {
    if (maxAllowed < _carbGramStep) {
      return 0;
    }
    final boundedGrams = grams.clamp(_carbGramStep, maxAllowed).toInt();
    final normalizedGrams = (boundedGrams ~/ _carbGramStep) * _carbGramStep;
    return normalizedGrams < _carbGramStep ? 0 : normalizedGrams;
  }

  int _maxCarbItems(BuilderRulesModel rules) {
    final configured = rules.maxCarbItemsPerMeal;
    if (configured <= 0) {
      return 2;
    }
    return configured > 2 ? 2 : configured;
  }

  int _maxCarbTotalGrams(BuilderRulesModel rules) {
    return rules.maxCarbTotalGrams > 0 ? rules.maxCarbTotalGrams : 300;
  }

  String _formatFailure(Failure failure) {
    final code = failure.code?.toString();
    if (code != null && code.isNotEmpty) {
      return failure.message.isNotEmpty ? '$code: ${failure.message}' : code;
    }
    return failure.message;
  }

  void _onAddMealSlot(AddMealSlotEvent event, Emitter<MealPlannerState> emit) {
    if (state is! MealPlannerLoaded) return;
    final currentState = state as MealPlannerLoaded;

    if (!currentState.canAddMoreMeals) return;

    final selectedDayIndex = currentState.selectedDayIndex;
    final currentDaySlots = List<MealPlannerSlotSelection>.from(
      currentState.selectedSlotsPerDay[selectedDayIndex] ?? const [],
    );

    // Add a new empty slot
    currentDaySlots.add(
      MealPlannerSlotSelection(
        slotIndex: currentDaySlots.length + 1,
        slotKey: 'slot_${currentDaySlots.length + 1}',
        proteinId: null,
      ),
    );

    final updatedSelectedSlots = Map<int, List<MealPlannerSlotSelection>>.from(
      currentState.selectedSlotsPerDay,
    );
    updatedSelectedSlots[selectedDayIndex] = currentDaySlots;

    emit(currentState.copyWith(selectedSlotsPerDay: updatedSelectedSlots));
  }

  void _onRemoveMealSlot(
    RemoveMealSlotEvent event,
    Emitter<MealPlannerState> emit,
  ) {
    if (state is! MealPlannerLoaded) return;
    final currentState = state as MealPlannerLoaded;

    if (!currentState.isSelectedDayEditable) return;

    final selectedDayIndex = currentState.selectedDayIndex;
    final currentDaySlots = List<MealPlannerSlotSelection>.from(
      currentState.selectedSlotsPerDay[selectedDayIndex] ?? const [],
    );

    if (event.index < 0 || event.index >= currentDaySlots.length) return;

    currentDaySlots.removeAt(event.index);

    // Re-index slots
    final indexedSlots = List<MealPlannerSlotSelection>.generate(
      currentDaySlots.length,
      (i) => currentDaySlots[i].copyWith(
        slotIndex: i + 1,
        slotKey: 'slot_${i + 1}',
      ),
    );

    final updatedSelectedSlots = Map<int, List<MealPlannerSlotSelection>>.from(
      currentState.selectedSlotsPerDay,
    );
    updatedSelectedSlots[selectedDayIndex] = indexedSlots;

    emit(currentState.copyWith(selectedSlotsPerDay: updatedSelectedSlots));
  }
}
