import 'package:basic_diet/domain/model/add_ons_model.dart';
import 'package:basic_diet/domain/usecase/get_subscription_menu_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'add_ons_event.dart';
import 'add_ons_state.dart';

class AddOnsBloc extends Bloc<AddOnsEvent, AddOnsState> {
  final GetSubscriptionMenuUseCase _getSubscriptionMenuUseCase;

  AddOnsBloc(this._getSubscriptionMenuUseCase) : super(const AddOnsInitial()) {
    on<GetAddOnsEvent>(_onGetAddOns);
    on<ToggleAddOnSelectionEvent>(_onToggleSelection);
  }

  Future<void> _onGetAddOns(
    GetAddOnsEvent event,
    Emitter<AddOnsState> emit,
  ) async {
    emit(const AddOnsLoading());
    final result = await _getSubscriptionMenuUseCase.execute(null);
    result.fold(
      (failure) => emit(AddOnsError(failure.message)),
      (menuModel) {
        final planAddOns = AddOnsModel(addOns: menuModel.addons);
        emit(AddOnsSuccess(planAddOns));
      },
    );
  }

  void _onToggleSelection(
    ToggleAddOnSelectionEvent event,
    Emitter<AddOnsState> emit,
  ) {
    if (state is AddOnsSuccess) {
      final successState = state as AddOnsSuccess;
      final selected = Set.of(successState.selectedAddOns);
      if (selected.contains(event.addOn)) {
        selected.remove(event.addOn);
      } else {
        selected.add(event.addOn);
      }
      emit(successState.copyWith(selectedAddOns: selected));
    }
  }
}