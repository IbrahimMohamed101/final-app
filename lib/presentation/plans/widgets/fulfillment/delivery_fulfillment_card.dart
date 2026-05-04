import 'package:basic_diet/domain/model/current_subscription_overview_model.dart';
import 'package:basic_diet/domain/model/timeline_model.dart';
import 'package:basic_diet/presentation/plans/widgets/fulfillment/fulfillment_status_card.dart';
import 'package:basic_diet/domain/model/fulfillment_status_model.dart';
import 'package:basic_diet/presentation/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';


class DeliveryFulfillmentCard extends StatelessWidget {
  final CurrentSubscriptionOverviewDataModel overview;
  final TimelineDayModel? fulfillmentDay;
  final FulfillmentStatusModel? fulfillmentStatus;
  final VoidCallback onOpenPlanner;

  const DeliveryFulfillmentCard({
    super.key,
    required this.overview,
    required this.fulfillmentDay,
    this.fulfillmentStatus,
    required this.onOpenPlanner,
  });

  @override
  Widget build(BuildContext context) {
    final showPlannerAction =
        fulfillmentDay != null &&
        !fulfillmentDay!.planningReady &&
        (fulfillmentDay!.status == 'open' ||
            fulfillmentDay!.status == 'planned');

    return FulfillmentStatusCard(
      title:
          overview.fulfillmentSummary?.title.isNotEmpty == true
              ? overview.fulfillmentSummary!.title
              : Strings.fulfillmentDeliveryTitle.tr(),
      statusText: _statusText(context),
      reasonText: _reasonText(context),
      tone: _tone(),
      icon: Icons.local_shipping_rounded,
      sectionTitle: Strings.fulfillmentDeliveryDetailsTitle.tr(),
      progressSteps: _buildProgressSteps(context),
      mainInfo: FulfillmentInfoList(
        items: [
          FulfillmentInfoItem(
            label: Strings.fulfillmentDeliveryAddressLabel.tr(),
            value:
                _addressSummary.isNotEmpty
                    ? _addressSummary
                    : Strings.fulfillmentAddressMissing.tr(),
            icon: Icons.place_outlined,
            customContent: _addressSummary.isEmpty
                ? FulfillmentWarningTile(
                    message: Strings.fulfillmentAddressMissing.tr(),
                  )
                : null,
          ),
          FulfillmentInfoItem(
            label: Strings.fulfillmentWindowLabel.tr(),
            value:
                _windowSummary.isNotEmpty
                    ? _windowSummary
                    : Strings.fulfillmentWindowMissing.tr(),
            icon: Icons.schedule_rounded,
            customContent: _windowSummary.isEmpty
                ? FulfillmentWarningTile(
                    message: Strings.fulfillmentWindowMissing.tr(),
                  )
                : null,
          ),
          FulfillmentInfoItem(
            label: Strings.fulfillmentLockedLabel.tr(),
            value:
                _isLocked
                    ? Strings.fulfillmentLockedYes.tr()
                    : Strings.fulfillmentLockedNo.tr(),
            icon: Icons.lock_clock_outlined,
          ),
        ],
      ),
      nextAction: FulfillmentNextActionPanel(
        title: Strings.fulfillmentNextActionLabel.tr(),
        message: _nextActionText(context),
        tone: _tone(),
        buttonLabel:
            showPlannerAction
                ? Strings.fulfillmentOpenPlannerAction.tr()
                : null,
        onPressed: showPlannerAction ? onOpenPlanner : null,
      ),
      footer: fulfillmentStatus?.isTerminal == false
          ? FulfillmentAutoUpdateFooter(
              message: '${Strings.autoUpdatingStatus.tr()} • ${Strings.updatedJustNow.tr()}',
            )
          : null,
    );
  }

  FulfillmentStatusTone _tone() {
    final status = fulfillmentStatus?.status ?? fulfillmentDay?.status ?? '';
    if (status == 'fulfilled') return FulfillmentStatusTone.success;
    if (status == 'delivery_canceled') return FulfillmentStatusTone.error;
    if (status == 'out_for_delivery' || status == 'in_preparation') {
      return FulfillmentStatusTone.info;
    }
    if (_isLocked) return FulfillmentStatusTone.warning;
    return FulfillmentStatusTone.neutral;
  }

