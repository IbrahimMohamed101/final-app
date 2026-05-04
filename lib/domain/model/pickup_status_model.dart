import 'package:basic_diet/domain/model/current_subscription_overview_model.dart';

class PickupStatusDataModel {
  String subscriptionId;
  String date;
  int currentStep;
  String status;
  String statusLabel;
  String message;
  bool canModify;
  bool isReady;
  bool isCompleted;
  bool canRequestPrepare;
  bool pickupRequested;
  bool pickupPrepared;
  String? pickupCode;
  String? pickupCodeIssuedAt;
  String? fulfilledAt;
  String requestBlockedReason;
  String requestBlockedMessage;
  RestaurantHoursModel? restaurantHours;
  String pickupPreparationFlowStatus;
  String consumptionState;
  String fulfillmentMode;
  PickupLocationSummaryModel? pickupLocation;

  PickupStatusDataModel(
    this.subscriptionId,
    this.date,
    this.currentStep,
    this.status,
    this.statusLabel,
    this.message,
    this.canModify,
    this.isReady,
    this.isCompleted,
    this.canRequestPrepare,
    this.pickupRequested,
    this.pickupPrepared,
    this.pickupCode,
    this.pickupCodeIssuedAt,
    this.fulfilledAt,
    this.requestBlockedReason,
    this.requestBlockedMessage,
    this.restaurantHours,
    this.pickupPreparationFlowStatus,
    this.consumptionState,
    this.fulfillmentMode, [
    this.pickupLocation,
    ]
  );
}

class RestaurantHoursModel {
  final String openTime;
  final String closeTime;
  final bool isOpenNow;

  const RestaurantHoursModel({
    this.openTime = '',
    this.closeTime = '',
    this.isOpenNow = false,
  });

  String get summary {
    if (openTime.isEmpty && closeTime.isEmpty) {
      return '';
    }
    return '$openTime - $closeTime';
  }
}

class PickupStatusModel {
  bool status;
  PickupStatusDataModel? data;

  PickupStatusModel(this.status, this.data);
}
