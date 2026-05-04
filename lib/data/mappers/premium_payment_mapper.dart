import 'package:basic_diet/app/constants.dart';
import 'package:basic_diet/data/mappers/subscription_day_mapper.dart';
import 'package:basic_diet/data/response/premium_payment_response.dart';
import 'package:basic_diet/domain/model/premium_payment_model.dart';

extension PremiumPaymentResponseMapper on PremiumPaymentResponse? {
  PremiumPaymentModel toDomain() {
    final data = this?.data;
    return PremiumPaymentModel(
      paymentId: data?.paymentId ?? Constants.empty,
      paymentUrl: data?.paymentUrl ?? Constants.empty,
      invoiceId: data?.providerInvoiceId ?? data?.invoiceId ?? Constants.empty,
      amountHalala:
          data?.amountHalala ?? data?.totalHalala ?? Constants.zero,
      totalHalala:
          data?.totalHalala ?? data?.amountHalala ?? Constants.zero,
      premiumAmountHalala: data?.premiumAmountHalala ?? Constants.zero,
      addonsAmountHalala: data?.addonsAmountHalala ?? Constants.zero,
      currency: data?.currency ?? Constants.empty,
      plannerRevisionHash: data?.plannerRevisionHash ?? Constants.empty,
      paymentRequirement: data?.paymentRequirement?.toDomain(),
      commercialState: data?.commercialState ?? Constants.empty,
      reused: data?.reused ?? false,
    );
  }
}

extension PremiumPaymentVerificationResponseMapper
    on PremiumPaymentVerificationResponse? {
  PremiumPaymentVerificationModel toDomain() {
    final data = this?.data;
    return PremiumPaymentVerificationModel(
      paymentStatus: data?.paymentStatus ?? Constants.empty,
      message: data?.message ?? Constants.empty,
      applied: data?.applied ?? false,
      isFinal: data?.isFinal ?? false,
      premiumSummary: data?.premiumSummary ?? const {},
      premiumExtraPayment: data?.premiumExtraPayment ?? const {},
      addonSelections:
          data?.addonSelections
              .map((selection) => selection.toDomain())
              .toList() ??
          const [],
      paymentRequirement: data?.paymentRequirement?.toDomain(),
      commercialState: data?.commercialState ?? Constants.empty,
      payment: data?.payment ?? const {},
      providerInvoice: data?.providerInvoice ?? const {},
      premiumPendingPaymentCount: data?.premiumPendingPaymentCount ?? 0,
      addonPendingPaymentCount: data?.addonPendingPaymentCount ?? 0,
    );
  }
}
