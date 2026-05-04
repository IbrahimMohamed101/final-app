import 'package:basic_diet/domain/model/current_subscription_overview_model.dart';
import 'package:basic_diet/domain/model/pickup_status_model.dart';
import 'package:basic_diet/presentation/plans/widgets/fulfillment/fulfillment_status_card.dart';
import 'package:basic_diet/domain/model/fulfillment_status_model.dart';
import 'package:basic_diet/presentation/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:basic_diet/presentation/resources/values_manager.dart';

class PickupFulfillmentCard extends StatelessWidget {
  final CurrentSubscriptionOverviewDataModel overview;
  final PickupStatusDataModel? pickupStatus;
  final FulfillmentStatusModel? fulfillmentStatus;
  final VoidCallback onOpenPlanner;
  final VoidCallback onPrepare;

  const PickupFulfillmentCard({
    super.key,
    required this.overview,
    required this.pickupStatus,
    this.fulfillmentStatus,
    required this.onOpenPlanner,
    required this.onPrepare,
  });

  @override
  Widget build(BuildContext context) {
    final prep = overview.pickupPreparation;
    final canPrepare =
        pickupStatus?.canRequestPrepare ?? prep?.canRequestPrepare ?? false;
    final showPlannerCta =
        !canPrepare &&
        (prep?.showMealPlannerCta ?? false) &&
        pickupStatus?.status != 'ready_for_pickup';

    return FulfillmentStatusCard(
      title:
          overview.fulfillmentSummary?.title.isNotEmpty == true
              ? overview.fulfillmentSummary!.title
              : Strings.fulfillmentPickupTitle.tr(),
      statusText: _statusText(context),
      reasonText: _reasonText(context),
      tone: _tone(),
      icon: Icons.storefront_rounded,
      sectionTitle: Strings.fulfillmentPickupDetailsTitle.tr(),
      progressSteps: _buildProgressSteps(context),
      mainInfo: FulfillmentInfoList(
        items: [
          FulfillmentInfoItem(
            label: Strings.fulfillmentLocationLabel.tr(),
            value:
                _pickupLocationName.isNotEmpty
                    ? _pickupLocationName
                    : Strings.fulfillmentPickupLocationMissing.tr(),
            icon: Icons.place_outlined,
            customContent: _pickupLocationName.isEmpty
                ? FulfillmentWarningTile(
                    message: Strings.fulfillmentPickupLocationMissing.tr(),
                    subtext: Strings.fulfillmentLocationMissingSubtext.tr(),
                  )
                : null,
          ),
          if (_pickupLocationAddress.isNotEmpty)
            FulfillmentInfoItem(
              label: Strings.fulfillmentDeliveryAddressLabel.tr(),
              value: _pickupLocationAddress,
              icon: Icons.map_outlined,
            ),
          if (_pickupLocationPhone.isNotEmpty)
            FulfillmentInfoItem(
              label: Strings.phone.tr(),
              value: _pickupLocationPhone,
              icon: Icons.call_outlined,
            ),
          FulfillmentInfoItem(
            label: Strings.fulfillmentRestaurantHoursLabel.tr(),
            value:
                _restaurantHours.isNotEmpty
                    ? _restaurantHours
                    : Strings.fulfillmentRestaurantHoursMissing.tr(),
            icon: Icons.schedule_rounded,
          ),
        ],
      ),
      nextAction: FulfillmentNextActionPanel(
        title: Strings.fulfillmentNextActionLabel.tr(),
        message: _nextActionText(context),
        tone: _tone(),
        buttonLabel:
            canPrepare || showPlannerCta
                ? canPrepare
                    ? _prepareButtonLabel(context)
                    : _plannerButtonLabel(context)
                : null,
        onPressed:
            canPrepare || showPlannerCta
                ? (canPrepare ? onPrepare : onOpenPlanner)
                : null,
      ),
      footer: Column(
        children: [
          if (_footerCode() != null) ...[
            _footerCode()!,
            Gap(AppSize.s12.h),
          ],
          if (fulfillmentStatus?.isTerminal == false)
            FulfillmentAutoUpdateFooter(
              message: '${Strings.autoUpdatingStatus.tr()} • ${Strings.updatedJustNow.tr()}',
            ),
        ],
      ),
    );
  }

