import 'package:json_annotation/json_annotation.dart';
import 'package:basic_diet/data/response/current_subscription_overview_response.dart';

part 'subscription_day_response.g.dart';

@JsonSerializable(createFactory: false)
class SubscriptionDayResponse {
  final bool? status;

  @JsonKey(name: 'data')
  final SubscriptionDayData? data;

  SubscriptionDayResponse(this.status, this.data);

  factory SubscriptionDayResponse.fromJson(Map<String, dynamic> json) {
    bool? top;
    if (json['status'] is bool) {
      top = json['status'] as bool;
    } else if (json['ok'] is bool) {
      top = json['ok'] as bool;
    } else if (json['status'] is int) {
      top = json['status'] >= 200 && json['status'] < 300;
    }
    top ??= false;

    return SubscriptionDayResponse(
      top,
      json['data'] == null
          ? null
          : SubscriptionDayData.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => _$SubscriptionDayResponseToJson(this);
}

@JsonSerializable()
class SubscriptionDayData {
  @JsonKey(name: 'date')
  final String date;

  @JsonKey(name: 'status')
  final String status;

  @JsonKey(name: 'plannerState')
  final String? plannerState;

  @JsonKey(name: 'commercialState')
  final String? commercialState;

  @JsonKey(name: 'plannerRevisionHash')
  final String? plannerRevisionHash;

  @JsonKey(name: 'mealSlots', defaultValue: [])
  final List<MealSlotResponse> mealSlots;

  @JsonKey(name: 'addonSelections', defaultValue: [])
  final List<AddonSelectionResponse> addonSelections;

  @JsonKey(name: 'plannerMeta')
  final PlannerMetaResponse? plannerMeta;

  @JsonKey(name: 'planning')
  final PlanningResponse? planning;

  @JsonKey(name: 'paymentRequirement')
  final PaymentRequirementResponse? paymentRequirement;

  @JsonKey(name: 'premiumExtraPayment')
  final PremiumExtraPaymentResponse? premiumExtraPayment;

  @JsonKey(name: 'rules')
  final DayRulesResponse? rules;

  @JsonKey(name: 'pickupLocation')
  final OverviewPickupLocationSummaryResponse? pickupLocation;

  @JsonKey(name: 'deliveryAddress')
  final OverviewAddressSummaryResponse? deliveryAddress;

  @JsonKey(name: 'deliveryWindow', readValue: readDeliveryWindowSummary)
  final OverviewDeliveryWindowSummaryResponse? deliveryWindow;

  @JsonKey(name: 'fulfillmentSummary')
  final OverviewFulfillmentSummaryResponse? fulfillmentSummary;

  @JsonKey(name: 'lockedReason')
  final String? lockedReason;

  @JsonKey(name: 'lockedMessage')
  final String? lockedMessage;

  SubscriptionDayData(
    this.date,
    this.status,
    this.plannerState,
    this.commercialState,
    this.plannerRevisionHash,
    this.mealSlots,
    this.addonSelections,
    this.plannerMeta,
    this.planning,
    this.paymentRequirement,
    this.premiumExtraPayment,
    this.rules,
    this.pickupLocation,
    this.deliveryAddress,
    this.deliveryWindow,
    this.fulfillmentSummary,
    this.lockedReason,
    this.lockedMessage,
  );

  factory SubscriptionDayData.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionDayDataFromJson(json);

  Map<String, dynamic> toJson() => _$SubscriptionDayDataToJson(this);
}

@JsonSerializable()
class PlanningResponse {
  @JsonKey(name: 'version')
  final String? version;

  @JsonKey(name: 'state')
  final String? state;

  @JsonKey(name: 'requiredMealCount', defaultValue: 0)
  final int requiredMealCount;

  @JsonKey(name: 'selectedTotalMealCount', defaultValue: 0)
  final int selectedTotalMealCount;

  @JsonKey(name: 'isExactCountSatisfied', defaultValue: false)
  final bool isExactCountSatisfied;

  @JsonKey(name: 'confirmedAt')
  final String? confirmedAt;

  @JsonKey(name: 'confirmedByRole')
  final String? confirmedByRole;

  PlanningResponse(
    this.version,
    this.state,
    this.requiredMealCount,
    this.selectedTotalMealCount,
    this.isExactCountSatisfied,
    this.confirmedAt,
    this.confirmedByRole,
  );

  factory PlanningResponse.fromJson(Map<String, dynamic> json) =>
      _$PlanningResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PlanningResponseToJson(this);
}

@JsonSerializable()
class AddonSelectionResponse {
  @JsonKey(name: 'addonId')
  final String? addonId;

  @JsonKey(name: 'category')
  final String? category;

  @JsonKey(name: 'status')
  final String? status;

  @JsonKey(name: 'source')
  final String? source;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'priceHalala')
  final int? priceHalala;

  @JsonKey(name: 'currency')
  final String? currency;

  AddonSelectionResponse(
    this.addonId,
    this.category,
    this.status,
    this.source,
    this.name,
    this.priceHalala,
    this.currency,
  );

  factory AddonSelectionResponse.fromJson(Map<String, dynamic> json) =>
      _$AddonSelectionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddonSelectionResponseToJson(this);
}

@JsonSerializable()
class MealSlotResponse {
  @JsonKey(name: 'slotIndex')
  final int slotIndex;

