import 'package:json_annotation/json_annotation.dart';
import 'package:basic_diet/data/response/base_response/base_response.dart';

part 'current_subscription_overview_response.g.dart';

/// Response DTO for the additive mealBalance object introduced by the
/// TOTAL_BALANCE_WITHIN_VALIDITY backend policy.
/// All fields are nullable for backward compatibility with old payloads.
@JsonSerializable()
class MealBalanceResponse {
  @JsonKey(name: 'totalMeals')
  final int? totalMeals;

  @JsonKey(name: 'remainingMeals')
  final int? remainingMeals;

  @JsonKey(name: 'consumedMeals')
  final int? consumedMeals;

  @JsonKey(name: 'canConsumeNow')
  final bool? canConsumeNow;

  @JsonKey(name: 'maxConsumableMealsNow')
  final int? maxConsumableMealsNow;

  @JsonKey(name: 'mealBalancePolicy')
  final String? mealBalancePolicy;

  @JsonKey(name: 'dailyMealLimitEnforced')
  final bool? dailyMealLimitEnforced;

  @JsonKey(name: 'dailyMealsDefault')
  final int? dailyMealsDefault;

  const MealBalanceResponse({
    this.totalMeals,
    this.remainingMeals,
    this.consumedMeals,
    this.canConsumeNow,
    this.maxConsumableMealsNow,
    this.mealBalancePolicy,
    this.dailyMealLimitEnforced,
    this.dailyMealsDefault,
  });

  factory MealBalanceResponse.fromJson(Map<String, dynamic> json) =>
      _$MealBalanceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MealBalanceResponseToJson(this);
}

Object? readDeliveryWindowSummary(Map json, String key) {
  final value = json[key];
  if (value is Map<String, dynamic>) return value;
  if (value is Map) return Map<String, dynamic>.from(value);
  if (value is String && value.trim().isNotEmpty) {
    return <String, dynamic>{'from': '', 'to': '', 'label': value};
  }
  return null;
}

@JsonSerializable()
class MetaResponse {
  @JsonKey(name: "testScenario")
  String? testScenario;

  MetaResponse(this.testScenario);

  factory MetaResponse.fromJson(Map<String, dynamic> json) =>
      _$MetaResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MetaResponseToJson(this);
}

@JsonSerializable()
class ContractResponse {
  @JsonKey(name: "isCanonical")
  bool? isCanonical;
  @JsonKey(name: "isGrandfathered")
  bool? isGrandfathered;
  @JsonKey(name: "version")
  String? version;

  ContractResponse(this.isCanonical, this.isGrandfathered, this.version);

  factory ContractResponse.fromJson(Map<String, dynamic> json) =>
      _$ContractResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ContractResponseToJson(this);
}

@JsonSerializable()
class PickupPreparationResponse {
  @JsonKey(name: "flowStatus")
  String? flowStatus;
  @JsonKey(name: "reason")
  String? reason;
  @JsonKey(name: "buttonLabel")
  String? buttonLabel;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "canRequestPrepare")
  bool? canRequestPrepare;
  @JsonKey(name: "canBePrepared")
  bool? canBePrepared;
  @JsonKey(name: "planningReady")
  bool? planningReady;
  @JsonKey(name: "showMealPlannerCta")
  bool? showMealPlannerCta;
  @JsonKey(name: "mealPlannerCtaLabelAr")
  String? mealPlannerCtaLabelAr;
  @JsonKey(name: "mealPlannerCtaLabelEn")
  String? mealPlannerCtaLabelEn;
  @JsonKey(name: "messageAr")
  String? messageAr;
  @JsonKey(name: "messageEn")
  String? messageEn;
  @JsonKey(name: "businessDate")
  String? businessDate;
  @JsonKey(name: "pickupRequested")
  bool? pickupRequested;
  @JsonKey(name: "pickupPrepared")
  bool? pickupPrepared;

  PickupPreparationResponse(
    this.flowStatus,
    this.reason,
    this.buttonLabel,
    this.message,
    this.canRequestPrepare,
    this.canBePrepared,
    this.planningReady,
    this.showMealPlannerCta,
    this.mealPlannerCtaLabelAr,
    this.mealPlannerCtaLabelEn,
    this.messageAr,
    this.messageEn,
    this.businessDate,
    this.pickupRequested,
    this.pickupPrepared,
  );

  factory PickupPreparationResponse.fromJson(Map<String, dynamic> json) =>
      _$PickupPreparationResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PickupPreparationResponseToJson(this);
}

@JsonSerializable()
class OverviewDeliverySlotResponse {
  @JsonKey(name: "slotId")
  String? slotId;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "window")
  String? window;
  @JsonKey(name: "label")
  String? label;

  OverviewDeliverySlotResponse(this.slotId, this.type, this.window, [this.label]);

  factory OverviewDeliverySlotResponse.fromJson(Map<String, dynamic> json) =>
      _$OverviewDeliverySlotResponseFromJson(json);
  Map<String, dynamic> toJson() => _$OverviewDeliverySlotResponseToJson(this);
}

