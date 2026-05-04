import 'package:json_annotation/json_annotation.dart';
import 'package:basic_diet/data/response/current_subscription_overview_response.dart';

part 'pickup_status_response.g.dart';

@JsonSerializable()
class RestaurantHoursResponse {
  @JsonKey(name: "openTime")
  String? openTime;
  @JsonKey(name: "closeTime")
  String? closeTime;
  @JsonKey(name: "isOpenNow")
  bool? isOpenNow;

  RestaurantHoursResponse(this.openTime, this.closeTime, this.isOpenNow);

  factory RestaurantHoursResponse.fromJson(Map<String, dynamic> json) =>
      _$RestaurantHoursResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantHoursResponseToJson(this);
}

@JsonSerializable()
class PickupStatusDataResponse {
  @JsonKey(name: "subscriptionId")
  String? subscriptionId;
  @JsonKey(name: "date")
  String? date;
  @JsonKey(name: "currentStep")
  int? currentStep;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "statusLabel")
  String? statusLabel;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "canModify")
  bool? canModify;
  @JsonKey(name: "isReady")
  bool? isReady;
  @JsonKey(name: "isCompleted")
  bool? isCompleted;
  @JsonKey(name: "canRequestPrepare")
  bool? canRequestPrepare;
  @JsonKey(name: "pickupRequested")
  bool? pickupRequested;
  @JsonKey(name: "pickupPrepared")
  bool? pickupPrepared;
  @JsonKey(name: "pickupCode")
  String? pickupCode;
  @JsonKey(name: "pickupCodeIssuedAt")
  String? pickupCodeIssuedAt;
  @JsonKey(name: "fulfilledAt")
  String? fulfilledAt;
  @JsonKey(name: "requestBlockedReason")
  String? requestBlockedReason;
  @JsonKey(name: "requestBlockedMessage")
  String? requestBlockedMessage;
  @JsonKey(name: "restaurantHours")
  RestaurantHoursResponse? restaurantHours;
  @JsonKey(name: "pickupPreparationFlowStatus")
  String? pickupPreparationFlowStatus;
  @JsonKey(name: "consumptionState")
  String? consumptionState;
  @JsonKey(name: "fulfillmentMode")
  String? fulfillmentMode;
  @JsonKey(name: "pickupLocation")
  OverviewPickupLocationSummaryResponse? pickupLocation;

  PickupStatusDataResponse(
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
    this.fulfillmentMode,
    this.pickupLocation,
  );

  factory PickupStatusDataResponse.fromJson(Map<String, dynamic> json) =>
      _$PickupStatusDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PickupStatusDataResponseToJson(this);
}

@JsonSerializable()
class PickupStatusResponse {
  @JsonKey(name: "status")
  bool? status;
  @JsonKey(name: "data")
  PickupStatusDataResponse? data;

  PickupStatusResponse(this.status, this.data);

  factory PickupStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$PickupStatusResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PickupStatusResponseToJson(this);
}
