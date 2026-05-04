import 'package:basic_diet/data/response/subscription_day_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'premium_payment_response.g.dart';

@JsonSerializable()
class PremiumPaymentResponse {
  @JsonKey(name: 'status')
  final bool? status;

  @JsonKey(name: 'data')
  final PremiumPaymentDataResponse? data;

  PremiumPaymentResponse({this.status, this.data});

  factory PremiumPaymentResponse.fromJson(Map<String, dynamic> json) =>
      _$PremiumPaymentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PremiumPaymentResponseToJson(this);
}

@JsonSerializable()
class PremiumPaymentDataResponse {
  @JsonKey(name: 'paymentId', readValue: _readPaymentId)
  final String? paymentId;

  @JsonKey(name: 'payment_url')
  final String? paymentUrl;

  @JsonKey(name: 'invoice_id')
  final String? invoiceId;

  @JsonKey(name: 'providerInvoiceId')
  final String? providerInvoiceId;

  @JsonKey(name: 'totalHalala')
  final int? totalHalala;

  @JsonKey(name: 'premiumAmountHalala')
  final int? premiumAmountHalala;

  @JsonKey(name: 'addonsAmountHalala')
  final int? addonsAmountHalala;

  @JsonKey(name: 'amountHalala')
  final int? amountHalala;

  @JsonKey(name: 'currency')
  final String? currency;

  @JsonKey(name: 'plannerRevisionHash')
  final String? plannerRevisionHash;

  @JsonKey(name: 'paymentRequirement')
  final PaymentRequirementResponse? paymentRequirement;

  @JsonKey(name: 'commercialState')
  final String? commercialState;

  @JsonKey(name: 'reused')
  final bool? reused;

  PremiumPaymentDataResponse({
    this.paymentId,
    this.paymentUrl,
    this.invoiceId,
    this.providerInvoiceId,
    this.totalHalala,
    this.premiumAmountHalala,
    this.addonsAmountHalala,
    this.amountHalala,
    this.currency,
    this.plannerRevisionHash,
    this.paymentRequirement,
    this.commercialState,
    this.reused,
  });

  static Object? _readPaymentId(Map json, String key) {
    return json[key] ?? json['payment_id'];
  }

  factory PremiumPaymentDataResponse.fromJson(Map<String, dynamic> json) =>
      _$PremiumPaymentDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PremiumPaymentDataResponseToJson(this);
}

@JsonSerializable()
class PremiumPaymentVerificationResponse {
  @JsonKey(name: 'status')
  final bool? status;

  @JsonKey(name: 'data')
  final PremiumPaymentVerificationData? data;

  PremiumPaymentVerificationResponse({this.status, this.data});

  factory PremiumPaymentVerificationResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$PremiumPaymentVerificationResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PremiumPaymentVerificationResponseToJson(this);
}

@JsonSerializable()
class PremiumPaymentVerificationData {
  @JsonKey(name: 'paymentStatus')
  final String? paymentStatus;

  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'applied')
  final bool? applied;

  @JsonKey(name: 'isFinal')
  final bool? isFinal;

  @JsonKey(name: 'premiumSummary')
  final Map<String, dynamic>? premiumSummary;

  @JsonKey(name: 'premiumExtraPayment')
  final Map<String, dynamic>? premiumExtraPayment;

  @JsonKey(name: 'addonSelections', defaultValue: [])
  final List<AddonSelectionResponse> addonSelections;

  @JsonKey(name: 'paymentRequirement')
  final PaymentRequirementResponse? paymentRequirement;

  @JsonKey(name: 'commercialState')
  final String? commercialState;

  @JsonKey(name: 'payment')
  final Map<String, dynamic>? payment;

  @JsonKey(name: 'providerInvoice')
  final Map<String, dynamic>? providerInvoice;

  @JsonKey(name: 'premiumPendingPaymentCount')
  final int? premiumPendingPaymentCount;

  @JsonKey(name: 'addonPendingPaymentCount')
  final int? addonPendingPaymentCount;

  PremiumPaymentVerificationData({
    this.paymentStatus,
    this.message,
    this.applied,
    this.isFinal,
    this.premiumSummary,
    this.premiumExtraPayment,
    this.addonSelections = const [],
    this.paymentRequirement,
    this.commercialState,
    this.payment,
    this.providerInvoice,
    this.premiumPendingPaymentCount,
    this.addonPendingPaymentCount,
  });

  factory PremiumPaymentVerificationData.fromJson(Map<String, dynamic> json) =>
      _$PremiumPaymentVerificationDataFromJson(json);

  Map<String, dynamic> toJson() => _$PremiumPaymentVerificationDataToJson(this);
}
