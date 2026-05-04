import 'package:basic_diet/app/dependency_injection.dart';
import 'package:basic_diet/domain/model/current_subscription_overview_model.dart';
import 'package:basic_diet/domain/model/timeline_model.dart';
import 'package:basic_diet/presentation/plans/bloc/plans_bloc.dart';
import 'package:basic_diet/presentation/plans/bloc/plans_event.dart';
import 'package:basic_diet/presentation/plans/pickup_status/pickup_status_cubit.dart';
import 'package:basic_diet/presentation/plans/widgets/fulfillment/delivery_fulfillment_card.dart';
import 'package:basic_diet/presentation/plans/widgets/fulfillment/pickup_fulfillment_card.dart';
import 'package:basic_diet/presentation/plans/fulfillment_status/fulfillment_status_cubit.dart';
import 'package:basic_diet/presentation/plans/fulfillment_status/fulfillment_status_state.dart';
import 'package:basic_diet/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class FulfillmentStatusSection extends StatelessWidget {
  final CurrentSubscriptionOverviewDataModel data;
  final TimelineDayModel? fulfillmentDay;

  const FulfillmentStatusSection({
    super.key,
    required this.data,
    required this.fulfillmentDay,
  });

  @override
  Widget build(BuildContext context) {
    if (data.deliveryMode == 'pickup') {
      final businessDate = _pickupBusinessDate;
      if (businessDate.isNotEmpty) {
        context.read<FulfillmentStatusCubit>().startPolling(data.id, businessDate);
      }
      
      if (businessDate.isEmpty) {
        return Column(
          children: [
            Gap(AppSize.s16.h),
            BlocBuilder<FulfillmentStatusCubit, FulfillmentStatusState>(
              builder: (context, pollingState) {
                return PickupFulfillmentCard(
                  overview: data,
                  pickupStatus: null,
                  fulfillmentStatus: pollingState.data,
                  onOpenPlanner: () => _openPlanner(context),
                  onPrepare: () => _preparePickup(context, businessDate),
                );
              }
            ),
          ],
        );
      }

      return Column(
        children: [
          Gap(AppSize.s16.h),
          BlocProvider(
            create: (_) {
              initPickupStatusModule();
              return instance<PickupStatusCubit>()..startPolling(data.id, businessDate);
            },
            child: BlocBuilder<PickupStatusCubit, PickupStatusState>(
              builder: (_, pickupState) {
                return BlocBuilder<FulfillmentStatusCubit, FulfillmentStatusState>(
                  builder: (context, pollingState) {
                    final pickupStatus =
                        pickupState is PickupStatusLoaded ? pickupState.data : null;

                    return PickupFulfillmentCard(
                      overview: data,
                      pickupStatus: pickupStatus,
                      fulfillmentStatus: pollingState.data,
                      onOpenPlanner: () => _openPlanner(context),
                      onPrepare: () => _preparePickup(context, businessDate),
                    );
                  }
                );
              },
            ),
          ),
        ],
      );
    }

    if (data.deliveryMode == 'delivery') {
      final businessDate = fulfillmentDay?.date ?? data.businessDate;
      if (businessDate.isNotEmpty) {
        context.read<FulfillmentStatusCubit>().startPolling(data.id, businessDate);
      }
      
      return Column(
        children: [
          Gap(AppSize.s16.h),
          BlocBuilder<FulfillmentStatusCubit, FulfillmentStatusState>(
            builder: (context, pollingState) {
              return DeliveryFulfillmentCard(
                overview: data,
                fulfillmentDay: fulfillmentDay,
                fulfillmentStatus: pollingState.data,
                onOpenPlanner: () => _openPlanner(context),
              );
            }
          ),
        ],
      );
    }

    return const SizedBox.shrink();
  }

  String get _pickupBusinessDate {
    if (data.pickupPreparation?.businessDate.isNotEmpty == true) {
      return data.pickupPreparation!.businessDate;
    }
    return data.businessDate;
  }

  void _openPlanner(BuildContext context) {
    context.read<PlansBloc>().add(
      FetchTimelineAndOpenPlannerEvent(
        data.id,
        preferredDate: _pickupBusinessDate,
      ),
    );
  }

  void _preparePickup(BuildContext context, String businessDate) {
    context.read<PlansBloc>().add(PreparePickupEvent(data.id, businessDate));
  }
}