  bool get _isLocked {
    final status = fulfillmentStatus?.status ?? fulfillmentDay?.status ?? '';
    return status == 'locked' ||
        status == 'out_for_delivery' ||
        status == 'fulfilled' ||
        status == 'delivery_canceled';
  }

  String _statusText(BuildContext context) {
    String label = '';
    if (fulfillmentStatus?.statusLabel.isNotEmpty == true) {
      label = fulfillmentStatus!.statusLabel;
    } else if (fulfillmentDay?.statusLabel.isNotEmpty == true) {
      label = fulfillmentDay!.statusLabel;
    } else if (fulfillmentDay?.fulfillmentSummary?.statusLabel.isNotEmpty == true) {
      label = fulfillmentDay!.fulfillmentSummary!.statusLabel;
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

  String _lockReason(BuildContext context) {
    if (fulfillmentStatus?.fulfillmentSummary?.lockedMessage.isNotEmpty == true) {
      return fulfillmentStatus!.fulfillmentSummary!.lockedMessage;
    }
    if (fulfillmentDay?.fulfillmentSummary?.lockedMessage.isNotEmpty == true) {
      return fulfillmentDay!.fulfillmentSummary!.lockedMessage;
    }
    if (fulfillmentDay?.lockedMessage.isNotEmpty == true) {
      return fulfillmentDay!.lockedMessage;
    }
    if (overview.fulfillmentSummary?.lockedMessage.isNotEmpty == true) {
      return overview.fulfillmentSummary!.lockedMessage;
    }
    if (fulfillmentStatus?.fulfillmentSummary?.message.isNotEmpty == true) {
      return fulfillmentStatus!.fulfillmentSummary!.message;
    }
    if (fulfillmentDay?.fulfillmentSummary?.message.isNotEmpty == true) {
      return fulfillmentDay!.fulfillmentSummary!.message;
    }
    if (overview.fulfillmentSummary?.message.isNotEmpty == true) {
      return overview.fulfillmentSummary!.message;
    }
    final payment = fulfillmentDay?.paymentRequirement;
    if (payment?.blockingReasonLabel.isNotEmpty == true) {
      return payment!.blockingReasonLabel;
    }

    switch (payment?.blockingReason) {
      case 'DAY_LOCKED_BEFORE_DELIVERY':
        return Strings.fulfillmentDeliveryLockedMessage.tr();
      case 'DELIVERY_TIME_UNAVAILABLE':
        return Strings.fulfillmentDeliveryTimeUnavailableMessage.tr();
      default:
        if (fulfillmentDay?.commercialStateLabel.isNotEmpty == true) {
          return fulfillmentDay!.commercialStateLabel;
        }
        return Strings.fulfillmentDeliveryFallbackMessage.tr();
    }
  }

  String _nextActionText(BuildContext context) {
    final status = fulfillmentStatus?.status ?? fulfillmentDay?.status ?? '';
    if (fulfillmentStatus?.fulfillmentSummary?.nextAction.isNotEmpty == true) {
      return fulfillmentStatus!.fulfillmentSummary!.nextAction;
    }
    if (status == 'out_for_delivery') {
      return fulfillmentStatus?.fulfillmentSummary?.message.isNotEmpty == true
          ? fulfillmentStatus!.fulfillmentSummary!.message
          : fulfillmentDay?.fulfillmentSummary?.message.isNotEmpty == true
          ? fulfillmentDay!.fulfillmentSummary!.message
          : Strings.fulfillmentDeliveryOutForDeliveryAction.tr();
    }
    if (status == 'fulfilled') {
      return fulfillmentStatus?.fulfillmentSummary?.message.isNotEmpty == true
          ? fulfillmentStatus!.fulfillmentSummary!.message
          : fulfillmentDay?.fulfillmentSummary?.message.isNotEmpty == true
          ? fulfillmentDay!.fulfillmentSummary!.message
          : Strings.fulfillmentDeliveredAction.tr();
    }
    if (status == 'delivery_canceled') {
      return Strings.fulfillmentCanceledAction.tr();
    }
    if (_isLocked) {
      return _lockReason(context);
    }
    if (fulfillmentDay != null && !fulfillmentDay!.planningReady) {
      return Strings.fulfillmentOpenPlannerAction.tr();
    }
    if (_windowSummary.isNotEmpty) {
      return overview.fulfillmentSummary?.nextAction.isNotEmpty == true
          ? overview.fulfillmentSummary!.nextAction
          : overview.fulfillmentSummary?.message.isNotEmpty == true
          ? overview.fulfillmentSummary!.message
          : Strings.fulfillmentDeliveryScheduledAction.tr();
    }
    return Strings.fulfillmentDeliveryFallbackMessage.tr();
  }

  String _reasonText(BuildContext context) {
    final status = fulfillmentStatus?.status ?? fulfillmentDay?.status ?? '';
    if (fulfillmentStatus?.fulfillmentSummary?.message.isNotEmpty == true) {
      return fulfillmentStatus!.fulfillmentSummary!.message;
    }
    if (status == 'out_for_delivery') {
      return fulfillmentDay?.fulfillmentSummary?.message.isNotEmpty == true
          ? fulfillmentDay!.fulfillmentSummary!.message
          : Strings.fulfillmentDeliveryOutForDeliveryAction.tr();
    }
    if (status == 'fulfilled') {
      return fulfillmentDay?.fulfillmentSummary?.message.isNotEmpty == true
          ? fulfillmentDay!.fulfillmentSummary!.message
          : Strings.fulfillmentDeliveredAction.tr();
    }
    if (_isLocked) {
      return _lockReason(context);
    }
    return overview.fulfillmentSummary?.message.isNotEmpty == true
        ? overview.fulfillmentSummary!.message
        : Strings.fulfillmentDeliverySubtitle.tr();
  }

  List<FulfillmentProgressStep> _buildProgressSteps(BuildContext context) {
    final status = fulfillmentStatus?.status ?? fulfillmentDay?.status ?? '';
    final isConfirmed = fulfillmentDay?.planningReady == true || _isLocked;
    final isPreparing = status == 'locked' || status == 'in_preparation';
    final isOnTheWay = status == 'out_for_delivery';
    final isDelivered = status == 'fulfilled';

    return [
      FulfillmentProgressStep(
        label: Strings.fulfillmentDeliveryStepConfirmed.tr(),
        isCompleted: isConfirmed,
        isActive: !isConfirmed,
      ),
      FulfillmentProgressStep(
        label: Strings.fulfillmentDeliveryStepPreparing.tr(),
        isCompleted: isOnTheWay || isDelivered,
        isActive: isPreparing,
      ),
      FulfillmentProgressStep(
        label: Strings.fulfillmentDeliveryStepOnTheWay.tr(),
        isCompleted: isDelivered,
        isActive: isOnTheWay,
      ),
      FulfillmentProgressStep(
        label: Strings.fulfillmentDeliveryStepDelivered.tr(),
        isCompleted: isDelivered,
        isActive: isDelivered,
      ),
    ];
  }

  String get _addressSummary {
    if (fulfillmentStatus?.deliveryAddress?.summary.isNotEmpty == true) {
      return fulfillmentStatus!.deliveryAddress!.summary;
    }
    if (fulfillmentDay?.deliveryAddress?.summary.isNotEmpty == true) {
      return fulfillmentDay!.deliveryAddress!.summary;
    }
    return overview.deliveryAddress?.summary ?? '';
  }

  String get _windowSummary {
    if (fulfillmentStatus?.deliveryWindow?.label.isNotEmpty == true) {
      return fulfillmentStatus!.deliveryWindow!.label;
    }
    if (fulfillmentDay?.deliveryWindow?.label.isNotEmpty == true) {
      return fulfillmentDay!.deliveryWindow!.label;
    }
    if (overview.deliveryWindowSummary?.label.isNotEmpty == true) {
      return overview.deliveryWindowSummary!.label;
    }
    if (overview.deliverySlot?.label.isNotEmpty == true) {
      return overview.deliverySlot!.label;
    }
    if (overview.deliverySlot?.window.isNotEmpty == true) {
      return overview.deliverySlot!.window;
    }
    return overview.deliveryWindow;
  }
}
