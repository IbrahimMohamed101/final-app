import 'package:basic_diet/data/response/base_response/base_response.dart';
import 'package:basic_diet/data/response/current_subscription_overview_response.dart';
import 'package:basic_diet/data/response/subscription_day_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'timeline_response.g.dart';

@JsonSerializable()
class TimelineMealSlotResponse {
  @JsonKey(name: 'slotIndex')
  final int? slotIndex;

  @JsonKey(name: 'slotKey')
  final String? slotKey;

  @JsonKey(name: 'selectionType')
  final String? selectionType;

  @JsonKey(name: 'proteinId')
  final String? proteinId;

  @JsonKey(name: 'carbs', defaultValue: [])
  final List<MealSlotCarbResponse> carbs;

  @JsonKey(name: 'sandwichId')
  final String? sandwichId;

  @JsonKey(name: 'salad')
  final SaladResponse? salad;

  @JsonKey(name: 'premiumKey')
  final String? premiumKey;

  @JsonKey(name: 'premiumSource')
  final String? premiumSource;

  @JsonKey(name: 'premiumExtraFeeHalala')
  final int? premiumExtraFeeHalala;

  const TimelineMealSlotResponse({
    this.slotIndex,
    this.slotKey,
    this.selectionType,
    this.proteinId,
    this.carbs = const [],
    this.sandwichId,
    this.salad,
    this.premiumKey,
    this.premiumSource,
    this.premiumExtraFeeHalala,
  });

  factory TimelineMealSlotResponse.fromJson(Map<String, dynamic> json) {
    final normalized = Map<String, dynamic>.from(json);
    if (normalized['carbs'] == null && normalized['carbId'] != null) {
      normalized['carbs'] = [
        {'carbId': normalized['carbId'], 'grams': 150},
      ];
    }
    if (normalized['selectionType'] == 'standard_combo') {
      normalized['selectionType'] = 'standard_meal';
    }
    if (normalized['selectionType'] == 'custom_premium_salad') {
      normalized['selectionType'] = 'premium_large_salad';
    }
    return _$TimelineMealSlotResponseFromJson(normalized);
  }

  Map<String, dynamic> toJson() => _$TimelineMealSlotResponseToJson(this);
}

@JsonSerializable()
class TimelineDayResponse {
  @JsonKey(name: 'date')
  final String? date;

  @JsonKey(name: 'day')
  final String? day;

  @JsonKey(name: 'month')
  final String? month;

  @JsonKey(name: 'dayNumber')
  final int? dayNumber;

  @JsonKey(name: 'status')
  final String? status;

  @JsonKey(name: 'deliveryMode')
  final String? deliveryMode;

  @JsonKey(name: 'statusLabel')
  final String? statusLabel;

  @JsonKey(name: 'commercialState')
  final String? commercialState;

  @JsonKey(name: 'commercialStateLabel')
  final String? commercialStateLabel;

  @JsonKey(name: 'canBePrepared')
  final bool? canBePrepared;

  @JsonKey(name: 'fulfillmentReady')
  final bool? fulfillmentReady;

  @JsonKey(name: 'planningReady')
  final bool? planningReady;

  @JsonKey(name: 'isFulfillable')
  final bool? isFulfillable;

  @JsonKey(name: 'fulfillmentMode')
  final String? fulfillmentMode;

  @JsonKey(name: 'consumptionState')
  final String? consumptionState;

  @JsonKey(name: 'selectedMeals')
  final int? selectedMeals;

  @JsonKey(name: 'requiredMeals')
  final int? requiredMeals;

  @JsonKey(name: 'specifiedMealCount')
  final int? specifiedMealCount;

  @JsonKey(name: 'unspecifiedMealCount')
  final int? unspecifiedMealCount;

  @JsonKey(name: 'hasCustomerSelections')
  final bool? hasCustomerSelections;

  @JsonKey(name: 'selections')
  final List<String>? selections;

  @JsonKey(name: 'premiumSelections')
  final List<String>? premiumSelections;

