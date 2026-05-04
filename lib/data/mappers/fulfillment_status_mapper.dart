import 'package:basic_diet/app/constants.dart';
import 'package:basic_diet/app/extensions.dart';
import 'package:basic_diet/data/mappers/current_subscription_overview_mapper.dart';
import 'package:basic_diet/data/response/fulfillment_status_response.dart';
import 'package:basic_diet/domain/model/fulfillment_status_model.dart';

extension FulfillmentStatusDataResponseMapper on FulfillmentStatusDataResponse? {
  FulfillmentStatusModel toDomain() {
    final statusVal = this?.status.orEmpty() ?? Constants.empty;
    final fallbackTerminal = [
      'fulfilled',
      'delivery_canceled',
      'no_show',
      'consumed_without_preparation',
      'skipped',
      'frozen',
      'canceled_at_branch'
    ].contains(statusVal);

    DateTime parsedDate;
    if (this?.lastUpdatedAt != null && this!.lastUpdatedAt!.isNotEmpty) {
      try {
        parsedDate = DateTime.parse(this!.lastUpdatedAt!).toLocal();
      } catch (_) {
        parsedDate = DateTime.now();
      }
    } else {
      parsedDate = DateTime.now();
    }

    return FulfillmentStatusModel(
      subscriptionId: this?.subscriptionId.orEmpty() ?? Constants.empty,
      date: this?.date.orEmpty() ?? Constants.empty,
      deliveryMode: this?.deliveryMode.orEmpty() ?? Constants.empty,
      status: statusVal,
      statusLabel: this?.statusLabel.orEmpty() ?? Constants.empty,
      commercialState: this?.commercialState.orEmpty() ?? Constants.empty,
      commercialStateLabel: this?.commercialStateLabel.orEmpty() ?? Constants.empty,
      consumptionState: this?.consumptionState.orEmpty() ?? Constants.empty,
      fulfillmentMode: this?.fulfillmentMode.orEmpty() ?? Constants.empty,
      fulfillmentSummary: this?.fulfillmentSummary?.toDomain(),
      pickupLocation: this?.pickupLocation?.toDomain(),
      deliveryAddress: this?.deliveryAddress?.toDomain(),
      deliveryWindow: this?.deliveryWindow?.toDomain(),
      pickupCode: this?.pickupCode,
      isTerminal: this?.isTerminal ?? fallbackTerminal,
      lastUpdatedAt: parsedDate,
      pollingIntervalSeconds: this?.pollingIntervalSeconds ?? 60,
    );
  }
}