@JsonSerializable()
class OverviewAddressSummaryResponse {
  @JsonKey(name: "label")
  String? label;
  @JsonKey(name: "line1")
  String? line1;
  @JsonKey(name: "line2")
  String? line2;
  @JsonKey(name: "city")
  String? city;
  @JsonKey(name: "district")
  String? district;
  @JsonKey(name: "zoneName")
  String? zoneName;
  @JsonKey(name: "formatted")
  String? formatted;
  @JsonKey(name: "street")
  String? street;
  @JsonKey(name: "building")
  String? building;
  @JsonKey(name: "apartment")
  String? apartment;
  @JsonKey(name: "notes")
  String? notes;

  OverviewAddressSummaryResponse(
    this.label,
    this.line1,
    this.line2,
    this.city,
    this.district,
    this.zoneName,
    this.formatted,
    this.street,
    this.building,
    this.apartment,
    this.notes,
  );

  factory OverviewAddressSummaryResponse.fromJson(Map<String, dynamic> json) =>
      _$OverviewAddressSummaryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OverviewAddressSummaryResponseToJson(this);
}

@JsonSerializable()
class OverviewPickupLocationSummaryResponse {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "_id")
  String? rawId;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "address", readValue: _readAddress)
  String? address;
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "city")
  String? city;
  @JsonKey(name: "district")
  String? district;
  @JsonKey(name: "workingHours")
  String? workingHours;
  @JsonKey(name: "latitude")
  double? latitude;
  @JsonKey(name: "longitude")
  double? longitude;
  @JsonKey(name: "mapUrl")
  String? mapUrl;

  OverviewPickupLocationSummaryResponse(
    this.id,
    this.rawId,
    this.name,
    this.address,
    this.phone,
    this.city,
    this.district,
    this.workingHours,
    this.latitude,
    this.longitude,
    this.mapUrl,
  );

  static Object? _readAddress(Map json, String key) {
    final value = json[key];
    if (value is String) return value;
    if (value is Map) {
      return [
        value['line1'],
        value['line2'],
        value['district'],
        value['city'],
      ].whereType<String>().where((part) => part.trim().isNotEmpty).join(' - ');
    }
    return null;
  }

  factory OverviewPickupLocationSummaryResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$OverviewPickupLocationSummaryResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$OverviewPickupLocationSummaryResponseToJson(this);
}

@JsonSerializable()
class OverviewDeliveryWindowSummaryResponse {
  @JsonKey(name: "from")
  String? from;
  @JsonKey(name: "to")
  String? to;
  @JsonKey(name: "label")
  String? label;

  OverviewDeliveryWindowSummaryResponse(this.from, this.to, this.label);

  factory OverviewDeliveryWindowSummaryResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$OverviewDeliveryWindowSummaryResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$OverviewDeliveryWindowSummaryResponseToJson(this);
}

@JsonSerializable()
class OverviewFulfillmentSummaryResponse {
  @JsonKey(name: "mode")
  String? mode;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "statusLabel")
  String? statusLabel;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "nextAction")
  String? nextAction;
  @JsonKey(name: "isEditable")
  bool? isEditable;
  @JsonKey(name: "isFulfillable")
  bool? isFulfillable;
  @JsonKey(name: "planningReady")
  bool? planningReady;
  @JsonKey(name: "fulfillmentReady")
  bool? fulfillmentReady;
  @JsonKey(name: "lockedReason")
  String? lockedReason;
  @JsonKey(name: "lockedMessage")
  String? lockedMessage;

  OverviewFulfillmentSummaryResponse(
    this.mode,
    this.title,
    this.status,
    this.statusLabel,
    this.message,
    this.nextAction,
    this.isEditable,
    this.isFulfillable,
    this.planningReady,
    this.fulfillmentReady,
    this.lockedReason,
    this.lockedMessage,
  );

  factory OverviewFulfillmentSummaryResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$OverviewFulfillmentSummaryResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$OverviewFulfillmentSummaryResponseToJson(this);
}

@JsonSerializable()
class AddonSubscriptionResponse {
  @JsonKey(name: "addonId")
  String? addonId;
  @JsonKey(name: "category")
  String? category;
  @JsonKey(name: "includedCount")
  int? includedCount;
  @JsonKey(name: "maxPerDay")
  int? maxPerDay;
  @JsonKey(name: "status")
  String? status;

  AddonSubscriptionResponse(
    this.addonId,
    this.category,
    this.includedCount,
    this.maxPerDay,
    this.status,
  );

  factory AddonSubscriptionResponse.fromJson(Map<String, dynamic> json) =>
      _$AddonSubscriptionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddonSubscriptionResponseToJson(this);
}

@JsonSerializable()
class PremiumSummaryResponse {
  @JsonKey(name: "premiumMealId")
  String? premiumMealId;
  @JsonKey(name: "premiumKey")
  String? premiumKey;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "purchasedQtyTotal")
  int? purchasedQtyTotal;
  @JsonKey(name: "remainingQtyTotal")
  int? remainingQtyTotal;
  @JsonKey(name: "consumedQtyTotal")
  int? consumedQtyTotal;

  PremiumSummaryResponse(
    this.premiumMealId,
    this.premiumKey,
    this.name,
    this.purchasedQtyTotal,
    this.remainingQtyTotal,
    this.consumedQtyTotal,
  );

  factory PremiumSummaryResponse.fromJson(Map<String, dynamic> json) =>
      _$PremiumSummaryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PremiumSummaryResponseToJson(this);
}

