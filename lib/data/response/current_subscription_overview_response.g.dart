// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_subscription_overview_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealBalanceResponse _$MealBalanceResponseFromJson(Map<String, dynamic> json) =>
    MealBalanceResponse(
      totalMeals: (json['totalMeals'] as num?)?.toInt(),
      remainingMeals: (json['remainingMeals'] as num?)?.toInt(),
      consumedMeals: (json['consumedMeals'] as num?)?.toInt(),
      canConsumeNow: json['canConsumeNow'] as bool?,
      maxConsumableMealsNow: (json['maxConsumableMealsNow'] as num?)?.toInt(),
      mealBalancePolicy: json['mealBalancePolicy'] as String?,
      dailyMealLimitEnforced: json['dailyMealLimitEnforced'] as bool?,
      dailyMealsDefault: (json['dailyMealsDefault'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MealBalanceResponseToJson(
  MealBalanceResponse instance,
) => <String, dynamic>{
  'totalMeals': instance.totalMeals,
  'remainingMeals': instance.remainingMeals,
  'consumedMeals': instance.consumedMeals,
  'canConsumeNow': instance.canConsumeNow,
  'maxConsumableMealsNow': instance.maxConsumableMealsNow,
  'mealBalancePolicy': instance.mealBalancePolicy,
  'dailyMealLimitEnforced': instance.dailyMealLimitEnforced,
  'dailyMealsDefault': instance.dailyMealsDefault,
};

MetaResponse _$MetaResponseFromJson(Map<String, dynamic> json) =>
    MetaResponse(json['testScenario'] as String?);

Map<String, dynamic> _$MetaResponseToJson(MetaResponse instance) =>
    <String, dynamic>{'testScenario': instance.testScenario};

ContractResponse _$ContractResponseFromJson(Map<String, dynamic> json) =>
    ContractResponse(
      json['isCanonical'] as bool?,
      json['isGrandfathered'] as bool?,
      json['version'] as String?,
    );

Map<String, dynamic> _$ContractResponseToJson(ContractResponse instance) =>
    <String, dynamic>{
      'isCanonical': instance.isCanonical,
      'isGrandfathered': instance.isGrandfathered,
      'version': instance.version,
    };

PickupPreparationResponse _$PickupPreparationResponseFromJson(
  Map<String, dynamic> json,
) => PickupPreparationResponse(
  json['flowStatus'] as String?,
  json['reason'] as String?,
  json['buttonLabel'] as String?,
  json['message'] as String?,
  json['canRequestPrepare'] as bool?,
  json['canBePrepared'] as bool?,
  json['planningReady'] as bool?,
  json['showMealPlannerCta'] as bool?,
  json['mealPlannerCtaLabelAr'] as String?,
  json['mealPlannerCtaLabelEn'] as String?,
  json['messageAr'] as String?,
  json['messageEn'] as String?,
  json['businessDate'] as String?,
  json['pickupRequested'] as bool?,
  json['pickupPrepared'] as bool?,
);

Map<String, dynamic> _$PickupPreparationResponseToJson(
  PickupPreparationResponse instance,
) => <String, dynamic>{
  'flowStatus': instance.flowStatus,
  'reason': instance.reason,
  'buttonLabel': instance.buttonLabel,
  'message': instance.message,
  'canRequestPrepare': instance.canRequestPrepare,
  'canBePrepared': instance.canBePrepared,
  'planningReady': instance.planningReady,
  'showMealPlannerCta': instance.showMealPlannerCta,
  'mealPlannerCtaLabelAr': instance.mealPlannerCtaLabelAr,
  'mealPlannerCtaLabelEn': instance.mealPlannerCtaLabelEn,
  'messageAr': instance.messageAr,
  'messageEn': instance.messageEn,
  'businessDate': instance.businessDate,
  'pickupRequested': instance.pickupRequested,
  'pickupPrepared': instance.pickupPrepared,
};

OverviewDeliverySlotResponse _$OverviewDeliverySlotResponseFromJson(
  Map<String, dynamic> json,
) => OverviewDeliverySlotResponse(
  json['slotId'] as String?,
  json['type'] as String?,
  json['window'] as String?,
  json['label'] as String?,
);

Map<String, dynamic> _$OverviewDeliverySlotResponseToJson(
  OverviewDeliverySlotResponse instance,
) => <String, dynamic>{
  'slotId': instance.slotId,
  'type': instance.type,
  'window': instance.window,
  'label': instance.label,
};

OverviewAddressSummaryResponse _$OverviewAddressSummaryResponseFromJson(
  Map<String, dynamic> json,
) => OverviewAddressSummaryResponse(
  json['label'] as String?,
  json['line1'] as String?,
  json['line2'] as String?,
  json['city'] as String?,
  json['district'] as String?,
  json['zoneName'] as String?,
  json['formatted'] as String?,
  json['street'] as String?,
  json['building'] as String?,
  json['apartment'] as String?,
  json['notes'] as String?,
);

Map<String, dynamic> _$OverviewAddressSummaryResponseToJson(
  OverviewAddressSummaryResponse instance,
) => <String, dynamic>{
  'label': instance.label,
  'line1': instance.line1,
  'line2': instance.line2,
  'city': instance.city,
  'district': instance.district,
  'zoneName': instance.zoneName,
  'formatted': instance.formatted,
  'street': instance.street,
  'building': instance.building,
  'apartment': instance.apartment,
  'notes': instance.notes,
};

OverviewPickupLocationSummaryResponse
_$OverviewPickupLocationSummaryResponseFromJson(Map<String, dynamic> json) =>
    OverviewPickupLocationSummaryResponse(
      json['id'] as String?,
      json['_id'] as String?,
      json['name'] as String?,
      OverviewPickupLocationSummaryResponse._readAddress(json, 'address')
          as String?,
      json['phone'] as String?,
      json['city'] as String?,
      json['district'] as String?,
      json['workingHours'] as String?,
      (json['latitude'] as num?)?.toDouble(),
      (json['longitude'] as num?)?.toDouble(),
      json['mapUrl'] as String?,
    );

Map<String, dynamic> _$OverviewPickupLocationSummaryResponseToJson(
  OverviewPickupLocationSummaryResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  '_id': instance.rawId,
  'name': instance.name,
  'address': instance.address,
  'phone': instance.phone,
  'city': instance.city,
  'district': instance.district,
  'workingHours': instance.workingHours,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'mapUrl': instance.mapUrl,
};

OverviewDeliveryWindowSummaryResponse
_$OverviewDeliveryWindowSummaryResponseFromJson(Map<String, dynamic> json) =>
    OverviewDeliveryWindowSummaryResponse(
      json['from'] as String?,
      json['to'] as String?,
      json['label'] as String?,
    );

Map<String, dynamic> _$OverviewDeliveryWindowSummaryResponseToJson(
  OverviewDeliveryWindowSummaryResponse instance,
) => <String, dynamic>{
  'from': instance.from,
  'to': instance.to,
  'label': instance.label,
};

OverviewFulfillmentSummaryResponse _$OverviewFulfillmentSummaryResponseFromJson(
  Map<String, dynamic> json,
) => OverviewFulfillmentSummaryResponse(
  json['mode'] as String?,
  json['title'] as String?,
  json['status'] as String?,
  json['statusLabel'] as String?,
  json['message'] as String?,
  json['nextAction'] as String?,
  json['isEditable'] as bool?,
  json['isFulfillable'] as bool?,
  json['planningReady'] as bool?,
  json['fulfillmentReady'] as bool?,
  json['lockedReason'] as String?,
  json['lockedMessage'] as String?,
);

Map<String, dynamic> _$OverviewFulfillmentSummaryResponseToJson(
  OverviewFulfillmentSummaryResponse instance,
) => <String, dynamic>{
  'mode': instance.mode,
  'title': instance.title,
  'status': instance.status,
  'statusLabel': instance.statusLabel,
  'message': instance.message,
  'nextAction': instance.nextAction,
  'isEditable': instance.isEditable,
  'isFulfillable': instance.isFulfillable,
  'planningReady': instance.planningReady,
  'fulfillmentReady': instance.fulfillmentReady,
  'lockedReason': instance.lockedReason,
  'lockedMessage': instance.lockedMessage,
};

AddonSubscriptionResponse _$AddonSubscriptionResponseFromJson(
  Map<String, dynamic> json,
) => AddonSubscriptionResponse(
  json['addonId'] as String?,
  json['category'] as String?,
  (json['includedCount'] as num?)?.toInt(),
  (json['maxPerDay'] as num?)?.toInt(),
  json['status'] as String?,
);

Map<String, dynamic> _$AddonSubscriptionResponseToJson(
  AddonSubscriptionResponse instance,
) => <String, dynamic>{
  'addonId': instance.addonId,
  'category': instance.category,
  'includedCount': instance.includedCount,
  'maxPerDay': instance.maxPerDay,
  'status': instance.status,
};

PremiumSummaryResponse _$PremiumSummaryResponseFromJson(
  Map<String, dynamic> json,
) => PremiumSummaryResponse(
  json['premiumMealId'] as String?,
  json['premiumKey'] as String?,
  json['name'] as String?,
  (json['purchasedQtyTotal'] as num?)?.toInt(),
  (json['remainingQtyTotal'] as num?)?.toInt(),
  (json['consumedQtyTotal'] as num?)?.toInt(),
);

Map<String, dynamic> _$PremiumSummaryResponseToJson(
  PremiumSummaryResponse instance,
) => <String, dynamic>{
  'premiumMealId': instance.premiumMealId,
  'premiumKey': instance.premiumKey,
  'name': instance.name,
  'purchasedQtyTotal': instance.purchasedQtyTotal,
  'remainingQtyTotal': instance.remainingQtyTotal,
  'consumedQtyTotal': instance.consumedQtyTotal,
};

AddonSummaryResponse _$AddonSummaryResponseFromJson(
  Map<String, dynamic> json,
) => AddonSummaryResponse(
  json['addonId'] as String?,
  json['name'] as String?,
  (json['purchasedQtyTotal'] as num?)?.toInt(),
  (json['remainingQtyTotal'] as num?)?.toInt(),
  (json['consumedQtyTotal'] as num?)?.toInt(),
);

Map<String, dynamic> _$AddonSummaryResponseToJson(
  AddonSummaryResponse instance,
) => <String, dynamic>{
  'addonId': instance.addonId,
  'name': instance.name,
  'purchasedQtyTotal': instance.purchasedQtyTotal,
  'remainingQtyTotal': instance.remainingQtyTotal,
  'consumedQtyTotal': instance.consumedQtyTotal,
};

CurrentSubscriptionOverviewDataResponse
_$CurrentSubscriptionOverviewDataResponseFromJson(
  Map<String, dynamic> json,
) => CurrentSubscriptionOverviewDataResponse(
  json['_id'] as String?,
  json['businessDate'] as String?,
  json['status'] as String?,
  json['startDate'] as String?,
  json['endDate'] as String?,
  (json['totalMeals'] as num?)?.toInt(),
  (json['remainingMeals'] as num?)?.toInt(),
  (json['premiumRemaining'] as num?)?.toInt(),
  (json['addonSubscriptions'] as List<dynamic>?)
      ?.map(
        (e) => AddonSubscriptionResponse.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  (json['selectedMealsPerDay'] as num?)?.toInt(),
  json['deliveryMode'] as String?,
  (json['premiumSummary'] as List<dynamic>?)
      ?.map((e) => PremiumSummaryResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
  (json['addonsSummary'] as List<dynamic>?)
      ?.map((e) => AddonSummaryResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
  json['statusLabel'] as String?,
  json['deliveryModeLabel'] as String?,
  json['deliveryWindowLegacy'] as String?,
  json['pickupLocationId'] as String?,
  json['validityEndDate'] as String?,
  (json['skipDaysUsed'] as num?)?.toInt(),
  (json['skipDaysLimit'] as num?)?.toInt(),
  (json['remainingSkipDays'] as num?)?.toInt(),
  json['meta'] == null
      ? null
      : MetaResponse.fromJson(json['meta'] as Map<String, dynamic>),
  json['contract'] == null
      ? null
      : ContractResponse.fromJson(json['contract'] as Map<String, dynamic>),
  json['pickupPreparation'] == null
      ? null
      : PickupPreparationResponse.fromJson(
        json['pickupPreparation'] as Map<String, dynamic>,
      ),
  json['deliverySlot'] == null
      ? null
      : OverviewDeliverySlotResponse.fromJson(
        json['deliverySlot'] as Map<String, dynamic>,
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
  json['pickupLocation'] == null
      ? null
      : OverviewPickupLocationSummaryResponse.fromJson(
        json['pickupLocation'] as Map<String, dynamic>,
      ),
  json['fulfillmentSummary'] == null
      ? null
      : OverviewFulfillmentSummaryResponse.fromJson(
        json['fulfillmentSummary'] as Map<String, dynamic>,
      ),
  json['mealBalance'] == null
      ? null
      : MealBalanceResponse.fromJson(
        json['mealBalance'] as Map<String, dynamic>,
      ),
);

Map<String, dynamic> _$CurrentSubscriptionOverviewDataResponseToJson(
  CurrentSubscriptionOverviewDataResponse instance,
) => <String, dynamic>{
  '_id': instance.id,
  'businessDate': instance.businessDate,
  'status': instance.status,
  'startDate': instance.startDate,
  'endDate': instance.endDate,
  'totalMeals': instance.totalMeals,
  'remainingMeals': instance.remainingMeals,
  'premiumRemaining': instance.premiumRemaining,
  'addonSubscriptions': instance.addonSubscriptions,
  'selectedMealsPerDay': instance.selectedMealsPerDay,
  'deliveryMode': instance.deliveryMode,
  'premiumSummary': instance.premiumSummary,
  'addonsSummary': instance.addonsSummary,
  'statusLabel': instance.statusLabel,
  'deliveryModeLabel': instance.deliveryModeLabel,
  'deliveryWindowLegacy': instance.deliveryWindow,
  'pickupLocationId': instance.pickupLocationId,
  'validityEndDate': instance.validityEndDate,
  'skipDaysUsed': instance.skipDaysUsed,
  'skipDaysLimit': instance.skipDaysLimit,
  'remainingSkipDays': instance.remainingSkipDays,
  'meta': instance.meta,
  'contract': instance.contract,
  'pickupPreparation': instance.pickupPreparation,
  'deliverySlot': instance.deliverySlot,
  'deliveryAddress': instance.deliveryAddress,
  'deliveryWindow': instance.deliveryWindowSummary,
  'pickupLocation': instance.pickupLocation,
  'fulfillmentSummary': instance.fulfillmentSummary,
  'mealBalance': instance.mealBalance,
};

CurrentSubscriptionOverviewResponse
_$CurrentSubscriptionOverviewResponseFromJson(Map<String, dynamic> json) =>
    CurrentSubscriptionOverviewResponse(
        json['data'] == null
            ? null
            : CurrentSubscriptionOverviewDataResponse.fromJson(
              json['data'] as Map<String, dynamic>,
            ),
      )
      ..status = json['status']
      ..message = json['message'] as String?;

Map<String, dynamic> _$CurrentSubscriptionOverviewResponseToJson(
  CurrentSubscriptionOverviewResponse instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};
