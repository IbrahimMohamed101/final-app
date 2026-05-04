import 'package:basic_diet/domain/model/meal_planner_menu_model.dart';
import 'package:basic_diet/domain/model/timeline_model.dart';
import 'package:basic_diet/domain/model/current_subscription_overview_model.dart';
import 'package:basic_diet/presentation/plans/timeline/meal_planner/bloc/meal_planner_bloc.dart';
import 'package:basic_diet/presentation/plans/timeline/meal_planner/bloc/meal_planner_event.dart';
import 'package:basic_diet/presentation/plans/timeline/meal_planner/bloc/meal_planner_state.dart';
import 'package:basic_diet/domain/usecase/get_meal_planner_menu_usecase.dart';
import 'package:basic_diet/domain/usecase/get_subscription_day_usecase.dart';
import 'package:basic_diet/domain/usecase/validate_day_selection_usecase.dart';
import 'package:basic_diet/domain/usecase/save_day_selection_usecase.dart';
import 'package:basic_diet/domain/usecase/create_unified_day_payment_usecase.dart';
import 'package:basic_diet/domain/usecase/verify_unified_day_payment_usecase.dart';
import 'package:basic_diet/domain/usecase/confirm_day_selection_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';

// Simple fakes for use cases
import 'package:basic_diet/domain/repository/repository.dart';
import 'package:basic_diet/data/network/failure.dart';
import 'package:basic_diet/domain/model/add_ons_model.dart';
import 'package:basic_diet/domain/model/auth_model.dart';
import 'package:basic_diet/domain/model/current_subscription_overview_model.dart';
import 'package:basic_diet/domain/model/plans_model.dart';
import 'package:basic_diet/domain/model/subscription_quote_model.dart';
import 'package:basic_diet/domain/model/subscription_menu_model.dart';
import 'package:basic_diet/domain/model/premium_meals_model.dart';
import 'package:basic_diet/domain/model/delivery_options_model.dart';
import 'package:basic_diet/domain/model/subscription_day_model.dart';
import 'package:basic_diet/domain/model/meal_planner_menu_model.dart';

// Simple fakes for use cases
class FakeGetMenu extends GetMealPlannerMenuUseCase {
  FakeGetMenu() : super(FakeRepository());
  @override
  Future<Either<Failure, MealPlannerMenuModel>> execute(void input) async {
    return Right(MealPlannerMenuModel(
      currency: 'SAR',
      builderCatalog: BuilderCatalogModel(
        categories: [],
        proteins: [],
        premiumProteins: [],
        carbs: [],
        sandwiches: [],
        rules: BuilderRulesModel(
          version: '1',
          beef: BeefRuleModel(proteinFamilyKey: 'beef', maxSlotsPerDay: 1),
        ),
      ),
    ));
  }
}

