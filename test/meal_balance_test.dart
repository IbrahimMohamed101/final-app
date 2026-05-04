import 'package:basic_diet/domain/model/current_subscription_overview_model.dart';
import 'package:basic_diet/domain/model/timeline_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MealBalanceModel & CurrentSubscriptionOverviewDataModel Helpers', () {
    test('Should prefer mealBalance values when present', () {
      final mealBalance = MealBalanceModel(
        totalMeals: 30,
        remainingMeals: 25,
        consumedMeals: 5,
        canConsumeNow: true,
        maxConsumableMealsNow: 3,
        mealBalancePolicy: 'TOTAL_BALANCE_WITHIN_VALIDITY',
        dailyMealLimitEnforced: false,
        dailyMealsDefault: 3,
      );

      final data = CurrentSubscriptionOverviewDataModel(
        'id',
        '2026-05-04',
        'active',
        '2026-05-01',
        '2026-05-31',
        20,
        10,
        0,
        [],
        2,
        'delivery',
        [],
        [],
        'Active',
        'Delivery',
        'Morning',
        'loc_id',
        '2026-05-31',
        0,
        5,
        5,
        null,
        null,
        null,
        null,
        null,
        null,
        null, // deliveryWindowSummary
        null, // fulfillmentSummary
        mealBalance,
      );

      expect(data.displayRemainingMeals, 25);
      expect(data.displayTotalMeals, 30);
      expect(data.displayConsumedMeals, 5);
      expect(data.displayMaxConsumableMealsNow, 3);
      expect(data.displayCanConsumeNow, true);
      expect(data.displayDailyMealLimitEnforced, false);
      expect(data.displayDailyMealsDefault, 3);
    });

    test('Should fallback to old fields when mealBalance is absent', () {
      final data = CurrentSubscriptionOverviewDataModel(
        'id',
        '2026-05-04',
        'active',
        '2026-05-01',
        '2026-05-31',
        20,
        10,
        0,
        [],
        2,
        'delivery',
        [],
        [],
        'Active',
        'Delivery',
        'Morning',
        'loc_id',
        '2026-05-31',
        0,
        5,
        5,
        null,
        null,
        null,
        null,
        null,
        null,
        null, // deliveryWindowSummary
        null, // fulfillmentSummary
        null, // mealBalance
      );

      expect(data.displayRemainingMeals, 10);
      expect(data.displayTotalMeals, 20);
      expect(data.displayConsumedMeals, 10);
      expect(data.displayMaxConsumableMealsNow, 10);
      expect(data.displayCanConsumeNow, true);
      expect(data.displayDailyMealLimitEnforced, true);
      expect(data.displayDailyMealsDefault, 2);
    });
  });

  group('TimelineDayModel terminal state logic', () {
    test('isHistoricalOnly should only be true for terminal statuses or explicit flags', () {
      // Normal open day in the past (historical by date but NOT terminal by status)
      final pastOpenDay = TimelineDayModel(
        date: '2026-05-01',
        day: 'Monday',
        month: 'May',
        dayNumber: 1,
        status: 'open',
        commercialState: 'unconfirmed',
        consumptionState: 'historical',
        isPast: true,
        canBePrepared: false,
        fulfillmentReady: false,
        hasCustomerSelections: false,
        selectedMeals: 0,
        requiredMeals: 2,
        isFulfillable: false,
        autoSettled: false,
        consumedByPolicy: false,
        selections: [],
        premiumSelections: [],
      );

      // In the new policy, we rely on consumedByPolicy/autoSettled/status for terminality,
      // NOT merely the passage of time (isPast).
      expect(pastOpenDay.isHistoricalOnly, false);

      // Terminal status (consumed_without_preparation)
      final terminalDay = TimelineDayModel(
        date: '2026-05-01',
        day: 'Monday',
        month: 'May',
        dayNumber: 1,
        status: 'consumed_without_preparation',
        commercialState: 'confirmed',
        consumptionState: 'historical',
        isPast: true,
        canBePrepared: false,
        fulfillmentReady: false,
        hasCustomerSelections: false,
        selectedMeals: 0,
        requiredMeals: 2,
        isFulfillable: false,
        autoSettled: true,
        consumedByPolicy: true,
        selections: [],
        premiumSelections: [],
      );
      expect(terminalDay.isHistoricalOnly, true);
    });
  });

  group('MealBalance backward compatibility parsing', () {
    // This would ideally test the Mapper directly if we had a way to mock the Response objects easily
    // But since they are generated, we'll rely on our display helper tests above which cover the logic.
  });
}
