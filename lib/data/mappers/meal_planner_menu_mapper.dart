import 'package:basic_diet/app/constants.dart';
import 'package:basic_diet/app/extensions.dart';
import 'package:basic_diet/data/mappers/addons_mapper.dart';
import 'package:basic_diet/data/response/addons_response.dart';
import 'package:basic_diet/data/response/meal_planner_menu_response.dart';
import 'package:basic_diet/domain/model/add_ons_model.dart';
import 'package:basic_diet/domain/model/meal_planner_menu_model.dart';

extension BuilderCategoryResponseMapper on BuilderCategoryResponse? {
  BuilderCategoryModel toDomain() {
    return BuilderCategoryModel(
      id: this?.id.orEmpty() ?? Constants.empty,
      key: this?.key.orEmpty() ?? Constants.empty,
      dimension: this?.dimension.orEmpty() ?? Constants.empty,
      name: this?.name.orEmpty() ?? Constants.empty,
      description: this?.description.orEmpty() ?? Constants.empty,
      sortOrder: this?.sortOrder.orZero() ?? Constants.zero,
    );
  }
}

extension BuilderProteinResponseMapper on BuilderProteinResponse? {
  BuilderProteinModel toDomain() {
    return BuilderProteinModel(
      id: this?.id.orEmpty() ?? Constants.empty,
      displayCategoryId: this?.displayCategoryId.orEmpty() ?? Constants.empty,
      displayCategoryKey: this?.displayCategoryKey.orEmpty() ?? Constants.empty,
      name: this?.name.orEmpty() ?? Constants.empty,
      description: this?.description.orEmpty() ?? Constants.empty,
      proteinFamilyKey: this?.proteinFamilyKey.orEmpty() ?? Constants.empty,
      premiumKey: this?.premiumKey.orEmpty() ?? Constants.empty,
      ruleTags: this?.ruleTags ?? const [],
      isPremium: this?.isPremium.orFalse() ?? Constants.falseValue,
      premiumCreditCost: this?.premiumCreditCost.orZero() ?? Constants.zero,
      extraFeeHalala: this?.extraFeeHalala.orZero() ?? Constants.zero,
      currency: this?.currency.orEmpty() ?? Constants.empty,
      sortOrder: this?.sortOrder.orZero() ?? Constants.zero,
    );
  }
}

extension BuilderCarbResponseMapper on BuilderCarbResponse? {
  BuilderCarbModel toDomain() {
    return BuilderCarbModel(
      id: this?.id.orEmpty() ?? Constants.empty,
      displayCategoryId: this?.displayCategoryId.orEmpty() ?? Constants.empty,
      displayCategoryKey: this?.displayCategoryKey.orEmpty() ?? Constants.empty,
      name: this?.name.orEmpty() ?? Constants.empty,
      description: this?.description.orEmpty() ?? Constants.empty,
      sortOrder: this?.sortOrder.orZero() ?? Constants.zero,
    );
  }
}

extension BuilderSandwichResponseMapper on BuilderSandwichResponse? {
  BuilderSandwichModel toDomain() {
    return BuilderSandwichModel(
      id: this?.id.orEmpty() ?? Constants.empty,
      selectionType: this?.selectionType.orEmpty() ?? 'sandwich',
      name: this?.name.orEmpty() ?? Constants.empty,
      description: this?.description.orEmpty() ?? Constants.empty,
      sortOrder: this?.sortOrder.orZero() ?? Constants.zero,
    );
  }
}

extension BeefRuleResponseMapper on BeefRuleResponse? {
  BeefRuleModel toDomain() {
    return BeefRuleModel(
      proteinFamilyKey: this?.proteinFamilyKey.orEmpty() ?? Constants.empty,
      maxSlotsPerDay: this?.maxSlotsPerDay.orZero() ?? Constants.zero,
    );
  }
}

extension BuilderRulesResponseMapper on BuilderRulesResponse? {
  BuilderRulesModel toDomain() {
    final self = this;
    return BuilderRulesModel(
      version: self?.version.orEmpty() ?? Constants.empty,
      beef: (self?.beef).toDomain(),
      maxCarbItemsPerMeal: self?.maxCarbItemsPerMeal.orZero() == 0
          ? 2
          : self!.maxCarbItemsPerMeal!,
      maxCarbTotalGrams: self?.maxCarbTotalGrams.orZero() == 0
          ? 300
          : self!.maxCarbTotalGrams!,
    );
  }
}

extension PremiumLargeSaladGroupRuleResponseMapper
    on PremiumLargeSaladGroupRuleResponse? {
  PremiumLargeSaladGroupRuleModel toDomain() {
    return PremiumLargeSaladGroupRuleModel(
      key: this?.key.orEmpty() ?? Constants.empty,
      minSelect: this?.minSelect.orZero() ?? Constants.zero,
      maxSelect: this?.maxSelect.orZero() ?? Constants.zero,
    );
  }
}

