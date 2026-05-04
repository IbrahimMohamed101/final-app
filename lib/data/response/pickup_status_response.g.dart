// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pickup_status_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantHoursResponse _$RestaurantHoursResponseFromJson(
  Map<String, dynamic> json,
) => RestaurantHoursResponse(
  json['openTime'] as String?,
  json['closeTime'] as String?,
  json['isOpenNow'] as bool?,
);

Map<String, dynamic> _$RestaurantHoursResponseToJson(
  RestaurantHoursResponse instance,
) => <String, dynamic>{
  'openTime': instance.openTime,
  'closeTime': instance.closeTime,
  'isOpenNow': instance.isOpenNow,
};

PickupStatusDataResponse _$PickupStatusDataResponseFromJson(
  Map<String, dynamic> json,
) => PickupStatusDataResponse(
  json['subscriptionId'] as String?,
  json['date'] as String?,
  (json['currentStep'] as num?)?.toInt(),
  json['status'] as String?,
  json['statusLabel'] as String?,
  json['message'] as String?,
  json['canModify'] as bool?,
  json['isReady'] as bool?,
  json['isCompleted'] as bool?,
  json['canRequestPrepare'] as bool?,
  json['pickupRequested'] as bool?,
  json['pickupPrepared'] as bool?,
  json['pickupCode'] as String?,
  json['pickupCodeIssuedAt'] as String?,
  json['fulfilledAt'] as String?,
  json['requestBlockedReason'] as String?,
  json['requestBlockedMessage'] as String?,
  json['restaurantHours'] == null
      ? null
      : RestaurantHoursResponse.fromJson(
        json['restaurantHours'] as Map<String, dynamic>,
      ),
  json['pickupPreparationFlowStatus'] as String?,
  json['consumptionState'] as String?,
  json['fulfillmentMode'] as String?,
  json['pickupLocation'] == null
      ? null
      : OverviewPickupLocationSummaryResponse.fromJson(
        json['pickupLocation'] as Map<String, dynamic>,
      ),
);

Map<String, dynamic> _$PickupStatusDataResponseToJson(
  PickupStatusDataResponse instance,
) => <String, dynamic>{
  'subscriptionId': instance.subscriptionId,
  'date': instance.date,
  'currentStep': instance.currentStep,
  'status': instance.status,
  'statusLabel': instance.statusLabel,
  'message': instance.message,
  'canModify': instance.canModify,
  'isReady': instance.isReady,
  'isCompleted': instance.isCompleted,
  'canRequestPrepare': instance.canRequestPrepare,
  'pickupRequested': instance.pickupRequested,
  'pickupPrepared': instance.pickupPrepared,
  'pickupCode': instance.pickupCode,
  'pickupCodeIssuedAt': instance.pickupCodeIssuedAt,
  'fulfilledAt': instance.fulfilledAt,
  'requestBlockedReason': instance.requestBlockedReason,
  'requestBlockedMessage': instance.requestBlockedMessage,
  'restaurantHours': instance.restaurantHours,
  'pickupPreparationFlowStatus': instance.pickupPreparationFlowStatus,
  'consumptionState': instance.consumptionState,
  'fulfillmentMode': instance.fulfillmentMode,
  'pickupLocation': instance.pickupLocation,
};

PickupStatusResponse _$PickupStatusResponseFromJson(
  Map<String, dynamic> json,
) => PickupStatusResponse(
  json['status'] as bool?,
  json['data'] == null
      ? null
      : PickupStatusDataResponse.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PickupStatusResponseToJson(
  PickupStatusResponse instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};
