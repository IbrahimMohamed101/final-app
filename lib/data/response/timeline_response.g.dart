// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeline_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimelineMealSlotResponse _$TimelineMealSlotResponseFromJson(
  Map<String, dynamic> json,
) => TimelineMealSlotResponse(
  slotIndex: (json['slotIndex'] as num?)?.toInt(),
  slotKey: json['slotKey'] as String?,
  selectionType: json['selectionType'] as String?,
  proteinId: json['proteinId'] as String?,
  carbs:
      (json['carbs'] as List<dynamic>?)
          ?.map((e) => MealSlotCarbResponse.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  sandwichId: json['sandwichId'] as String?,
  salad:
      json['salad'] == null
          ? null
          : SaladResponse.fromJson(json['salad'] as Map<String, dynamic>),
  premiumKey: json['premiumKey'] as String?,
  premiumSource: json['premiumSource'] as String?,
  premiumExtraFeeHalala: (json['premiumExtraFeeHalala'] as num?)?.toInt(),
);

Map<String, dynamic> _$TimelineMealSlotResponseToJson(
  TimelineMealSlotResponse instance,
) => <String, dynamic>{
  'slotIndex': instance.slotIndex,
  'slotKey': instance.slotKey,
  'selectionType': instance.selectionType,
  'proteinId': instance.proteinId,
  'carbs': instance.carbs,
  'sandwichId': instance.sandwichId,
  'salad': instance.salad,
  'premiumKey': instance.premiumKey,
  'premiumSource': instance.premiumSource,
  'premiumExtraFeeHalala': instance.premiumExtraFeeHalala,
};

TimelineDayResponse _$TimelineDayResponseFromJson(
  Map<String, dynamic> json,
) => TimelineDayResponse(
  date: json['date'] as String?,
  day: json['day'] as String?,
  month: json['month'] as String?,
  dayNumber: (json['dayNumber'] as num?)?.toInt(),
  status: json['status'] as String?,
  deliveryMode: json['deliveryMode'] as String?,
  statusLabel: json['statusLabel'] as String?,
  commercialState: json['commercialState'] as String?,
  commercialStateLabel: json['commercialStateLabel'] as String?,
  canBePrepared: json['canBePrepared'] as bool?,
  fulfillmentReady: json['fulfillmentReady'] as bool?,
  planningReady: json['planningReady'] as bool?,
  isFulfillable: json['isFulfillable'] as bool?,
  fulfillmentMode: json['fulfillmentMode'] as String?,
  consumptionState: json['consumptionState'] as String?,
  selectedMeals: (json['selectedMeals'] as num?)?.toInt(),
  requiredMeals: (json['requiredMeals'] as num?)?.toInt(),
  specifiedMealCount: (json['specifiedMealCount'] as num?)?.toInt(),
  unspecifiedMealCount: (json['unspecifiedMealCount'] as num?)?.toInt(),
  hasCustomerSelections: json['hasCustomerSelections'] as bool?,
  selections:
      (json['selections'] as List<dynamic>?)?.map((e) => e as String).toList(),
  premiumSelections:
      (json['premiumSelections'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
  selectedMealIds:
      (json['selectedMealIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
  mealSlots:
      (json['mealSlots'] as List<dynamic>?)
          ?.map(
            (e) => TimelineMealSlotResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
  paymentRequirement:
      json['paymentRequirement'] == null
          ? null
          : PaymentRequirementResponse.fromJson(
            json['paymentRequirement'] as Map<String, dynamic>,
          ),
  deliveryAddress:
      json['deliveryAddress'] == null
          ? null
          : OverviewAddressSummaryResponse.fromJson(
            json['deliveryAddress'] as Map<String, dynamic>,
          ),
  deliveryWindow:
      readDeliveryWindowSummary(json, 'deliveryWindow') == null
          ? null
          : OverviewDeliveryWindowSummaryResponse.fromJson(
            readDeliveryWindowSummary(json, 'deliveryWindow')
                as Map<String, dynamic>,
          ),
  pickupLocation:
      json['pickupLocation'] == null
          ? null
          : OverviewPickupLocationSummaryResponse.fromJson(
            json['pickupLocation'] as Map<String, dynamic>,
          ),
  fulfillmentSummary:
      json['fulfillmentSummary'] == null
          ? null
          : OverviewFulfillmentSummaryResponse.fromJson(
            json['fulfillmentSummary'] as Map<String, dynamic>,
          ),
  lockedReason: json['lockedReason'] as String?,
  lockedMessage: json['lockedMessage'] as String?,
  isPast: json['isPast'] as bool?,
  autoSettled: json['autoSettled'] as bool?,
  settledAt: json['settledAt'] as String?,
  settlementReason: json['settlementReason'] as String?,
  consumedByPolicy: json['consumedByPolicy'] as bool?,
);

Map<String, dynamic> _$TimelineDayResponseToJson(
  TimelineDayResponse instance,
) => <String, dynamic>{
  'date': instance.date,
  'day': instance.day,
  'month': instance.month,
  'dayNumber': instance.dayNumber,
  'status': instance.status,
  'deliveryMode': instance.deliveryMode,
  'statusLabel': instance.statusLabel,
  'commercialState': instance.commercialState,
  'commercialStateLabel': instance.commercialStateLabel,
  'canBePrepared': instance.canBePrepared,
  'fulfillmentReady': instance.fulfillmentReady,
  'planningReady': instance.planningReady,
  'isFulfillable': instance.isFulfillable,
  'fulfillmentMode': instance.fulfillmentMode,
  'consumptionState': instance.consumptionState,
  'selectedMeals': instance.selectedMeals,
  'requiredMeals': instance.requiredMeals,
  'specifiedMealCount': instance.specifiedMealCount,
  'unspecifiedMealCount': instance.unspecifiedMealCount,
  'hasCustomerSelections': instance.hasCustomerSelections,
  'selections': instance.selections,
  'premiumSelections': instance.premiumSelections,
  'selectedMealIds': instance.selectedMealIds,
  'mealSlots': instance.mealSlots,
  'paymentRequirement': instance.paymentRequirement,
  'deliveryAddress': instance.deliveryAddress,
  'deliveryWindow': instance.deliveryWindow,
  'pickupLocation': instance.pickupLocation,
  'fulfillmentSummary': instance.fulfillmentSummary,
  'lockedReason': instance.lockedReason,
  'lockedMessage': instance.lockedMessage,
  'isPast': instance.isPast,
  'autoSettled': instance.autoSettled,
  'settledAt': instance.settledAt,
  'settlementReason': instance.settlementReason,
  'consumedByPolicy': instance.consumedByPolicy,
};

TimelineDataResponse _$TimelineDataResponseFromJson(
  Map<String, dynamic> json,
) => TimelineDataResponse(
  json['subscriptionId'] as String?,
  (json['dailyMealsRequired'] as num?)?.toInt(),
  (json['days'] as List<dynamic>?)
      ?.map((e) => TimelineDayResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
  (json['premiumMealsRemaining'] as num?)?.toInt(),
  (json['addonSubscriptions'] as List<dynamic>?)
      ?.map(
        (e) => AddonSubscriptionResponse.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  json['mealBalance'] == null
      ? null
      : MealBalanceResponse.fromJson(
        json['mealBalance'] as Map<String, dynamic>,
      ),
);

Map<String, dynamic> _$TimelineDataResponseToJson(
  TimelineDataResponse instance,
) => <String, dynamic>{
  'subscriptionId': instance.subscriptionId,
  'dailyMealsRequired': instance.dailyMealsRequired,
  'days': instance.days,
  'premiumMealsRemaining': instance.premiumMealsRemaining,
  'addonSubscriptions': instance.addonSubscriptions,
  'mealBalance': instance.mealBalance,
};

TimelineResponse _$TimelineResponseFromJson(Map<String, dynamic> json) =>
    TimelineResponse(
        json['data'] == null
            ? null
            : TimelineDataResponse.fromJson(
              json['data'] as Map<String, dynamic>,
            ),
      )
      ..status = json['status']
      ..message = json['message'] as String?;

Map<String, dynamic> _$TimelineResponseToJson(TimelineResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
