import 'package:basic_diet/domain/model/subscription_day_model.dart';

class PremiumPaymentModel {
  final String paymentId;
  final String paymentUrl;
  final String invoiceId;
  final int amountHalala;
  final int totalHalala;
  final int premiumAmountHalala;
  final int addonsAmountHalala;
  final String currency;
  final String plannerRevisionHash;
  final PaymentRequirementModel? paymentRequirement;
  final String commercialState;
  final bool reused;

  PremiumPaymentModel({
    required this.paymentId,
    required this.paymentUrl,
    required this.invoiceId,
    required this.amountHalala,
    required this.totalHalala,
    required this.premiumAmountHalala,
    required this.addonsAmountHalala,
    required this.currency,
    required this.plannerRevisionHash,
    this.paymentRequirement,
    required this.commercialState,
    required this.reused,
  });
}

class PremiumPaymentVerificationModel {
  final String paymentStatus;
  final String message;
  final bool applied;
  final bool isFinal;
  final Map<String, dynamic> premiumSummary;
  final Map<String, dynamic> premiumExtraPayment;
  final List<AddonSelectionModel> addonSelections;
  final PaymentRequirementModel? paymentRequirement;
  final String commercialState;
  final Map<String, dynamic> payment;
  final Map<String, dynamic> providerInvoice;
  final int premiumPendingPaymentCount;
  final int addonPendingPaymentCount;

  PremiumPaymentVerificationModel({
    required this.paymentStatus,
    required this.message,
    required this.applied,
    required this.isFinal,
    this.premiumSummary = const {},
    this.premiumExtraPayment = const {},
    this.addonSelections = const [],
    this.paymentRequirement,
    this.commercialState = '',
    this.payment = const {},
    this.providerInvoice = const {},
    this.premiumPendingPaymentCount = 0,
    this.addonPendingPaymentCount = 0,
  });
}
