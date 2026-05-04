import 'package:basic_diet/app/constants.dart';
import 'package:basic_diet/app/extensions.dart';
import 'package:basic_diet/data/response/current_subscription_overview_response.dart';
import 'package:basic_diet/domain/model/current_subscription_overview_model.dart';

extension MetaResponseMapper on MetaResponse? {
  MetaModel toDomain() {
    return MetaModel(this?.testScenario.orEmpty() ?? Constants.empty);
  }
}

extension ContractResponseMapper on ContractResponse? {
  ContractModel toDomain() {
    return ContractModel(
      this?.isCanonical ?? false,
      this?.isGrandfathered ?? false,
      this?.version.orEmpty() ?? Constants.empty,
    );
  }
}

extension PickupPreparationResponseMapper on PickupPreparationResponse? {
  PickupPreparationModel toDomain() {
    return PickupPreparationModel(
      this?.flowStatus.orEmpty() ?? Constants.empty,
      this?.reason.orEmpty() ?? Constants.empty,
      this?.buttonLabel.orEmpty() ?? Constants.empty,
      this?.message.orEmpty() ?? Constants.empty,
      this?.canRequestPrepare ?? false,
      this?.canBePrepared ?? false,
      this?.planningReady ?? false,
      this?.showMealPlannerCta ?? false,
      this?.mealPlannerCtaLabelAr.orEmpty() ?? Constants.empty,
      this?.mealPlannerCtaLabelEn.orEmpty() ?? Constants.empty,
      this?.messageAr.orEmpty() ?? Constants.empty,
      this?.messageEn.orEmpty() ?? Constants.empty,
      this?.businessDate.orEmpty() ?? Constants.empty,
      this?.pickupRequested ?? false,
      this?.pickupPrepared ?? false,
    );
  }
}

extension OverviewDeliverySlotResponseMapper on OverviewDeliverySlotResponse? {
  DeliverySlotModel toDomain() {
    return DeliverySlotModel(
      this?.slotId.orEmpty() ?? Constants.empty,
      this?.type.orEmpty() ?? Constants.empty,
      this?.window.orEmpty() ?? Constants.empty,
      this?.label.orEmpty() ?? Constants.empty,
    );
  }
}

extension OverviewAddressSummaryResponseMapper on OverviewAddressSummaryResponse? {
  AddressSummaryModel toDomain() {
    return AddressSummaryModel(
      label: this?.label.orEmpty() ?? Constants.empty,
      line1: this?.line1.orEmpty() ?? Constants.empty,
      line2: this?.line2.orEmpty() ?? Constants.empty,
      city: this?.city.orEmpty() ?? Constants.empty,
      district: this?.district.orEmpty() ?? Constants.empty,
      zoneName: this?.zoneName.orEmpty() ?? Constants.empty,
      formatted: this?.formatted.orEmpty() ?? Constants.empty,
      street: this?.street.orEmpty() ?? Constants.empty,
      building: this?.building.orEmpty() ?? Constants.empty,
      apartment: this?.apartment.orEmpty() ?? Constants.empty,
      notes: this?.notes.orEmpty() ?? Constants.empty,
    );
  }
}

extension OverviewPickupLocationSummaryResponseMapper
    on OverviewPickupLocationSummaryResponse? {
  PickupLocationSummaryModel toDomain() {
    return PickupLocationSummaryModel(
      id: this?.id.orEmpty().isNotEmpty == true
          ? this!.id!.orEmpty()
          : this?.rawId.orEmpty() ?? Constants.empty,
      name: this?.name.orEmpty() ?? Constants.empty,
      address: this?.address.orEmpty() ?? Constants.empty,
      phone: this?.phone.orEmpty() ?? Constants.empty,
      city: this?.city.orEmpty() ?? Constants.empty,
      district: this?.district.orEmpty() ?? Constants.empty,
      workingHours: this?.workingHours.orEmpty() ?? Constants.empty,
      latitude: this?.latitude,
      longitude: this?.longitude,
      mapUrl: this?.mapUrl.orEmpty() ?? Constants.empty,
    );
  }
}

extension OverviewDeliveryWindowSummaryResponseMapper
    on OverviewDeliveryWindowSummaryResponse? {
  DeliveryWindowSummaryModel toDomain() {
    return DeliveryWindowSummaryModel(
      from: this?.from.orEmpty() ?? Constants.empty,
      to: this?.to.orEmpty() ?? Constants.empty,
      label: this?.label.orEmpty() ?? Constants.empty,
    );
  }
}

extension OverviewFulfillmentSummaryResponseMapper
    on OverviewFulfillmentSummaryResponse? {
  FulfillmentSummaryModel toDomain() {
    return FulfillmentSummaryModel(
      mode: this?.mode.orEmpty() ?? Constants.empty,
      title: this?.title.orEmpty() ?? Constants.empty,
      status: this?.status.orEmpty() ?? Constants.empty,
      statusLabel: this?.statusLabel.orEmpty() ?? Constants.empty,
      message: this?.message.orEmpty() ?? Constants.empty,
      nextAction: this?.nextAction.orEmpty() ?? Constants.empty,
      isEditable: this?.isEditable ?? false,
      isFulfillable: this?.isFulfillable ?? false,
      planningReady: this?.planningReady ?? false,
      fulfillmentReady: this?.fulfillmentReady ?? false,
      lockedReason: this?.lockedReason.orEmpty() ?? Constants.empty,
      lockedMessage: this?.lockedMessage.orEmpty() ?? Constants.empty,
    );
  }
}

