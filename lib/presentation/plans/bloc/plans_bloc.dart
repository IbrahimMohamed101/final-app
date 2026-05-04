import 'package:basic_diet/domain/usecase/get_current_subscription_overview_usecase.dart';
import 'package:basic_diet/domain/model/timeline_model.dart';
import 'package:basic_diet/domain/usecase/get_timeline_usecase.dart';
import 'package:basic_diet/domain/usecase/prepare_pickup_usecase.dart';
import 'package:basic_diet/presentation/plans/bloc/plans_event.dart';
import 'package:basic_diet/presentation/plans/bloc/plans_state.dart';
import 'package:basic_diet/presentation/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlansBloc extends Bloc<PlansEvent, PlansState> {
  final GetCurrentSubscriptionOverviewUseCase
  _getCurrentSubscriptionOverviewUseCase;
  final GetTimelineUseCase _getTimelineUseCase;
  final PreparePickupUseCase _preparePickupUseCase;

  PlansBloc(
    this._getCurrentSubscriptionOverviewUseCase,
    this._getTimelineUseCase,
    this._preparePickupUseCase,
  ) : super(const PlansInitial()) {
    on<FetchCurrentSubscriptionOverviewEvent>(
      _onFetchCurrentSubscriptionOverview,
    );
    on<FetchTimelineAndOpenPlannerEvent>(_onFetchTimelineAndOpenPlanner);
    on<PreparePickupEvent>(_onPreparePickup);
  }

  String _resolveOperationalDayFromTimeline(TimelineModel timeline) {
    final days = timeline.data.days;

    for (final day in days) {
      if (day.consumptionState == 'consumable_today') {
        return day.date;
      }
    }

    for (final day in days) {
      if (day.canBePrepared || day.fulfillmentReady) {
        return day.date;
      }
    }

    return '';
  }

  TimelineDayModel? _resolveFulfillmentDay({
    required TimelineModel timeline,
    required String preferredDate,
  }) {
    final days = timeline.data.days;

    if (days.isEmpty) return null;

    if (preferredDate.isNotEmpty) {
      final exactMatch = days.where((day) => day.date.startsWith(preferredDate));
      if (exactMatch.isNotEmpty) {
        return exactMatch.first;
      }
    }

    for (final day in days) {
      if (day.consumptionState == 'consumable_today') {
        return day;
      }
    }

    for (final day in days) {
      if (day.status.toLowerCase() == 'locked' ||
          day.fulfillmentReady ||
          day.isFulfillable) {
        return day;
      }
    }

    for (final day in days) {
      if (day.hasCustomerSelections || day.selectedMeals > 0) {
        return day;
      }
    }

    return days.first;
  }

  Future<String> _resolveBusinessDate({
    required String subscriptionId,
    required String preferredDate,
  }) async {
    if (preferredDate.isNotEmpty) return preferredDate;

    final timelineResult = await _getTimelineUseCase.execute(subscriptionId);
    return timelineResult.fold(
      (_) => '',
      (timeline) => _resolveOperationalDayFromTimeline(timeline),
    );
  }

  void _onFetchCurrentSubscriptionOverview(
    FetchCurrentSubscriptionOverviewEvent event,
    Emitter<PlansState> emit,
  ) async {
    emit(const PlansLoading());
    final result = await _getCurrentSubscriptionOverviewUseCase.execute(null);
    await result.fold(
      (failure) {
        emit(PlansError(failure.message));
      },
      (data) async {
        final overview = data.data;
        TimelineDayModel? fulfillmentDay;
        final needsOperationalDay =
            overview != null &&
            overview.deliveryMode == 'pickup' &&
            overview.businessDate.isEmpty;

        if (needsOperationalDay) {
          overview.businessDate = await _resolveBusinessDate(
            subscriptionId: overview.id,
            preferredDate: overview.businessDate,
          );
        }

        if (overview != null && overview.id.isNotEmpty) {
          final timelineResult = await _getTimelineUseCase.execute(overview.id);
          fulfillmentDay = timelineResult.fold(
            (_) => null,
            (timeline) => _resolveFulfillmentDay(
              timeline: timeline,
              preferredDate: overview.businessDate,
            ),
          );
        }

        emit(
          CurrentSubscriptionOverviewLoaded(
            data,
            fulfillmentDay: fulfillmentDay,
          ),
        );
      },
    );
  }

  void _onFetchTimelineAndOpenPlanner(
    FetchTimelineAndOpenPlannerEvent event,
    Emitter<PlansState> emit,
  ) async {
    final currentData = state.data;
    emit(
      OpenPlannerLoading(
        data: currentData,
        fulfillmentDay: state.fulfillmentDay,
      ),
    );
    final result = await _getTimelineUseCase.execute(event.subscriptionId);
    result.fold(
      (failure) => emit(PlansError(failure.message, data: currentData)),
      (timeline) {
        final days = timeline.data.days;
        final availableStatuses = ['open', 'planned', 'extension'];
        final today = event.preferredDate.isNotEmpty
            ? event.preferredDate
            : _resolveOperationalDayFromTimeline(timeline);
        int index = -1;

        if (event.openCurrentDay) {
          index = days.indexWhere(
            (day) =>
                day.date.startsWith(today) &&
                availableStatuses.contains(day.status.toLowerCase()),
          );
        }

        index = index == -1
            ? days.indexWhere(
                (day) => availableStatuses.contains(day.status.toLowerCase()),
              )
            : index;

        if (index != -1) {
          emit(
            NavigateToMealPlannerState(
              timelineDays: days,
              initialDayIndex: index,
              premiumMealsRemaining: timeline.data.premiumMealsRemaining,
              premiumSummaries: state.data?.data?.premiumSummary ?? const [],
              subscriptionId: event.subscriptionId,
              data: currentData,
              fulfillmentDay: state.fulfillmentDay,
            ),
          );
        } else {
          emit(
            PlansError(
              Strings.noAvailableDaysForPlanning.tr(),
              data: currentData,
              fulfillmentDay: state.fulfillmentDay,
            ),
          );
        }
      },
    );
  }

  void _onPreparePickup(
    PreparePickupEvent event,
    Emitter<PlansState> emit,
  ) async {
    final currentData = state.data;
    emit(
      PreparePickupLoading(
        data: currentData,
        fulfillmentDay: state.fulfillmentDay,
      ),
    );

    final resolvedDate = await _resolveBusinessDate(
      subscriptionId: event.subscriptionId,
      preferredDate: event.businessDate,
    );

    if (resolvedDate.isEmpty) {
      emit(
        PlansError(
          Strings.unableToResolvePickupDay.tr(),
          data: currentData,
          fulfillmentDay: state.fulfillmentDay,
        ),
      );
      return;
    }

    final result = await _preparePickupUseCase.execute(
      PreparePickupUseCaseInput(event.subscriptionId, resolvedDate),
    );

    result.fold(
      (failure) => emit(
        PlansError(
          failure.message,
          data: currentData,
          fulfillmentDay: state.fulfillmentDay,
        ),
      ),
      (data) {
        emit(
          PreparePickupSuccess(
            data: currentData,
            fulfillmentDay: state.fulfillmentDay,
          ),
        );
        add(FetchCurrentSubscriptionOverviewEvent());
      },
    );
  }
}
