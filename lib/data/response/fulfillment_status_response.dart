import 'package:basic_diet/data/response/base_response/base_response.dart';
import 'package:basic_diet/data/response/current_subscription_overview_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fulfillment_status_response.g.dart';

@JsonSerializable(explicitToJson: true)
class FulfillmentStatusDataResponse {
  @JsonKey(name: "subscriptionId")
  String? subscriptionId;

  @JsonKey(name: "date")
  String? date;

  @JsonKey(name: "deliveryMode")
  String? deliveryMode;

  @JsonKey(name: "status")
  String? status;

  @JsonKey(name: "statusLabel")
  String? statusLabel;

  @JsonKey(name: "commercialState")
  String? commercialState;

  @JsonKey(name: "commercialStateLabel")
  String? commercialStateLabel;

  @JsonKey(name: "consumptionState")
  String? consumptionState;

  @JsonKey(name: "fulfillmentMode")
  String? fulfillmentMode;

  @JsonKey(name: "fulfillmentSummary")
  OverviewFulfillmentSummaryResponse? fulfillmentSummary;

  @JsonKey(name: "pickupLocation")
  OverviewPickupLocationSummaryResponse? pickupLocation;

  @JsonKey(name: "deliveryAddress")
  OverviewAddressSummaryResponse? deliveryAddress;

  @JsonKey(name: "deliveryWindow")
  OverviewDeliveryWindowSummaryResponse? deliveryWindow;

  @JsonKey(name: "pickupCode")
  String? pickupCode;

  @JsonKey(name: "isTerminal")
  bool? isTerminal;

  @JsonKey(name: "lastUpdatedAt")
  String? lastUpdatedAt;

  @JsonKey(name: "pollingIntervalSeconds")
  int? pollingIntervalSeconds;

  FulfillmentStatusDataResponse({
    this.subscriptionId,
    this.date,
    this.deliveryMode,
    this.status,
    this.statusLabel,
    this.commercialState,
    this.commercialStateLabel,
    this.consumptionState,
    this.fulfillmentMode,
    this.fulfillmentSummary,
    this.pickupLocation,
    this.deliveryAddress,
    this.deliveryWindow,
    this.pickupCode,
    this.isTerminal,
    this.lastUpdatedAt,
    this.pollingIntervalSeconds,
  });

  factory FulfillmentStatusDataResponse.fromJson(Map<String, dynamic> json) =>
      _$FulfillmentStatusDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FulfillmentStatusDataResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FulfillmentStatusResponse extends BaseResponse {
  @JsonKey(name: "data")
  FulfillmentStatusDataResponse? data;

  FulfillmentStatusResponse({this.data});

  factory FulfillmentStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$FulfillmentStatusResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$FulfillmentStatusResponseToJson(this);
}