  @JsonKey(name: 'selectedMealIds')
  final List<String>? selectedMealIds;

  @JsonKey(name: 'mealSlots')
  final List<TimelineMealSlotResponse>? mealSlots;

  @JsonKey(name: 'paymentRequirement')
  final PaymentRequirementResponse? paymentRequirement;

  @JsonKey(name: 'deliveryAddress')
  final OverviewAddressSummaryResponse? deliveryAddress;

  @JsonKey(name: 'deliveryWindow', readValue: readDeliveryWindowSummary)
  final OverviewDeliveryWindowSummaryResponse? deliveryWindow;

  @JsonKey(name: 'pickupLocation')
  final OverviewPickupLocationSummaryResponse? pickupLocation;

  @JsonKey(name: 'fulfillmentSummary')
  final OverviewFulfillmentSummaryResponse? fulfillmentSummary;

  @JsonKey(name: 'lockedReason')
  final String? lockedReason;

  @JsonKey(name: 'lockedMessage')
  final String? lockedMessage;

  @JsonKey(name: 'isPast')
  final bool? isPast;

  @JsonKey(name: 'autoSettled')
  final bool? autoSettled;

  @JsonKey(name: 'settledAt')
  final String? settledAt;

  @JsonKey(name: 'settlementReason')
  final String? settlementReason;

  @JsonKey(name: 'consumedByPolicy')
  final bool? consumedByPolicy;

  const TimelineDayResponse({
    this.date,
    this.day,
    this.month,
    this.dayNumber,
    this.status,
    this.deliveryMode,
    this.statusLabel,
    this.commercialState,
    this.commercialStateLabel,
    this.canBePrepared,
    this.fulfillmentReady,
    this.planningReady,
    this.isFulfillable,
    this.fulfillmentMode,
    this.consumptionState,
    this.selectedMeals,
    this.requiredMeals,
    this.specifiedMealCount,
    this.unspecifiedMealCount,
    this.hasCustomerSelections,
    this.selections,
    this.premiumSelections,
    this.selectedMealIds,
    this.mealSlots,
    this.paymentRequirement,
    this.deliveryAddress,
    this.deliveryWindow,
    this.pickupLocation,
    this.fulfillmentSummary,
    this.lockedReason,
    this.lockedMessage,
    this.isPast,
    this.autoSettled,
    this.settledAt,
    this.settlementReason,
    this.consumedByPolicy,
  });

  factory TimelineDayResponse.fromJson(Map<String, dynamic> json) =>
      _$TimelineDayResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TimelineDayResponseToJson(this);
}

@JsonSerializable()
class TimelineDataResponse {
  @JsonKey(name: 'subscriptionId')
  final String? subscriptionId;

  @JsonKey(name: 'dailyMealsRequired')
  final int? dailyMealsRequired;

  @JsonKey(name: 'days')
  final List<TimelineDayResponse>? days;

  @JsonKey(name: 'premiumMealsRemaining')
  final int? premiumMealsRemaining;

  @JsonKey(name: 'addonSubscriptions')
  final List<AddonSubscriptionResponse>? addonSubscriptions;

  /// Additive meal balance from the TOTAL_BALANCE_WITHIN_VALIDITY policy.
  /// Nullable — not all payloads will include it.
  @JsonKey(name: 'mealBalance')
  final MealBalanceResponse? mealBalance;

  const TimelineDataResponse(
    this.subscriptionId,
    this.dailyMealsRequired,
    this.days,
    this.premiumMealsRemaining,
    this.addonSubscriptions, [
    this.mealBalance,
  ]);

  factory TimelineDataResponse.fromJson(Map<String, dynamic> json) =>
      _$TimelineDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TimelineDataResponseToJson(this);
}

@JsonSerializable()
class TimelineResponse extends BaseResponse {
  @JsonKey(name: 'data')
  final TimelineDataResponse? data;

  TimelineResponse(this.data);

  factory TimelineResponse.fromJson(Map<String, dynamic> json) =>
      _$TimelineResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TimelineResponseToJson(this);
}
