import 'dart:async';
import 'package:basic_diet/domain/usecase/get_day_fulfillment_status_usecase.dart';
import 'package:basic_diet/presentation/plans/fulfillment_status/fulfillment_status_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FulfillmentStatusCubit extends Cubit<FulfillmentStatusState> {
  final GetDayFulfillmentStatusUseCase _getDayFulfillmentStatusUseCase;
  Timer? _pollingTimer;
  String? _subscriptionId;
  String? _date;

  FulfillmentStatusCubit(this._getDayFulfillmentStatusUseCase)
      : super(const FulfillmentStatusState());

  void load(String subscriptionId, String date) async {
    _subscriptionId = subscriptionId;
    _date = date;

    emit(state.copyWith(
      status: FulfillmentStatusStateStatus.loading,
      error: null,
    ));

    await _fetchData();
  }

  void startPolling(String subscriptionId, String date) {
    if (_subscriptionId == subscriptionId && _date == date && _pollingTimer != null) {
      // Already polling for this date setup.
      return;
    }

    _subscriptionId = subscriptionId;
    _date = date;

    // Load initial data explicitly and set up timer
    load(subscriptionId, date);
  }

  void stopPolling() {
    _pollingTimer?.cancel();
    _pollingTimer = null;
    emit(state.copyWith(isPolling: false));
  }

  void refreshNow() {
    if (_subscriptionId != null && _date != null) {
      _fetchData();
    }
  }

  void onAppResumed() {
    if (_subscriptionId != null && _date != null) {
      _fetchData();
    }
  }

  Future<void> _fetchData() async {
    if (_subscriptionId == null || _date == null) return;

    final result = await _getDayFulfillmentStatusUseCase.execute(
      GetDayFulfillmentStatusUseCaseInput(_subscriptionId!, _date!),
    );

    result.fold(
      (failure) {
        emit(state.copyWith(
          status: FulfillmentStatusStateStatus.failure,
          error: failure.message,
          // Keep existing data to avoid UI shifts on transient network errors
        ));
        // Continue polling unless explicitly closed if previous state was polling?
        // But maybe we should back off. We'll simply let timer run.
        if (_pollingTimer == null && state.isPolling) {
           _setUpTimer(60); // fallback interval
        }
      },
      (data) {
        emit(state.copyWith(
          status: FulfillmentStatusStateStatus.success,
          data: data,
          error: null,
        ));

        if (data.isTerminal) {
          stopPolling();
        } else {
          _setUpTimer(data.pollingIntervalSeconds);
        }
      },
    );
  }

  void _setUpTimer(int intervalSeconds) {
    _pollingTimer?.cancel();
    _pollingTimer = Timer.periodic(Duration(seconds: intervalSeconds), (_) {
      refreshNow();
    });
    if (!state.isPolling) {
      emit(state.copyWith(isPolling: true));
    }
  }

  @override
  Future<void> close() {
    _pollingTimer?.cancel();
    return super.close();
  }
}