class FakeRepository implements Repository {
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class FakeGetDay extends GetSubscriptionDayUseCase {
  FakeGetDay() : super(FakeRepository());
  @override
  Future<Either<Failure, SubscriptionDayModel>> execute(
    GetSubscriptionDayUseCaseInput input,
  ) async {
    return Right(SubscriptionDayModel(
      date: '2026-05-04',
      status: 'open',
      mealSlots: const [],
    ));
  }
}
class FakeValidate extends ValidateDaySelectionUseCase {
  FakeValidate() : super(FakeRepository());
}
class FakeSave extends SaveDaySelectionUseCase {
  FakeSave() : super(FakeRepository());
}
class FakePayment extends CreateUnifiedDayPaymentUseCase {
  FakePayment() : super(FakeRepository());
}
class FakeVerify extends VerifyUnifiedDayPaymentUseCase {
  FakeVerify() : super(FakeRepository());
}
class FakeConfirm extends ConfirmDaySelectionUseCase {
  FakeConfirm() : super(FakeRepository());
}

void main() {
  late MealPlannerBloc bloc;
  final timelineDay = TimelineDayModel(
    date: '2026-05-04',
    day: 'Monday',
    month: 'May',
    dayNumber: 4,
    status: 'open',
    commercialState: 'unconfirmed',
    consumptionState: 'planning',
    isPast: false,
    canBePrepared: true,
    fulfillmentReady: false,
    hasCustomerSelections: false,
    selectedMeals: 0,
    requiredMeals: 1, // dailyMealsDefault = 1
    isFulfillable: true,
    autoSettled: false,
    consumedByPolicy: false,
    selections: [],
    premiumSelections: [],
  );

  final mealBalance = MealBalanceModel(
    totalMeals: 30,
    remainingMeals: 25,
    consumedMeals: 5,
    canConsumeNow: true,
    maxConsumableMealsNow: 6,
    mealBalancePolicy: 'TOTAL_BALANCE_WITHIN_VALIDITY',
    dailyMealLimitEnforced: false,
    dailyMealsDefault: 1,
  );

  setUp(() async {
    bloc = MealPlannerBloc(
      FakeGetMenu(),
      FakeGetDay(),
      FakeValidate(),
      FakeSave(),
      FakePayment(),
      FakeVerify(),
      FakeConfirm(),
      initialTimelineDays: [timelineDay],
      addonEntitlements: [],
      premiumSummaries: [],
      initialDayIndex: 0,
      mealBalance: mealBalance,
      subscriptionId: 'sub_123',
    );
    bloc.add(const GetMealPlannerDataEvent());
    // Wait for the initial load to complete
    await bloc.stream.firstWhere((s) => s is MealPlannerLoaded && (s as MealPlannerLoaded).maxMeals > 0);
  });

  group('MealPlannerBloc Dynamic Slots Logic', () {
    test('initial state should have 1 card (requiredMeals=1)', () {
      final state = bloc.state as MealPlannerLoaded;
      expect(state.maxMeals, 1);
      expect(state.canAddMoreMeals, true);
    });

    test('tapping Add Meal adds a second card', () {
      bloc.add(const AddMealSlotEvent());
      // We expect the state to update. Since we don't have bloc_test, we just check the current state after event processing.
      // (Basing this on the assumption that the event is processed synchronously in the test environment if not awaited, 
      // but usually we need to wait for a microtask).
      
      // We'll use a small delay or check stream.
      return expectLater(
        bloc.stream,
        emitsThrough(predicate<MealPlannerState>((state) {
          if (state is! MealPlannerLoaded) return false;
          return state.maxMeals == 2;
        })),
      ).timeout(const Duration(seconds: 1));
    });

    test('user can add up to 6 cards (maxConsumableMealsNow=6)', () async {
       // Add 5 more meals (already has 1)
       bloc.add(const AddMealSlotEvent());
       bloc.add(const AddMealSlotEvent());
       bloc.add(const AddMealSlotEvent());
       bloc.add(const AddMealSlotEvent());
       bloc.add(const AddMealSlotEvent());

       await expectLater(
         bloc.stream,
         emitsThrough(predicate<MealPlannerState>((state) {
            if (state is! MealPlannerLoaded) return false;
            return state.maxMeals == 6;
         })),
       );

       final finalState = bloc.state as MealPlannerLoaded;
       expect(finalState.maxMeals, 6);
       expect(finalState.canAddMoreMeals, false); // Limit reached
    });

    test('removing extra slot re-indexes remaining slots', () async {
      bloc.add(const AddMealSlotEvent()); // Add 2nd slot
      
      // Wait for add
      await bloc.stream.firstWhere((s) => s is MealPlannerLoaded && (s as MealPlannerLoaded).maxMeals == 2);
      
      bloc.add(const RemoveMealSlotEvent(1)); // Remove 2nd slot (index 1)
      
      await bloc.stream.firstWhere((s) => s is MealPlannerLoaded && (s as MealPlannerLoaded).maxMeals == 1);
      
      final state = bloc.state as MealPlannerLoaded;
      expect(state.maxMeals, 1);
      final slots = state.selectedSlotsPerDay[state.selectedDayIndex] ?? [];
      expect(slots[0].slotIndex, 1);
    });
    
    test('missing mealBalance falls back to requiredMeals and enforces limit', () async {
       final fallbackBloc = MealPlannerBloc(
          FakeGetMenu(),
          FakeGetDay(),
          FakeValidate(),
          FakeSave(),
          FakePayment(),
          FakeVerify(),
          FakeConfirm(),
          initialTimelineDays: [timelineDay],
          addonEntitlements: [],
          premiumSummaries: [],
          initialDayIndex: 0,
          mealBalance: null, // Missing
          subscriptionId: 'sub_123',
        );
        fallbackBloc.add(const GetMealPlannerDataEvent());
        await fallbackBloc.stream.firstWhere((s) => s is MealPlannerLoaded && (s as MealPlannerLoaded).maxMeals > 0);
        
        final state = fallbackBloc.state as MealPlannerLoaded;
        expect(state.maxMeals, 1);
        expect(state.canAddMoreMeals, false); // Fallback: dailyLimitEnforced=true
    });
  });
}