@JsonSerializable()
class AddonSummaryResponse {
  @JsonKey(name: "addonId")
  String? addonId;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "purchasedQtyTotal")
  int? purchasedQtyTotal;
  @JsonKey(name: "remainingQtyTotal")
  int? remainingQtyTotal;
  @JsonKey(name: "consumedQtyTotal")
  int? consumedQtyTotal;

  AddonSummaryResponse(
    this.addonId,
    this.name,
    this.purchasedQtyTotal,
    this.remainingQtyTotal,
    this.consumedQtyTotal,
  );

  factory AddonSummaryResponse.fromJson(Map<String, dynamic> json) =>
      _$AddonSummaryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddonSummaryResponseToJson(this);
}

@JsonSerializable()
class CurrentSubscriptionOverviewDataResponse {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "businessDate")
  String? businessDate;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "startDate")
  String? startDate;
  @JsonKey(name: "endDate")
  String? endDate;
  @JsonKey(name: "totalMeals")
  int? totalMeals;
  @JsonKey(name: "remainingMeals")
  int? remainingMeals;
  @JsonKey(name: "premiumRemaining")
  int? premiumRemaining;
  @JsonKey(name: "addonSubscriptions")
  List<AddonSubscriptionResponse>? addonSubscriptions;
  @JsonKey(name: "selectedMealsPerDay")
  int? selectedMealsPerDay;
  @JsonKey(name: "deliveryMode")
  String? deliveryMode;
  @JsonKey(name: "premiumSummary")
  List<PremiumSummaryResponse>? premiumSummary;
  @JsonKey(name: "addonsSummary")
  List<AddonSummaryResponse>? addonsSummary;
  @JsonKey(name: "statusLabel")
  String? statusLabel;
  @JsonKey(name: "deliveryModeLabel")
  String? deliveryModeLabel;
  @JsonKey(name: "deliveryWindowLegacy")
  String? deliveryWindow;
  @JsonKey(name: "pickupLocationId")
  String? pickupLocationId;
  @JsonKey(name: "validityEndDate")
  String? validityEndDate;
  @JsonKey(name: "skipDaysUsed")
  int? skipDaysUsed;
  @JsonKey(name: "skipDaysLimit")
  int? skipDaysLimit;
  @JsonKey(name: "remainingSkipDays")
  int? remainingSkipDays;
  @JsonKey(name: "meta")
  MetaResponse? meta;
  @JsonKey(name: "contract")
  ContractResponse? contract;
  @JsonKey(name: "pickupPreparation")
  PickupPreparationResponse? pickupPreparation;
  @JsonKey(name: "deliverySlot")
  OverviewDeliverySlotResponse? deliverySlot;
  @JsonKey(name: "deliveryAddress")
  OverviewAddressSummaryResponse? deliveryAddress;
  @JsonKey(name: "deliveryWindow", readValue: readDeliveryWindowSummary)
  OverviewDeliveryWindowSummaryResponse? deliveryWindowSummary;
  @JsonKey(name: "pickupLocation")
  OverviewPickupLocationSummaryResponse? pickupLocation;
  @JsonKey(name: "fulfillmentSummary")
  OverviewFulfillmentSummaryResponse? fulfillmentSummary;
  @JsonKey(name: "mealBalance")
  MealBalanceResponse? mealBalance;

  CurrentSubscriptionOverviewDataResponse(
    this.id,
    this.businessDate,
    this.status,
    this.startDate,
    this.endDate,
    this.totalMeals,
    this.remainingMeals,
    this.premiumRemaining,
    this.addonSubscriptions,
    this.selectedMealsPerDay,
    this.deliveryMode,
    this.premiumSummary,
    this.addonsSummary,
    this.statusLabel,
    this.deliveryModeLabel,
    this.deliveryWindow,
    this.pickupLocationId,
    this.validityEndDate,
    this.skipDaysUsed,
    this.skipDaysLimit,
    this.remainingSkipDays,
    this.meta,
    this.contract,
    this.pickupPreparation,
    this.deliverySlot,
    this.deliveryAddress,
    this.deliveryWindowSummary,
    this.pickupLocation,
    this.fulfillmentSummary, [
    this.mealBalance,
  ]);

  factory CurrentSubscriptionOverviewDataResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$CurrentSubscriptionOverviewDataResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CurrentSubscriptionOverviewDataResponseToJson(this);

}

@JsonSerializable()
class CurrentSubscriptionOverviewResponse extends BaseResponse {
  @JsonKey(name: "data")
  CurrentSubscriptionOverviewDataResponse? data;

  CurrentSubscriptionOverviewResponse(this.data);

  factory CurrentSubscriptionOverviewResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$CurrentSubscriptionOverviewResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$CurrentSubscriptionOverviewResponseToJson(this);
}