  @JsonKey(name: 'slotKey')
  final String slotKey;

  @JsonKey(name: 'status', defaultValue: 'empty')
  final String status;

  @JsonKey(name: 'proteinId')
  final String? proteinId;

  @JsonKey(name: 'carbs', defaultValue: [])
  final List<MealSlotCarbResponse> carbs;

  @JsonKey(name: 'selectionType')
  final String? selectionType;

  @JsonKey(name: 'sandwichId')
  final String? sandwichId;

  @JsonKey(name: 'salad', readValue: _readSalad)
  final SaladResponse? salad;

  @JsonKey(name: 'isPremium', defaultValue: false)
  final bool isPremium;

  @JsonKey(name: 'premiumSource', defaultValue: 'none')
  final String premiumSource;

  @JsonKey(name: 'premiumKey')
  final String? premiumKey;

  @JsonKey(name: 'premiumExtraFeeHalala', defaultValue: 0)
  final int premiumExtraFeeHalala;

  @JsonKey(name: 'proteinFamilyKey')
  final String? proteinFamilyKey;

  MealSlotResponse(
    this.slotIndex,
    this.slotKey,
    this.status,
    this.proteinId,
    this.carbs,
    this.selectionType,
    this.sandwichId,
    this.salad,
    this.isPremium,
    this.premiumSource,
    this.premiumKey,
    this.premiumExtraFeeHalala,
    this.proteinFamilyKey,
  );

  static Object? _readSalad(Map json, String key) {
    return json[key] ?? json['customSalad'];
  }

  factory MealSlotResponse.fromJson(Map<String, dynamic> json) =>
      _$MealSlotResponseFromJson(_normalizeLegacyMealSlot(json));

  static Map<String, dynamic> _normalizeLegacyMealSlot(Map<String, dynamic> json) {
    final out = Map<String, dynamic>.from(json);
    if (out['carbs'] == null && out['carbId'] != null) {
      out['carbs'] = [
        {'carbId': out['carbId'], 'grams': 150},
      ];
    }
    if (out['salad'] == null && out['customSalad'] is Map<String, dynamic>) {
      final legacy = out['customSalad'] as Map<String, dynamic>;
      out['salad'] = {
        'presetKey': legacy['presetKey'],
        'groups': {
          'leafy_greens': const <String>[],
          'vegetables': legacy['vegetables'] ?? const <String>[],
          'protein': out['proteinId'] == null ? const <String>[] : [out['proteinId']],
          'cheese_nuts': legacy['addons'] ?? legacy['nuts'] ?? const <String>[],
          'fruits': legacy['fruits'] ?? const <String>[],
          'sauce': legacy['sauce'] ?? const <String>[],
        },
      };
    }
    if (out['selectionType'] == 'standard_combo') {
      out['selectionType'] = 'standard_meal';
    }
    if (out['selectionType'] == 'custom_premium_salad') {
      out['selectionType'] = 'premium_large_salad';
    }
    return out;
  }

