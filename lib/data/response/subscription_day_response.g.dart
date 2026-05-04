// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_day_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$SubscriptionDayResponseToJson(
  SubscriptionDayResponse instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

SubscriptionDayData _$SubscriptionDayDataFromJson(Map<String, dynamic> json) =>
    SubscriptionDayData(
      json['date'] as String,
      json['status'] as String,
      json['plannerState'] as String?,
      json['commercialState'] as String?,
      json['plannerRevisionHash'] as String?,
      (json['mealSlots'] as List<dynamic>?)
              ?.map((e) => MealSlotResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      (json['addonSelections'] as List<dynamic>?)
              ?.map(
                (e) =>
                    AddonSelectionResponse.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          [],
      json['plannerMeta'] == null
          ? null
          : PlannerMetaResponse.fromJson(
            json['plannerMeta'] as Map<String, dynamic>,
          ),
      json['planning'] == null
          ? null
          : PlanningResponse.fromJson(json['planning'] as Map<String, dynamic>),
      json['paymentRequirement'] == null
          ? null
          : PaymentRequirementResponse.fromJson(
            json['paymentRequirement'] as Map<String, dynamic>,
          ),
      json['premiumExtraPayment'] == null
          ? null
          : PremiumExtraPaymentResponse.fromJson(
            json['premiumExtraPayment'] as Map<String, dynamic>,
          ),
      json['rules'] == null
          ? null
          : DayRulesResponse.fromJson(json['rules'] as Map<String, dynamic>),
      json['pickupLocation'] == null
          ? null
          : OverviewPickupLocationSummaryResponse.fromJson(
            json['pickupLocation'] as Map<String, dynamic>,
          ),
      json['deliveryAddress'] == null
          ? null
          : OverviewAddressSummaryResponse.fromJson(
            json['deliveryAddress'] as Map<String, dynamic>,
          ),
      readDeliveryWindowSummary(json, 'deliveryWindow') == null
          ? null
          : OverviewDeliveryWindowSummaryResponse.fromJson(
            readDeliveryWindowSummary(json, 'deliveryWindow')
                as Map<String, dynamic>,
          ),
      json['fulfillmentSummary'] == null
          ? null
          : OverviewFulfillmentSummaryResponse.fromJson(
            json['fulfillmentSummary'] as Map<String, dynamic>,
          ),
      json['lockedReason'] as String?,
      json['lockedMessage'] as String?,
      json['mealBalance'] == null
          ? null
          : MealBalanceResponse.fromJson(
            json['mealBalance'] as Map<String, dynamic>,
          ),
    );

Map<String, dynamic> _$SubscriptionDayDataToJson(
  SubscriptionDayData instance,
) => <String, dynamic>{
  'date': instance.date,
  'status': instance.status,
  'plannerState': instance.plannerState,
  'commercialState': instance.commercialState,
  'plannerRevisionHash': instance.plannerRevisionHash,
  'mealSlots': instance.mealSlots,
  'addonSelections': instance.addonSelections,
  'plannerMeta': instance.plannerMeta,
  'planning': instance.planning,
  'paymentRequirement': instance.paymentRequirement,
  'premiumExtraPayment': instance.premiumExtraPayment,
  'rules': instance.rules,
  'pickupLocation': instance.pickupLocation,
  'deliveryAddress': instance.deliveryAddress,
  'deliveryWindow': instance.deliveryWindow,
  'fulfillmentSummary': instance.fulfillmentSummary,
  'lockedReason': instance.lockedReason,
  'lockedMessage': instance.lockedMessage,
  'mealBalance': instance.mealBalance,
};

PlanningResponse _$PlanningResponseFromJson(Map<String, dynamic> json) =>
    PlanningResponse(
      json['version'] as String?,
      json['state'] as String?,
      (json['requiredMealCount'] as num?)?.toInt() ?? 0,
      (json['selectedTotalMealCount'] as num?)?.toInt() ?? 0,
      json['isExactCountSatisfied'] as bool? ?? false,
      json['confirmedAt'] as String?,
      json['confirmedByRole'] as String?,
    );

Map<String, dynamic> _$PlanningResponseToJson(PlanningResponse instance) =>
    <String, dynamic>{
      'version': instance.version,
      'state': instance.state,
      'requiredMealCount': instance.requiredMealCount,
      'selectedTotalMealCount': instance.selectedTotalMealCount,
      'isExactCountSatisfied': instance.isExactCountSatisfied,
      'confirmedAt': instance.confirmedAt,
      'confirmedByRole': instance.confirmedByRole,
    };

AddonSelectionResponse _$AddonSelectionResponseFromJson(
  Map<String, dynamic> json,
) => AddonSelectionResponse(
  json['addonId'] as String?,
  json['category'] as String?,
  json['status'] as String?,
  json['source'] as String?,
  json['name'] as String?,
  (json['priceHalala'] as num?)?.toInt(),
  json['currency'] as String?,
);

Map<String, dynamic> _$AddonSelectionResponseToJson(
  AddonSelectionResponse instance,
) => <String, dynamic>{
  'addonId': instance.addonId,
  'category': instance.category,
  'status': instance.status,
  'source': instance.source,
  'name': instance.name,
  'priceHalala': instance.priceHalala,
  'currency': instance.currency,
};

MealSlotResponse _$MealSlotResponseFromJson(Map<String, dynamic> json) =>
    MealSlotResponse(
      (json['slotIndex'] as num).toInt(),
      json['slotKey'] as String,
      json['status'] as String? ?? 'empty',
      json['proteinId'] as String?,
      (json['carbs'] as List<dynamic>?)
              ?.map(
                (e) => MealSlotCarbResponse.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          [],
      json['selectionType'] as String?,
      json['sandwichId'] as String?,
      MealSlotResponse._readSalad(json, 'salad') == null
          ? null
          : SaladResponse.fromJson(
            MealSlotResponse._readSalad(json, 'salad') as Map<String, dynamic>,
          ),
      json['isPremium'] as bool? ?? false,
      json['premiumSource'] as String? ?? 'none',
      json['premiumKey'] as String?,
      (json['premiumExtraFeeHalala'] as num?)?.toInt() ?? 0,
      json['proteinFamilyKey'] as String?,
    );

Map<String, dynamic> _$MealSlotResponseToJson(MealSlotResponse instance) =>
    <String, dynamic>{
      'slotIndex': instance.slotIndex,
      'slotKey': instance.slotKey,
      'status': instance.status,
      'proteinId': instance.proteinId,
      'carbs': instance.carbs,
      'selectionType': instance.selectionType,
      'sandwichId': instance.sandwichId,
      'salad': instance.salad,
      'isPremium': instance.isPremium,
      'premiumSource': instance.premiumSource,
      'premiumKey': instance.premiumKey,
      'premiumExtraFeeHalala': instance.premiumExtraFeeHalala,
      'proteinFamilyKey': instance.proteinFamilyKey,
    };

MealSlotCarbResponse _$MealSlotCarbResponseFromJson(
  Map<String, dynamic> json,
) => MealSlotCarbResponse(
  carbId: json['carbId'] as String,
  grams: (json['grams'] as num).toInt(),
);

Map<String, dynamic> _$MealSlotCarbResponseToJson(
  MealSlotCarbResponse instance,
) => <String, dynamic>{'carbId': instance.carbId, 'grams': instance.grams};

SaladResponse _$SaladResponseFromJson(Map<String, dynamic> json) =>
    SaladResponse(
      presetKey: json['presetKey'] as String?,
      groups:
          json['groups'] == null
              ? null
              : SaladGroupsResponse.fromJson(
                json['groups'] as Map<String, dynamic>,
              ),
    );

Map<String, dynamic> _$SaladResponseToJson(SaladResponse instance) =>
    <String, dynamic>{
      'presetKey': instance.presetKey,
      'groups': instance.groups,
    };

SaladGroupsResponse _$SaladGroupsResponseFromJson(
  Map<String, dynamic> json,
) => SaladGroupsResponse(
  leafyGreens:
      (json['leafy_greens'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      [],
  vegetables:
      (json['vegetables'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      [],
  protein:
      (json['protein'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      [],
  cheeseNuts:
      (json['cheese_nuts'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      [],
  fruits:
      (json['fruits'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      [],
  sauce:
      (json['sauce'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
);

Map<String, dynamic> _$SaladGroupsResponseToJson(
  SaladGroupsResponse instance,
) => <String, dynamic>{
  'leafy_greens': instance.leafyGreens,
  'vegetables': instance.vegetables,
  'protein': instance.protein,
  'cheese_nuts': instance.cheeseNuts,
  'fruits': instance.fruits,
  'sauce': instance.sauce,
};

PlannerMetaResponse _$PlannerMetaResponseFromJson(Map<String, dynamic> json) =>
    PlannerMetaResponse(
      (json['requiredSlotCount'] as num?)?.toInt() ?? 0,
      (json['emptySlotCount'] as num?)?.toInt() ?? 0,
      (json['partialSlotCount'] as num?)?.toInt() ?? 0,
      (json['completeSlotCount'] as num?)?.toInt() ?? 0,
      (json['premiumSlotCount'] as num?)?.toInt() ?? 0,
      (json['premiumPendingPaymentCount'] as num?)?.toInt() ?? 0,
      (json['premiumTotalHalala'] as num?)?.toInt() ?? 0,
      json['isDraftValid'] as bool? ?? true,
      json['isConfirmable'] as bool? ?? false,
    );

Map<String, dynamic> _$PlannerMetaResponseToJson(
  PlannerMetaResponse instance,
) => <String, dynamic>{
  'requiredSlotCount': instance.requiredSlotCount,
  'emptySlotCount': instance.emptySlotCount,
  'partialSlotCount': instance.partialSlotCount,
  'completeSlotCount': instance.completeSlotCount,
  'premiumSlotCount': instance.premiumSlotCount,
  'premiumPendingPaymentCount': instance.premiumPendingPaymentCount,
  'premiumTotalHalala': instance.premiumTotalHalala,
  'isDraftValid': instance.isDraftValid,
  'isConfirmable': instance.isConfirmable,
};

PaymentRequirementResponse _$PaymentRequirementResponseFromJson(
  Map<String, dynamic> json,
) => PaymentRequirementResponse(
  json['status'] as String? ?? 'satisfied',
  json['requiresPayment'] as bool? ?? false,
  (json['premiumSelectedCount'] as num?)?.toInt() ?? 0,
  (json['premiumPendingPaymentCount'] as num?)?.toInt() ?? 0,
  (json['addonSelectedCount'] as num?)?.toInt() ?? 0,
  (json['addonPendingPaymentCount'] as num?)?.toInt() ?? 0,
  (json['amountHalala'] as num?)?.toInt() ?? 0,
  (json['pendingAmountHalala'] as num?)?.toInt() ?? 0,
  json['currency'] as String? ?? 'SAR',
  json['pricingStatus'] as String? ?? 'not_required',
  json['pricingStatusLabel'] as String?,
  json['blockingReason'] as String?,
  json['blockingReasonLabel'] as String?,
  json['canCreatePayment'] as bool? ?? false,
);

Map<String, dynamic> _$PaymentRequirementResponseToJson(
  PaymentRequirementResponse instance,
) => <String, dynamic>{
  'status': instance.status,
  'requiresPayment': instance.requiresPayment,
  'premiumSelectedCount': instance.premiumSelectedCount,
  'premiumPendingPaymentCount': instance.premiumPendingPaymentCount,
  'addonSelectedCount': instance.addonSelectedCount,
  'addonPendingPaymentCount': instance.addonPendingPaymentCount,
  'amountHalala': instance.amountHalala,
  'pendingAmountHalala': instance.pendingAmountHalala,
  'currency': instance.currency,
  'pricingStatus': instance.pricingStatus,
  'pricingStatusLabel': instance.pricingStatusLabel,
  'blockingReason': instance.blockingReason,
  'blockingReasonLabel': instance.blockingReasonLabel,
  'canCreatePayment': instance.canCreatePayment,
};

PremiumExtraPaymentResponse _$PremiumExtraPaymentResponseFromJson(
  Map<String, dynamic> json,
) => PremiumExtraPaymentResponse(
  paymentStatus: json['paymentStatus'] as String?,
  amountHalala: (json['amountHalala'] as num?)?.toInt(),
  currency: json['currency'] as String?,
);

Map<String, dynamic> _$PremiumExtraPaymentResponseToJson(
  PremiumExtraPaymentResponse instance,
) => <String, dynamic>{
  'paymentStatus': instance.paymentStatus,
  'amountHalala': instance.amountHalala,
  'currency': instance.currency,
};

DayRulesResponse _$DayRulesResponseFromJson(Map<String, dynamic> json) =>
    DayRulesResponse(
      version: json['version'] as String?,
      beef:
          json['beef'] == null
              ? null
              : DayBeefRuleResponse.fromJson(
                json['beef'] as Map<String, dynamic>,
              ),
      maxCarbItemsPerMeal: (json['maxCarbItemsPerMeal'] as num?)?.toInt(),
      maxCarbTotalGrams: (json['maxCarbTotalGrams'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DayRulesResponseToJson(DayRulesResponse instance) =>
    <String, dynamic>{
      'version': instance.version,
      'beef': instance.beef,
      'maxCarbItemsPerMeal': instance.maxCarbItemsPerMeal,
      'maxCarbTotalGrams': instance.maxCarbTotalGrams,
    };

DayBeefRuleResponse _$DayBeefRuleResponseFromJson(Map<String, dynamic> json) =>
    DayBeefRuleResponse(
      proteinFamilyKey: json['proteinFamilyKey'] as String?,
      maxSlotsPerDay: (json['maxSlotsPerDay'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DayBeefRuleResponseToJson(
  DayBeefRuleResponse instance,
) => <String, dynamic>{
  'proteinFamilyKey': instance.proteinFamilyKey,
  'maxSlotsPerDay': instance.maxSlotsPerDay,
};
