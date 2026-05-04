import 'package:basic_diet/domain/model/add_ons_model.dart';
import 'package:equatable/equatable.dart';

class SubscriptionMenuModel extends Equatable {
  final List<AddOnModel> addons;
  final Map<String, List<AddOnModel>> addonsByType;
  final List<AddOnModel> mealPlannerAddons;
  final Map<String, List<AddOnModel>> mealPlannerAddonsByType;

  const SubscriptionMenuModel({
    this.addons = const [],
    this.addonsByType = const {},
    this.mealPlannerAddons = const [],
    this.mealPlannerAddonsByType = const {},
  });

  List<AddOnModel> get planAddons =>
      addons.where((a) => a.isPlan).toList();

  @override
  List<Object?> get props => [
        addons,
        addonsByType,
        mealPlannerAddons,
        mealPlannerAddonsByType,
      ];
}