  Map<String, dynamic> toJson() => _$MealSlotResponseToJson(this);
}

@JsonSerializable()
class MealSlotCarbResponse {
  @JsonKey(name: 'carbId')
  final String carbId;

  @JsonKey(name: 'grams')
  final int grams;

  const MealSlotCarbResponse({required this.carbId, required this.grams});

  factory MealSlotCarbResponse.fromJson(Map<String, dynamic> json) =>
      _$MealSlotCarbResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MealSlotCarbResponseToJson(this);
}

@JsonSerializable()
class SaladResponse {
  @JsonKey(name: 'presetKey')
  final String? presetKey;

  @JsonKey(name: 'groups')
  final SaladGroupsResponse? groups;

  const SaladResponse({this.presetKey, this.groups});

  factory SaladResponse.fromJson(Map<String, dynamic> json) =>
      _$SaladResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SaladResponseToJson(this);
}

@JsonSerializable()
class SaladGroupsResponse {
  @JsonKey(name: 'leafy_greens', defaultValue: [])
  final List<String> leafyGreens;

  @JsonKey(name: 'vegetables', defaultValue: [])
  final List<String> vegetables;

  @JsonKey(name: 'protein', defaultValue: [])
  final List<String> protein;

  @JsonKey(name: 'cheese_nuts', defaultValue: [])
  final List<String> cheeseNuts;

  @JsonKey(name: 'fruits', defaultValue: [])
  final List<String> fruits;

  @JsonKey(name: 'sauce', defaultValue: [])
  final List<String> sauce;

  const SaladGroupsResponse({
    this.leafyGreens = const [],
    this.vegetables = const [],
    this.protein = const [],
    this.cheeseNuts = const [],
    this.fruits = const [],
    this.sauce = const [],
  });

  factory SaladGroupsResponse.fromJson(Map<String, dynamic> json) =>
      _$SaladGroupsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SaladGroupsResponseToJson(this);
}

@JsonSerializable()
class PlannerMetaResponse {
  @JsonKey(name: 'requiredSlotCount', defaultValue: 0)
  final int requiredSlotCount;

  @JsonKey(name: 'emptySlotCount', defaultValue: 0)
  final int emptySlotCount;

  @JsonKey(name: 'partialSlotCount', defaultValue: 0)
  final int partialSlotCount;

  @JsonKey(name: 'completeSlotCount', defaultValue: 0)
  final int completeSlotCount;

  @JsonKey(name: 'premiumSlotCount', defaultValue: 0)
  final int premiumSlotCount;

  @JsonKey(name: 'premiumPendingPaymentCount', defaultValue: 0)
  final int premiumPendingPaymentCount;

  @JsonKey(name: 'premiumTotalHalala', defaultValue: 0)
  final int premiumTotalHalala;

  @JsonKey(name: 'isDraftValid', defaultValue: true)
  final bool isDraftValid;

  @JsonKey(name: 'isConfirmable', defaultValue: false)
  final bool isConfirmable;

  PlannerMetaResponse(
    this.requiredSlotCount,
    this.emptySlotCount,
    this.partialSlotCount,
    this.completeSlotCount,
    this.premiumSlotCount,
    this.premiumPendingPaymentCount,
    this.premiumTotalHalala,
    this.isDraftValid,
    this.isConfirmable,
  );

  factory PlannerMetaResponse.fromJson(Map<String, dynamic> json) =>
      _$PlannerMetaResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PlannerMetaResponseToJson(this);
}

@JsonSerializable()
class PaymentRequirementResponse {
  @JsonKey(name: 'status', defaultValue: 'satisfied')
  final String status;

