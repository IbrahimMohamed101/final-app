import 'package:basic_diet/data/mappers/addons_mapper.dart';
import 'package:basic_diet/data/response/addons_response.dart';
import 'package:basic_diet/data/response/subscription_menu_response.dart';
import 'package:basic_diet/domain/model/add_ons_model.dart';
import 'package:basic_diet/domain/model/subscription_menu_model.dart';

extension SubscriptionMenuResponseMapper on SubscriptionMenuResponse? {
  SubscriptionMenuModel toDomain() {
    final self = this;
    final List<AddOnModel> planAddons = self?.data?.addons
            ?.map((e) => e.toDomain())
            .where((a) => a.isPlan)
            .toList() ??
        const [];

    final Map<String, List<AddOnModel>> addonsByType = _parseAddonsByType(
      self?.data?.addonsByType,
    );

    final List<AddOnModel> mealPlannerAddons = self
                ?.data?.mealPlanner?.addons?.items
                ?.map((e) => e.toDomain())
                .where((a) => a.isItem && a.isFlatOnce)
                .toList() ??
            const [];

    final Map<String, List<AddOnModel>> mealPlannerAddonsByType =
        _parseAddonsByType(
      self?.data?.mealPlanner?.addons?.byType,
    );

    return SubscriptionMenuModel(
      addons: planAddons,
      addonsByType: addonsByType,
      mealPlannerAddons: mealPlannerAddons,
      mealPlannerAddonsByType: mealPlannerAddonsByType,
    );
  }
}

Map<String, List<AddOnModel>> _parseAddonsByType(Map<String, dynamic>? raw) {
  if (raw == null) return const {};
  final result = <String, List<AddOnModel>>{};
  for (final entry in raw.entries) {
    final value = entry.value;
    if (value is List) {
      result[entry.key] = value
          .whereType<Map<String, dynamic>>()
          .map((e) => AddOnResponse.fromJson(e).toDomain())
          .where((a) => a.kind.isNotEmpty)
          .toList();
    }
  }
  return result;
}