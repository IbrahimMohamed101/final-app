import 'package:basic_diet/data/network/failure.dart';
import 'package:basic_diet/domain/model/premium_payment_model.dart';
import 'package:basic_diet/domain/repository/repository.dart';
import 'package:basic_diet/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class CreateUnifiedDayPaymentUseCaseInput {
  final String subscriptionId;
  final String date;
  final String plannerRevisionHash;

  const CreateUnifiedDayPaymentUseCaseInput(
    this.subscriptionId,
    this.date, {
    this.plannerRevisionHash = '',
  });
}

class CreateUnifiedDayPaymentUseCase
    implements
        BaseUseCase<CreateUnifiedDayPaymentUseCaseInput, PremiumPaymentModel> {
  final Repository _repository;

  CreateUnifiedDayPaymentUseCase(this._repository);

  @override
  Future<Either<Failure, PremiumPaymentModel>> execute(
    CreateUnifiedDayPaymentUseCaseInput input,
  ) {
    return _repository.createUnifiedDayPayment(
      input.subscriptionId,
      input.date,
      plannerRevisionHash: input.plannerRevisionHash,
    );
  }
}
