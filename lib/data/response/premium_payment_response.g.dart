// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'premium_payment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PremiumPaymentResponse _$PremiumPaymentResponseFromJson(
  Map<String, dynamic> json,
) => PremiumPaymentResponse(
  status: json['status'] as bool?,
  data:
      json['data'] == null
          ? null
          : PremiumPaymentDataResponse.fromJson(
            json['data'] as Map<String, dynamic>,
          ),
);

Map<String, dynamic> _$PremiumPaymentResponseToJson(
  PremiumPaymentResponse instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

PremiumPaymentDataResponse _$PremiumPaymentDataResponseFromJson(
  Map<String, dynamic> json,
) => PremiumPaymentDataResponse(
  paymentId:
      PremiumPaymentDataResponse._readPaymentId(json, 'paymentId') as String?,
  paymentUrl: json['payment_url'] as String?,
  invoiceId: json['invoice_id'] as String?,
  providerInvoiceId: json['providerInvoiceId'] as String?,
  totalHalala: (json['totalHalala'] as num?)?.toInt(),
  premiumAmountHalala: (json['premiumAmountHalala'] as num?)?.toInt(),
  addonsAmountHalala: (json['addonsAmountHalala'] as num?)?.toInt(),
  amountHalala: (json['amountHalala'] as num?)?.toInt(),
  currency: json['currency'] as String?,
  plannerRevisionHash: json['plannerRevisionHash'] as String?,
  paymentRequirement:
      json['paymentRequirement'] == null
          ? null
          : PaymentRequirementResponse.fromJson(
            json['paymentRequirement'] as Map<String, dynamic>,
          ),
  commercialState: json['commercialState'] as String?,
  reused: json['reused'] as bool?,
);

Map<String, dynamic> _$PremiumPaymentDataResponseToJson(
  PremiumPaymentDataResponse instance,
) => <String, dynamic>{
  'paymentId': instance.paymentId,
  'payment_url': instance.paymentUrl,
  'invoice_id': instance.invoiceId,
  'providerInvoiceId': instance.providerInvoiceId,
  'totalHalala': instance.totalHalala,
  'premiumAmountHalala': instance.premiumAmountHalala,
  'addonsAmountHalala': instance.addonsAmountHalala,
  'amountHalala': instance.amountHalala,
  'currency': instance.currency,
  'plannerRevisionHash': instance.plannerRevisionHash,
  'paymentRequirement': instance.paymentRequirement,
  'commercialState': instance.commercialState,
  'reused': instance.reused,
};

PremiumPaymentVerificationResponse _$PremiumPaymentVerificationResponseFromJson(
  Map<String, dynamic> json,
) => PremiumPaymentVerificationResponse(
  status: json['status'] as bool?,
  data:
      json['data'] == null
          ? null
          : PremiumPaymentVerificationData.fromJson(
            json['data'] as Map<String, dynamic>,
          ),
);

Map<String, dynamic> _$PremiumPaymentVerificationResponseToJson(
  PremiumPaymentVerificationResponse instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

PremiumPaymentVerificationData _$PremiumPaymentVerificationDataFromJson(
  Map<String, dynamic> json,
) => PremiumPaymentVerificationData(
  paymentStatus: json['paymentStatus'] as String?,
  message: json['message'] as String?,
  applied: json['applied'] as bool?,
  isFinal: json['isFinal'] as bool?,
  premiumSummary: json['premiumSummary'] as Map<String, dynamic>?,
  premiumExtraPayment: json['premiumExtraPayment'] as Map<String, dynamic>?,
  addonSelections:
      (json['addonSelections'] as List<dynamic>?)
          ?.map(
            (e) => AddonSelectionResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      [],
  paymentRequirement:
      json['paymentRequirement'] == null
          ? null
          : PaymentRequirementResponse.fromJson(
            json['paymentRequirement'] as Map<String, dynamic>,
          ),
  commercialState: json['commercialState'] as String?,
  payment: json['payment'] as Map<String, dynamic>?,
  providerInvoice: json['providerInvoice'] as Map<String, dynamic>?,
  premiumPendingPaymentCount:
      (json['premiumPendingPaymentCount'] as num?)?.toInt(),
  addonPendingPaymentCount: (json['addonPendingPaymentCount'] as num?)?.toInt(),
);

Map<String, dynamic> _$PremiumPaymentVerificationDataToJson(
  PremiumPaymentVerificationData instance,
) => <String, dynamic>{
  'paymentStatus': instance.paymentStatus,
  'message': instance.message,
  'applied': instance.applied,
  'isFinal': instance.isFinal,
  'premiumSummary': instance.premiumSummary,
  'premiumExtraPayment': instance.premiumExtraPayment,
  'addonSelections': instance.addonSelections,
  'paymentRequirement': instance.paymentRequirement,
  'commercialState': instance.commercialState,
  'payment': instance.payment,
  'providerInvoice': instance.providerInvoice,
  'premiumPendingPaymentCount': instance.premiumPendingPaymentCount,
  'addonPendingPaymentCount': instance.addonPendingPaymentCount,
};
