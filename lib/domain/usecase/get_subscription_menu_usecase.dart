import 'package:basic_diet/data/network/failure.dart';
import 'package:basic_diet/domain/model/subscription_menu_model.dart';
import 'package:basic_diet/domain/repository/repository.dart';
import 'package:basic_diet/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class GetSubscriptionMenuUseCase extends BaseUseCase<void, SubscriptionMenuModel> {
  final Repository _repository;

  GetSubscriptionMenuUseCase(this._repository);

  @override
  Future<Either<Failure, SubscriptionMenuModel>> execute(void input) async {
    return await _repository.getSubscriptionMenu();
  }
}