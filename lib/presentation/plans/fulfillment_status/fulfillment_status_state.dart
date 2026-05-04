import 'package:basic_diet/domain/model/fulfillment_status_model.dart';
import 'package:equatable/equatable.dart';

enum FulfillmentStatusStateStatus { initial, loading, success, failure }

class FulfillmentStatusState extends Equatable {
  final FulfillmentStatusStateStatus status;
  final FulfillmentStatusModel? data;
  final String? error;
  final bool isPolling;

  const FulfillmentStatusState({
    this.status = FulfillmentStatusStateStatus.initial,
    this.data,
    this.error,
    this.isPolling = false,
  });

  FulfillmentStatusState copyWith({
    FulfillmentStatusStateStatus? status,
    FulfillmentStatusModel? data,
    String? error,
    bool? isPolling,
  }) {
    return FulfillmentStatusState(
      status: status ?? this.status,
      data: data ?? this.data,
      error: error ?? this.error,
      isPolling: isPolling ?? this.isPolling,
    );
  }

  @override
  List<Object?> get props => [status, data, error, isPolling];
}
