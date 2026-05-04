import 'package:basic_diet/domain/model/current_subscription_overview_model.dart';
import 'package:basic_diet/domain/model/timeline_model.dart';
import 'package:equatable/equatable.dart';

abstract class PlansState extends Equatable {
  final CurrentSubscriptionOverviewModel? data;
  final TimelineDayModel? fulfillmentDay;
  const PlansState({this.data, this.fulfillmentDay});

  @override
  List<Object?> get props => [data, fulfillmentDay];
}

class PlansInitial extends PlansState {
  const PlansInitial() : super();
}

class PlansLoading extends PlansState {
  const PlansLoading() : super();
}

class CurrentSubscriptionOverviewLoaded extends PlansState {
  const CurrentSubscriptionOverviewLoaded(
    CurrentSubscriptionOverviewModel data, {
    super.fulfillmentDay,
  }) : super(data: data);

  @override
  List<Object?> get props => [data, fulfillmentDay];
}

class NavigateToMealPlannerState extends PlansState {
  final List<TimelineDayModel> timelineDays;
  final int initialDayIndex;
  final int premiumMealsRemaining;
  final List<PremiumSummaryModel> premiumSummaries;
  final String subscriptionId;

  const NavigateToMealPlannerState({
    required this.timelineDays,
    required this.initialDayIndex,
    required this.premiumMealsRemaining,
    required this.premiumSummaries,
    required this.subscriptionId,
    super.data,
    super.fulfillmentDay,
  });

  @override
  List<Object?> get props => [
    timelineDays,
    initialDayIndex,
    premiumMealsRemaining,
    premiumSummaries,
    subscriptionId,
    data,
    fulfillmentDay,
  ];
}

class OpenPlannerLoading extends PlansState {
  const OpenPlannerLoading({super.data, super.fulfillmentDay});
}

class PreparePickupLoading extends PlansState {
  const PreparePickupLoading({super.data, super.fulfillmentDay});
}

class PreparePickupSuccess extends PlansState {
  const PreparePickupSuccess({super.data, super.fulfillmentDay});
}

class PlansError extends PlansState {
  final String message;

  const PlansError(this.message, {super.data, super.fulfillmentDay});

  @override
  List<Object?> get props => [message, data, fulfillmentDay];
}
