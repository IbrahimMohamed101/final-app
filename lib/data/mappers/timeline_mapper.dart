import 'package:basic_diet/app/constants.dart';
import 'package:basic_diet/app/extensions.dart';
import 'package:basic_diet/data/mappers/current_subscription_overview_mapper.dart';
import 'package:basic_diet/data/mappers/subscription_day_mapper.dart';
import 'package:basic_diet/data/response/timeline_response.dart';
import 'package:basic_diet/domain/model/timeline_model.dart';

extension TimelineDayResponseMapper on TimelineDayResponse? {
  TimelineDayModel toDomain() {
    return TimelineDayModel(
      date: this?.date.orEmpty() ?? Constants.empty,
      day: this?.day.orEmpty() ?? Constants.empty,
      month: this?.month.orEmpty() ?? Constants.empty,
      dayNumber: this?.dayNumber.orZero() ?? Constants.zero,
      status: this?.status.orEmpty() ?? Constants.empty,
      deliveryMode: this?.deliveryMode.orEmpty() ?? Constants.empty,
      statusLabel: this?.statusLabel.orEmpty() ?? Constants.empty,
      commercialState: this?.commercialState.orEmpty() ?? Constants.empty,
      commercialStateLabel:
          this?.commercialStateLabel.orEmpty() ?? Constants.empty,
      canBePrepared: this?.canBePrepared ?? false,
      fulfillmentReady: this?.fulfillmentReady ?? false,
      planningReady: this?.planningReady ?? false,
      isFulfillable: this?.isFulfillable ?? false,
      fulfillmentMode: this?.fulfillmentMode.orEmpty() ?? Constants.empty,
      consumptionState: this?.consumptionState.orEmpty() ?? Constants.empty,
      selectedMeals: this?.selectedMeals.orZero() ?? Constants.zero,
      requiredMeals: this?.requiredMeals.orZero() ?? Constants.zero,
      specifiedMealCount: this?.specifiedMealCount.orZero() ?? Constants.zero,
      unspecifiedMealCount:
          this?.unspecifiedMealCount.orZero() ?? Constants.zero,
      hasCustomerSelections: this?.hasCustomerSelections ?? false,
      selections: this?.selections ?? [],
      premiumSelections: this?.premiumSelections ?? [],
      selectedMealIds: this?.selectedMealIds ?? [],
      paymentRequirement: this?.paymentRequirement?.toDomain(),
      deliveryAddress: this?.deliveryAddress?.toDomain(),
      deliveryWindow: this?.deliveryWindow?.toDomain(),
      pickupLocation: this?.pickupLocation?.toDomain(),
      fulfillmentSummary: this?.fulfillmentSummary?.toDomain(),
      lockedReason: this?.lockedReason.orEmpty() ?? Constants.empty,
      lockedMessage: this?.lockedMessage.orEmpty() ?? Constants.empty,
      isPast: this?.isPast ?? false,
      autoSettled: this?.autoSettled ?? false,
      settledAt: this?.settledAt.orEmpty() ?? Constants.empty,
      settlementReason: this?.settlementReason.orEmpty() ?? Constants.empty,
      consumedByPolicy: this?.consumedByPolicy ?? false,
      mealSlots:
          this?.mealSlots
              ?.map(
                (s) => TimelineMealSlot(
                  slotIndex: s.slotIndex ?? 0,
                  slotKey: s.slotKey,
                  selectionType: s.selectionType,
                  proteinId: s.proteinId,
                  carbs: s.carbs.map((carb) => carb.toDomain()).toList(),
                  sandwichId: s.sandwichId,
                  salad: s.salad?.toDomain(),
                  premiumKey: s.premiumKey,
                  premiumSource: s.premiumSource ?? 'none',
                  premiumExtraFeeHalala: s.premiumExtraFeeHalala ?? 0,
                ),
              )
              .toList() ??
          [],
    );
  }
}

extension TimelineDataResponseMapper on TimelineDataResponse? {
  TimelineDataModel toDomain() {
    return TimelineDataModel(
      subscriptionId: this?.subscriptionId.orEmpty() ?? Constants.empty,
      dailyMealsRequired: this?.dailyMealsRequired.orZero() ?? Constants.zero,
      premiumMealsRemaining:
          this?.premiumMealsRemaining.orZero() ?? Constants.zero,
      days: (this?.days?.map((e) => e.toDomain()).toList()) ?? [],
      addonSubscriptions:
          (this?.addonSubscriptions?.map((e) => e.toDomain()).toList() ?? [])
              .cast(),
      mealBalance: this?.mealBalance?.toDomain(),
    );
  }
}

extension TimelineResponseMapper on TimelineResponse? {
  TimelineModel toDomain() {
    return TimelineModel(
      data:
          this?.data.toDomain() ??
          TimelineDataModel(
            subscriptionId: Constants.empty,
            dailyMealsRequired: Constants.zero,
            premiumMealsRemaining: Constants.zero,
            days: [],
          ),
    );
  }
}