extension PremiumLargeSaladIngredientResponseMapper
    on PremiumLargeSaladIngredientResponse? {
  PremiumLargeSaladIngredientModel toDomain() {
    return PremiumLargeSaladIngredientModel(
      id: this?.id.orEmpty() ?? Constants.empty,
      groupKey: this?.groupKey.orEmpty() ?? Constants.empty,
      name: this?.name.orEmpty() ?? Constants.empty,
      calories: this?.calories.orZero() ?? Constants.zero,
    );
  }
}

extension PremiumLargeSaladPresetResponseMapper on PremiumLargeSaladPresetResponse? {
  PremiumLargeSaladPresetModel toDomain() {
    return PremiumLargeSaladPresetModel(
      key: this?.key.orEmpty() ?? Constants.empty,
      name: this?.name.orEmpty() ?? Constants.empty,
      selectionType: this?.selectionType.orEmpty() ?? 'premium_large_salad',
      fixedPriceHalala: this?.fixedPriceHalala.orZero() ?? Constants.zero,
      currency: this?.currency.orEmpty() ?? 'SAR',
      groups: (this?.groups?.map((e) => e.toDomain()).toList()) ?? const [],
    );
  }
}

extension PremiumLargeSaladResponseMapper on PremiumLargeSaladResponse? {
  PremiumLargeSaladModel toDomain() {
    return PremiumLargeSaladModel(
      id: this?.id.orEmpty() ?? 'premium_large_salad',
      selectionType: this?.selectionType.orEmpty() ?? 'premium_large_salad',
      premiumKey: this?.premiumKey.orEmpty() ?? 'custom_premium_salad',
      presetKey: this?.presetKey.orEmpty() ?? 'large_salad',
      name: this?.name.orEmpty() ?? Constants.empty,
      extraFeeHalala: this?.extraFeeHalala.orZero() ?? Constants.zero,
      currency: this?.currency.orEmpty() ?? 'SAR',
      preset: (this?.preset).toDomain(),
      ingredients: (this?.ingredients?.map((e) => e.toDomain()).toList()) ?? const [],
      groups: (this?.groups?.map((e) => e.toDomain()).toList()) ?? const [],
    );
  }
}

extension BuilderCatalogResponseMapper on BuilderCatalogResponse? {
  BuilderCatalogModel toDomain() {
    final self = this;
    return BuilderCatalogModel(
      categories: (self?.categories?.map((e) => e.toDomain()).toList()) ?? [],
      proteins: (self?.proteins?.map((e) => e.toDomain()).toList()) ?? [],
      premiumProteins:
          (self?.premiumProteins?.map((e) => e.toDomain()).toList()) ?? [],
      carbs: (self?.carbs?.map((e) => e.toDomain()).toList()) ?? [],
      sandwiches:
          (self?.sandwiches?.map((e) => e.toDomain()).toList()) ?? [],
      rules: (self?.rules).toDomain(),
      premiumLargeSalad: self?.premiumLargeSalad?.toDomain(),
    );
  }
}

extension MealPlannerMenuResponseMapper on MealPlannerMenuResponse? {
  MealPlannerMenuModel toDomain() {
    final self = this;
    final addonItems = self?.data?.addons?.items
            ?.map((e) => e.toDomain())
            .where((addon) => addon.isItem && addon.isFlatOnce)
            .toList() ??
        const <AddOnModel>[];
    final addonMap = {
      for (final addon in addonItems) addon.id: addon,
    };
    final grouped = <String, List<AddOnModel>>{};
    final byCategory = self?.data?.addons?.byCategory ?? const <String, dynamic>{};

    for (final entry in byCategory.entries) {
      final resolved = <AddOnModel>[];
      if (entry.value is List) {
        for (final item in entry.value as List<dynamic>) {
          if (item is String && addonMap.containsKey(item)) {
            resolved.add(addonMap[item]!);
          } else if (item is Map<String, dynamic>) {
            final addon = AddOnResponse.fromJson(item).toDomain();
            if (addon.isItem && addon.isFlatOnce) {
              resolved.add(addon);
            }
          }
        }
      }
      grouped[entry.key] = resolved;
    }

    for (final addon in addonItems) {
      final categoryItems =
          grouped.putIfAbsent(addon.category, () => <AddOnModel>[]);
      if (!categoryItems.any((item) => item.id == addon.id)) {
        categoryItems.add(addon);
      }
    }

    return MealPlannerMenuModel(
      currency: self?.data?.currency.orEmpty() ?? Constants.empty,
      builderCatalog: (self?.data?.builderCatalog).toDomain(),
      addons: addonItems,
      addonsByCategory: grouped,
    );
  }
}