extension AddonSubscriptionResponseMapper on AddonSubscriptionResponse? {
  AddonSubscriptionModel toDomain() {
    return AddonSubscriptionModel(
      this?.addonId.orEmpty() ?? Constants.empty,
      this?.category.orEmpty() ?? Constants.empty,
      this?.includedCount ?? this?.maxPerDay ?? Constants.zero,
      this?.status.orEmpty() ?? 'active',
    );
  }
}

extension PremiumSummaryResponseMapper on PremiumSummaryResponse? {
  PremiumSummaryModel toDomain() {
    return PremiumSummaryModel(
      this?.premiumMealId.orEmpty() ?? Constants.empty,
      this?.premiumKey.orEmpty() ?? Constants.empty,
      this?.name.orEmpty() ?? Constants.empty,
      this?.purchasedQtyTotal.orZero() ?? Constants.zero,
      this?.remainingQtyTotal.orZero() ?? Constants.zero,
      this?.consumedQtyTotal.orZero() ?? Constants.zero,
    );
  }
}

extension AddonSummaryResponseMapper on AddonSummaryResponse? {
  AddonSummaryModel toDomain() {
    return AddonSummaryModel(
      this?.addonId.orEmpty() ?? Constants.empty,
      this?.name.orEmpty() ?? Constants.empty,
      this?.purchasedQtyTotal.orZero() ?? Constants.zero,
      this?.remainingQtyTotal.orZero() ?? Constants.zero,
      this?.consumedQtyTotal.orZero() ?? Constants.zero,
    );
  }
}

extension MealBalanceResponseMapper on MealBalanceResponse? {
  MealBalanceModel? toDomain() {
    if (this == null) return null;
    return MealBalanceModel(
      totalMeals: this?.totalMeals,
      remainingMeals: this?.remainingMeals,
      consumedMeals: this?.consumedMeals,
      canConsumeNow: this?.canConsumeNow,
      maxConsumableMealsNow: this?.maxConsumableMealsNow,
      mealBalancePolicy: this?.mealBalancePolicy,
      dailyMealLimitEnforced: this?.dailyMealLimitEnforced,
      dailyMealsDefault: this?.dailyMealsDefault,
    );
  }
}

extension CurrentSubscriptionOverviewDataResponseMapper
    on CurrentSubscriptionOverviewDataResponse? {
  CurrentSubscriptionOverviewDataModel toDomain() {
    return CurrentSubscriptionOverviewDataModel(
      this?.id.orEmpty() ?? Constants.empty,
      this?.businessDate.orEmpty() ?? Constants.empty,
      this?.status.orEmpty() ?? Constants.empty,
      this?.startDate.orEmpty() ?? Constants.empty,
      this?.endDate.orEmpty() ?? Constants.empty,
      this?.totalMeals.orZero() ?? Constants.zero,
      this?.remainingMeals.orZero() ?? Constants.zero,
      this?.premiumRemaining.orZero() ?? Constants.zero,
      (this?.addonSubscriptions?.map((e) => e.toDomain()) ??
              const Iterable.empty())
          .cast<AddonSubscriptionModel>()
          .toList(),
      this?.selectedMealsPerDay.orZero() ?? Constants.zero,
      this?.deliveryMode.orEmpty() ?? Constants.empty,
      (this?.premiumSummary?.map((e) => e.toDomain()) ?? const Iterable.empty())
          .cast<PremiumSummaryModel>()
          .toList(),
      (this?.addonsSummary?.map((e) => e.toDomain()) ?? const Iterable.empty())
          .cast<AddonSummaryModel>()
          .toList(),
      this?.statusLabel.orEmpty() ?? Constants.empty,
      this?.deliveryModeLabel.orEmpty() ?? Constants.empty,
      this?.deliveryWindowSummary?.label.orEmpty() ??
          this?.deliveryWindow.orEmpty() ??
          Constants.empty,
      this?.pickupLocationId.orEmpty() ?? Constants.empty,
      this?.validityEndDate.orEmpty() ?? Constants.empty,
      this?.skipDaysUsed.orZero() ?? Constants.zero,
      this?.skipDaysLimit.orZero() ?? Constants.zero,
      this?.remainingSkipDays.orZero() ?? Constants.zero,
      this?.meta?.toDomain(),
      this?.contract?.toDomain(),
      this?.pickupPreparation?.toDomain(),
      this?.deliverySlot?.toDomain(),
      this?.deliveryAddress?.toDomain(),
      this?.pickupLocation?.toDomain(),
      this?.deliveryWindowSummary?.toDomain(),
      this?.fulfillmentSummary?.toDomain(),
      this?.mealBalance?.toDomain(),
    );
  }
}

extension CurrentSubscriptionOverviewResponseMapper
    on CurrentSubscriptionOverviewResponse? {
  CurrentSubscriptionOverviewModel toDomain() {
    return CurrentSubscriptionOverviewModel(this?.data?.toDomain());
  }
}