  @JsonKey(name: 'requiresPayment', defaultValue: false)
  final bool requiresPayment;

  @JsonKey(name: 'premiumSelectedCount', defaultValue: 0)
  final int premiumSelectedCount;

  @JsonKey(name: 'premiumPendingPaymentCount', defaultValue: 0)
  final int premiumPendingPaymentCount;

  @JsonKey(name: 'addonSelectedCount', defaultValue: 0)
  final int addonSelectedCount;

  @JsonKey(name: 'addonPendingPaymentCount', defaultValue: 0)
  final int addonPendingPaymentCount;

  @JsonKey(name: 'amountHalala', defaultValue: 0)
  final int amountHalala;

  @JsonKey(name: 'pendingAmountHalala', defaultValue: 0)
  final int pendingAmountHalala;

  @JsonKey(name: 'currency', defaultValue: 'SAR')
  final String currency;

  @JsonKey(name: 'pricingStatus', defaultValue: 'not_required')
  final String pricingStatus;

  @JsonKey(name: 'pricingStatusLabel')
  final String? pricingStatusLabel;

  @JsonKey(name: 'blockingReason')
  final String? blockingReason;

  @JsonKey(name: 'blockingReasonLabel')
  final String? blockingReasonLabel;

  @JsonKey(name: 'canCreatePayment', defaultValue: false)
  final bool canCreatePayment;

  PaymentRequirementResponse(
    this.status,
    this.requiresPayment,
    this.premiumSelectedCount,
    this.premiumPendingPaymentCount,
    this.addonSelectedCount,
    this.addonPendingPaymentCount,
    this.amountHalala,
    this.pendingAmountHalala,
    this.currency,
    this.pricingStatus,
    this.pricingStatusLabel,
    this.blockingReason,
    this.blockingReasonLabel,
    this.canCreatePayment,
  );

  factory PaymentRequirementResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentRequirementResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentRequirementResponseToJson(this);
}

@JsonSerializable()
class PremiumExtraPaymentResponse {
  @JsonKey(name: 'paymentStatus')
  final String? paymentStatus;

  @JsonKey(name: 'amountHalala')
  final int? amountHalala;

  @JsonKey(name: 'currency')
  final String? currency;

  const PremiumExtraPaymentResponse({
    this.paymentStatus,
    this.amountHalala,
    this.currency,
  });

  factory PremiumExtraPaymentResponse.fromJson(Map<String, dynamic> json) =>
      _$PremiumExtraPaymentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PremiumExtraPaymentResponseToJson(this);
}

@JsonSerializable()
class DayRulesResponse {
  @JsonKey(name: 'version')
  final String? version;

  @JsonKey(name: 'beef')
  final DayBeefRuleResponse? beef;

  @JsonKey(name: 'maxCarbItemsPerMeal')
  final int? maxCarbItemsPerMeal;

  @JsonKey(name: 'maxCarbTotalGrams')
  final int? maxCarbTotalGrams;

  const DayRulesResponse({
    this.version,
    this.beef,
    this.maxCarbItemsPerMeal,
    this.maxCarbTotalGrams,
  });

  factory DayRulesResponse.fromJson(Map<String, dynamic> json) =>
      _$DayRulesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DayRulesResponseToJson(this);
}

@JsonSerializable()
class DayBeefRuleResponse {
  @JsonKey(name: 'proteinFamilyKey')
  final String? proteinFamilyKey;

  @JsonKey(name: 'maxSlotsPerDay')
  final int? maxSlotsPerDay;

  const DayBeefRuleResponse({this.proteinFamilyKey, this.maxSlotsPerDay});

  factory DayBeefRuleResponse.fromJson(Map<String, dynamic> json) =>
      _$DayBeefRuleResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DayBeefRuleResponseToJson(this);
}
