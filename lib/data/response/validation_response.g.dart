// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$ValidationResponseToJson(ValidationResponse instance) =>
    <String, dynamic>{'status': instance.status, 'data': instance.data};

ValidationDataResponse _$ValidationDataResponseFromJson(
  Map<String, dynamic> json,
) => ValidationDataResponse(
  valid: json['valid'] as bool? ?? false,
  mealSlots:
      (json['mealSlots'] as List<dynamic>?)
          ?.map((e) => MealSlotResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
  plannerMeta:
      json['plannerMeta'] == null
          ? null
          : PlannerMetaResponse.fromJson(
            json['plannerMeta'] as Map<String, dynamic>,
          ),
  paymentRequirement:
      json['paymentRequirement'] == null
          ? null
          : PaymentRequirementResponse.fromJson(
            json['paymentRequirement'] as Map<String, dynamic>,
          ),
  slotErrors:
      (json['slotErrors'] as List<dynamic>?)
          ?.map((e) => SlotErrorResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
  addonSelections:
      (json['addonSelections'] as List<dynamic>?)
          ?.map(
            (e) => AddonSelectionResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
  plannerRevisionHash: json['plannerRevisionHash'] as String?,
  premiumExtraPayment:
      json['premiumExtraPayment'] == null
          ? null
          : PremiumExtraPaymentResponse.fromJson(
            json['premiumExtraPayment'] as Map<String, dynamic>,
          ),
  commercialState: json['commercialState'] as String?,
  isFulfillable: json['isFulfillable'] as bool?,
  canBePrepared: json['canBePrepared'] as bool?,
  rules:
      json['rules'] == null
          ? null
          : DayRulesResponse.fromJson(json['rules'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ValidationDataResponseToJson(
  ValidationDataResponse instance,
) => <String, dynamic>{
  'valid': instance.valid,
  'mealSlots': instance.mealSlots,
  'plannerMeta': instance.plannerMeta,
  'paymentRequirement': instance.paymentRequirement,
  'slotErrors': instance.slotErrors,
  'addonSelections': instance.addonSelections,
  'plannerRevisionHash': instance.plannerRevisionHash,
  'premiumExtraPayment': instance.premiumExtraPayment,
  'commercialState': instance.commercialState,
  'isFulfillable': instance.isFulfillable,
  'canBePrepared': instance.canBePrepared,
  'rules': instance.rules,
};

SlotErrorResponse _$SlotErrorResponseFromJson(Map<String, dynamic> json) =>
    SlotErrorResponse(
      (json['slotIndex'] as num).toInt(),
      json['field'] as String,
      json['code'] as String,
      json['message'] as String,
    );

Map<String, dynamic> _$SlotErrorResponseToJson(SlotErrorResponse instance) =>
    <String, dynamic>{
      'slotIndex': instance.slotIndex,
      'field': instance.field,
      'code': instance.code,
      'message': instance.message,
    };
