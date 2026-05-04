import 'package:basic_diet/data/response/pickup_status_response.dart';
import 'package:basic_diet/data/mappers/current_subscription_overview_mapper.dart';
import 'package:basic_diet/domain/model/pickup_status_model.dart';
import 'package:basic_diet/app/extensions.dart';

extension PickupStatusResponseMapper on PickupStatusResponse? {
  PickupStatusModel toDomain() {
    return PickupStatusModel(
      this?.status.orFalse() ?? false,
      this?.data.toDomain(),
    );
  }
}

extension PickupStatusDataResponseMapper on PickupStatusDataResponse? {
  PickupStatusDataModel toDomain() {
    return PickupStatusDataModel(
      this?.subscriptionId.orEmpty() ?? "",
      this?.date.orEmpty() ?? "",
      this?.currentStep.orZero() ?? 0,
      this?.status.orEmpty() ?? "",
      this?.statusLabel.orEmpty() ?? "",
      this?.message.orEmpty() ?? "",
      this?.canModify.orFalse() ?? false,
      this?.isReady.orFalse() ?? false,
      this?.isCompleted.orFalse() ?? false,
      this?.canRequestPrepare.orFalse() ?? false,
      this?.pickupRequested.orFalse() ?? false,
      this?.pickupPrepared.orFalse() ?? false,
      this?.pickupCode,
      this?.pickupCodeIssuedAt,
      this?.fulfilledAt,
      this?.requestBlockedReason.orEmpty() ?? "",
      this?.requestBlockedMessage.orEmpty() ?? "",
      this?.restaurantHours?.toDomain(),
      this?.pickupPreparationFlowStatus.orEmpty() ?? "",
      this?.consumptionState.orEmpty() ?? "",
      this?.fulfillmentMode.orEmpty() ?? "",
      this?.pickupLocation?.toDomain(),
    );
  }
}

extension RestaurantHoursResponseMapper on RestaurantHoursResponse? {
  RestaurantHoursModel toDomain() {
    return RestaurantHoursModel(
      openTime: this?.openTime.orEmpty() ?? "",
      closeTime: this?.closeTime.orEmpty() ?? "",
      isOpenNow: this?.isOpenNow.orFalse() ?? false,
    );
  }
}