  Widget? _footerCode() {
    final code = fulfillmentStatus?.pickupCode ?? pickupStatus?.pickupCode;
    final isReady = fulfillmentStatus?.status == 'ready_for_pickup' || 
                    pickupStatus?.isReady == true;

    if (code?.isNotEmpty == true && isReady) {
      return FulfillmentCodePanel(
        label: Strings.pickupCode.tr(),
        code: code!,
      );
    }
    return null;
  }

  FulfillmentStatusTone _tone() {
    final status = fulfillmentStatus?.status ?? pickupStatus?.status ?? '';
    if (status == 'ready_for_pickup' || status == 'fulfilled') {
      return FulfillmentStatusTone.success;
    }
    if (status == 'no_show' || status == 'canceled_at_branch') {
      return FulfillmentStatusTone.error;
    }
    if (_friendlyBlockedMessage().isNotEmpty ||
        status == 'consumed_without_preparation') {
      return FulfillmentStatusTone.warning;
    }
    if (status == 'locked' || status == 'in_preparation') {
      return FulfillmentStatusTone.info;
    }
    return FulfillmentStatusTone.neutral;
  }

  String _statusText(BuildContext context) {
    String label = '';
    if (fulfillmentStatus?.statusLabel.isNotEmpty == true) {
      label = fulfillmentStatus!.statusLabel;
    } else if (pickupStatus?.statusLabel.isNotEmpty == true) {
      label = pickupStatus!.statusLabel;
    } else if (overview.fulfillmentSummary?.statusLabel.isNotEmpty == true) {
      label = overview.fulfillmentSummary!.statusLabel;
    } else if (overview.statusLabel.isNotEmpty) {
      label = overview.statusLabel;
    } else {
      label = Strings.fulfillmentUnknownStatus.tr();
    }

    if (label == 'مفتوح' || label.toLowerCase() == 'open') {
      return Strings.orderOpenState.tr();
    }
    return label;
  }

  String _reasonText(BuildContext context) {
    if (_friendlyBlockedMessage().isNotEmpty) {
      return _friendlyBlockedMessage();
    }
    if (fulfillmentStatus?.fulfillmentSummary?.message.isNotEmpty == true) {
      return fulfillmentStatus!.fulfillmentSummary!.message;
    }
    if (pickupStatus?.message.isNotEmpty == true) {
      return pickupStatus!.message;
    }
    if (overview.fulfillmentSummary?.message.isNotEmpty == true) {
      return overview.fulfillmentSummary!.message;
    }
    if (overview.pickupPreparation?.message.isNotEmpty == true) {
      return overview.pickupPreparation!.message;
    }
    return Strings.fulfillmentPickupSubtitle.tr();
  }

  String _nextActionText(BuildContext context) {
    if (_friendlyBlockedMessage().isNotEmpty) {
      return _friendlyBlockedMessage();
    }
    if (fulfillmentStatus?.fulfillmentSummary?.nextAction.isNotEmpty == true) {
      return fulfillmentStatus!.fulfillmentSummary!.nextAction;
    }
    if (pickupStatus?.canRequestPrepare == true) {
      return overview.fulfillmentSummary?.nextAction.isNotEmpty == true
          ? overview.fulfillmentSummary!.nextAction
          : overview.pickupPreparation?.message.isNotEmpty == true
          ? overview.pickupPreparation!.message
          : Strings.fulfillmentPickupReadyAction.tr();
    }
    if (overview.pickupPreparation?.showMealPlannerCta == true) {
      return overview.pickupPreparation?.message.isNotEmpty == true
          ? overview.pickupPreparation!.message
          : Strings.fulfillmentPickupReviewAction.tr();
    }
    if (pickupStatus?.status == 'ready_for_pickup') {
      return Strings.fulfillmentPickupCodeAction.tr();
    }
    if (pickupStatus?.status == 'fulfilled') {
      return Strings.fulfillmentPickupCompletedAction.tr();
    }
    if (pickupStatus?.status == 'consumed_without_preparation') {
      return Strings.fulfillmentPickupConsumedWithoutPreparationMessage.tr();
    }
    if (pickupStatus?.status == 'no_show') {
      return Strings.fulfillmentPickupNoShowMessage.tr();
    }
    if (pickupStatus?.message.isNotEmpty == true) {
      return pickupStatus!.message;
    }
    if (overview.fulfillmentSummary?.nextAction.isNotEmpty == true) {
      return overview.fulfillmentSummary!.nextAction;
    }
    if (overview.fulfillmentSummary?.message.isNotEmpty == true) {
      return overview.fulfillmentSummary!.message;
    }
    return Strings.fulfillmentNoAction.tr();
  }

