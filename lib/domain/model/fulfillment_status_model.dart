import 'package:basic_diet/domain/model/current_subscription_overview_model.dart';
import 'package:equatable/equatable.dart';

class FulfillmentStatusModel extends Equatable {
  final String subscriptionId;
  final String date;
  final String deliveryMode;
  final String status;
  final String statusLabel;
  final String commercialState;
  final String commercialStateLabel;
  final String consumptionState;
  final String fulfillmentMode;
  final FulfillmentSummaryModel? fulfillmentSummary;
  final PickupLocationSummaryModel? pickupLocation;
  final AddressSummaryModel? deliveryAddress;
  final DeliveryWindowSummaryModel? deliveryWindow;
  final String? pickupCode;
  final bool isTerminal;
  final DateTime lastUpdatedAt;
  final int pollingIntervalSeconds;

  const FulfillmentStatusModel({
    required this.subscriptionId,
    required this.date,
    required this.deliveryMode,
    required this.status,
    required this.statusLabel,
    required this.commercialState,
    required this.commercialStateLabel,
    required this.consumptionState,
    required this.fulfillmentMode,
    this.fulfillmentSummary,
    this.pickupLocation,
    this.deliveryAddress,
    this.deliveryWindow,
    this.pickupCode,
    required this.isTerminal,
    required this.lastUpdatedAt,
    this.pollingIntervalSeconds = 60,
  });

  @override
  List<Object?> get props => [
        subscriptionId,
        date,
        deliveryMode,
        status,
        statusLabel,
        commercialState,
        commercialStateLabel,
        consumptionState,
        fulfillmentMode,
        fulfillmentSummary,
        pickupLocation,
        deliveryAddress,
        deliveryWindow,
        pickupCode,
        isTerminal,
        lastUpdatedAt,
        pollingIntervalSeconds,
      ];
}
