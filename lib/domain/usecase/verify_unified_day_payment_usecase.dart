import 'package:basic_diet/data/network/failure.dart';
import 'package:basic_diet/domain/model/premium_payment_model.dart';
import 'package:basic_diet/domain/repository/repository.dart';
import 'package:basic_diet/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class VerifyUnifiedDayPaymentUseCaseInput {
  final String subscriptionId;
  final String date;
  final String paymentId;

  const VerifyUnifiedDayPaymentUseCaseInput(
    this.subscriptionId,
    this.date,
    this.paymentId,
  );
}

class VerifyUnifiedDayPaymentUseCase
    implements
        BaseUseCase<
          VerifyUnifiedDayPaymentUseCaseInput,
          PremiumPaymentVerificationModel
        > {
  final Repository _repository;

  VerifyUnifiedDayPaymentUseCase(this._repository);

  @override
  Future<Either<Failure, PremiumPaymentVerificationModel>> execute(
    VerifyUnifiedDayPaymentUseCaseInput input,
  ) {
    return _repository.verifyUnifiedDayPayment(
      input.subscriptionId,
      input.date,
      input.paymentId,
    );
  }
}
