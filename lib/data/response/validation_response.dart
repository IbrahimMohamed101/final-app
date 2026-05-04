import 'package:basic_diet/data/response/subscription_day_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'validation_response.g.dart';

@JsonSerializable(createFactory: false)
class ValidationResponse {
  final bool? status;

  @JsonKey(name: 'data')
  final ValidationDataResponse? data;

  const ValidationResponse({this.status, this.data});

  factory ValidationResponse.fromJson(Map<String, dynamic> json) {
    final rawStatus = json['status'];
    final ok = json['ok'];
    final parsedStatus = ok is bool
        ? ok
        : rawStatus is bool
        ? rawStatus
        : rawStatus is num
        ? rawStatus >= 200 && rawStatus < 300
        : false;

    return ValidationResponse(
      status: parsedStatus,
      data: json['data'] == null
          ? null
          : ValidationDataResponse.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => _$ValidationResponseToJson(this);
}

@JsonSerializable()
class ValidationDataResponse {
  @JsonKey(name: 'valid', defaultValue: false)
  final bool valid;

  @JsonKey(name: 'mealSlots')
  final List<MealSlotResponse>? mealSlots;

  @JsonKey(name: 'plannerMeta')
  final PlannerMetaResponse? plannerMeta;

  @JsonKey(name: 'paymentRequirement')
  final PaymentRequirementResponse? paymentRequirement;

  @JsonKey(name: 'slotErrors')
  final List<SlotErrorResponse>? slotErrors;

  @JsonKey(name: 'addonSelections')
  final List<AddonSelectionResponse>? addonSelections;

  @JsonKey(name: 'plannerRevisionHash')
  final String? plannerRevisionHash;

  @JsonKey(name: 'premiumExtraPayment')
  final PremiumExtraPaymentResponse? premiumExtraPayment;

  @JsonKey(name: 'commercialState')
  final String? commercialState;

  @JsonKey(name: 'isFulfillable')
  final bool? isFulfillable;

  @JsonKey(name: 'canBePrepared')
  final bool? canBePrepared;

  @JsonKey(name: 'rules')
  final DayRulesResponse? rules;

  const ValidationDataResponse({
    required this.valid,
    this.mealSlots,
    this.plannerMeta,
    this.paymentRequirement,
    this.slotErrors,
    this.addonSelections,
    this.plannerRevisionHash,
    this.premiumExtraPayment,
    this.commercialState,
    this.isFulfillable,
    this.canBePrepared,
    this.rules,
  });

  factory ValidationDataResponse.fromJson(Map<String, dynamic> json) =>
      _$ValidationDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ValidationDataResponseToJson(this);
}

@JsonSerializable()
class SlotErrorResponse {
  @JsonKey(name: 'slotIndex')
  final int slotIndex;

  @JsonKey(name: 'field')
  final String field;

  @JsonKey(name: 'code')
  final String code;

  @JsonKey(name: 'message')
  final String message;

  SlotErrorResponse(this.slotIndex, this.field, this.code, this.message);

  factory SlotErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$SlotErrorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SlotErrorResponseToJson(this);
}
