import 'package:basic_diet/data/network/failure.dart';
import 'package:basic_diet/domain/model/fulfillment_status_model.dart';
import 'package:basic_diet/domain/repository/repository.dart';
import 'package:basic_diet/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class GetDayFulfillmentStatusUseCase
    implements
        BaseUseCase<GetDayFulfillmentStatusUseCaseInput,
            FulfillmentStatusModel> {
  final Repository _repository;

  GetDayFulfillmentStatusUseCase(this._repository);

  @override
  Future<Either<Failure, FulfillmentStatusModel>> execute(
    GetDayFulfillmentStatusUseCaseInput input,
  ) async {
    return await _repository.getDayFulfillmentStatus(
      input.subscriptionId,
      input.date,
    );
  }
}

class GetDayFulfillmentStatusUseCaseInput {
  final String subscriptionId;
  final String date;

  GetDayFulfillmentStatusUseCaseInput(this.subscriptionId, this.date);
}