  List<FulfillmentProgressStep> _buildProgressSteps(BuildContext context) {
    final status = fulfillmentStatus?.status ?? pickupStatus?.status ?? '';
    final flowStatus = overview.pickupPreparation?.flowStatus ?? '';

    final selectionsDone =
        pickupStatus?.pickupRequested == true ||
        pickupStatus?.pickupPrepared == true ||
        const {
          'locked',
          'in_preparation',
          'ready_for_pickup',
          'fulfilled',
        }.contains(status);
    final preparingDone =
        status == 'ready_for_pickup' ||
        status == 'fulfilled' ||
        status == 'consumed_without_preparation';
    final preparingActive =
        !preparingDone &&
        (const {'locked', 'in_preparation'}.contains(status) ||
            pickupStatus?.pickupRequested == true ||
            flowStatus == 'in_progress');
    final readyDone =
        status == 'ready_for_pickup' ||
        status == 'fulfilled' ||
        status == 'consumed_without_preparation';

    return [
      FulfillmentProgressStep(
        label: Strings.fulfillmentPickupStepSelections.tr(),
        isCompleted: selectionsDone,
        isActive: !selectionsDone,
      ),
      FulfillmentProgressStep(
        label: Strings.fulfillmentPickupStepPreparing.tr(),
        isCompleted: preparingDone,
        isActive: preparingActive,
      ),
      FulfillmentProgressStep(
        label: Strings.fulfillmentPickupStepReady.tr(),
        isCompleted: readyDone,
        isActive: status == 'ready_for_pickup',
      ),
    ];
  }

  String _prepareButtonLabel(BuildContext context) {
    if (overview.pickupPreparation?.buttonLabel.isNotEmpty == true) {
      return overview.pickupPreparation!.buttonLabel;
    }
    return Strings.fulfillmentPrepareActionNow.tr();
  }

  String _plannerButtonLabel(BuildContext context) {
    if (context.locale.languageCode == 'ar' &&
        overview.pickupPreparation?.mealPlannerCtaLabelAr.isNotEmpty == true) {
      return overview.pickupPreparation!.mealPlannerCtaLabelAr;
    }
    if (context.locale.languageCode != 'ar' &&
        overview.pickupPreparation?.mealPlannerCtaLabelEn.isNotEmpty == true) {
      return overview.pickupPreparation!.mealPlannerCtaLabelEn;
    }
    return Strings.fulfillmentOpenPlannerAction.tr();
  }

  String _friendlyBlockedMessage() {
    if (pickupStatus?.requestBlockedMessage.isNotEmpty == true) {
      return pickupStatus!.requestBlockedMessage;
    }
    if (pickupStatus?.requestBlockedReason == 'RESTAURANT_CLOSED') {
      return Strings.pickupPreparationOnlyDuringWorkingHours.tr();
    }
    return '';
  }

  PickupLocationSummaryModel? get _pickupLocation =>
      fulfillmentStatus?.pickupLocation ?? pickupStatus?.pickupLocation ?? overview.pickupLocation;

  String get _pickupLocationName => _pickupLocation?.name ?? '';

  String get _pickupLocationAddress => _pickupLocation?.address ?? '';

  String get _pickupLocationPhone => _pickupLocation?.phone ?? '';

  String get _restaurantHours {
    String hours = '';
    if (pickupStatus?.restaurantHours?.summary.isNotEmpty == true) {
      hours = pickupStatus!.restaurantHours!.summary;
    } else {
      hours = _pickupLocation?.workingHours ?? '';
    }

    if (hours == 'مفتوح' || hours.toLowerCase() == 'open') {
      return Strings.branchOpen.tr();
    } else if (hours == 'مغلق' || hours.toLowerCase() == 'closed') {
      return Strings.branchClosed.tr();
    }
    return hours;
  }
}
