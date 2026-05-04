import 'package:basic_diet/domain/model/add_ons_model.dart';

class MealPlannerMenuModel {
  final String currency;
  final BuilderCatalogModel builderCatalog;
  final List<AddOnModel> addons;
  final Map<String, List<AddOnModel>> addonsByCategory;

  MealPlannerMenuModel({
    required this.currency,
    required this.builderCatalog,
    this.addons = const [],
    this.addonsByCategory = const {},
  });
}

class BuilderCatalogModel {
  final List<BuilderCategoryModel> categories;
  final List<BuilderProteinModel> proteins;
  final List<BuilderProteinModel> premiumProteins;
  final List<BuilderCarbModel> carbs;
  final List<BuilderSandwichModel> sandwiches;
  final BuilderRulesModel rules;
  final PremiumLargeSaladModel? premiumLargeSalad;

  BuilderCatalogModel({
    required this.categories,
    required this.proteins,
    required this.premiumProteins,
    required this.carbs,
    required this.sandwiches,
    required this.rules,
    this.premiumLargeSalad,
  });

  List<BuilderProteinModel> get allProteins => [...proteins, ...premiumProteins];

  List<BuilderProteinModel> get allSaladProteins => allProteins;
}

class BuilderCategoryModel {
  final String id;
  final String key;
  final String dimension;
  final String name;
  final String description;
  final int sortOrder;

  BuilderCategoryModel({
    required this.id,
    required this.key,
    required this.dimension,
    required this.name,
    required this.description,
    required this.sortOrder,
  });
}

class BuilderProteinModel {
  final String id;
  final String displayCategoryId;
  final String displayCategoryKey;
  final String name;
  final String description;
  final String proteinFamilyKey;
  final String premiumKey;
  final List<String> ruleTags;
  final bool isPremium;
  final int premiumCreditCost;
  final int extraFeeHalala;
  final String currency;
  final int sortOrder;

  BuilderProteinModel({
    required this.id,
    required this.displayCategoryId,
    required this.displayCategoryKey,
    required this.name,
    required this.description,
    required this.proteinFamilyKey,
    this.premiumKey = '',
    required this.ruleTags,
    required this.isPremium,
    required this.premiumCreditCost,
    required this.extraFeeHalala,
    required this.currency,
    required this.sortOrder,
  });
}

class BuilderCarbModel {
  final String id;
  final String displayCategoryId;
  final String displayCategoryKey;
  final String name;
  final String description;
  final int sortOrder;

  BuilderCarbModel({
    required this.id,
    required this.displayCategoryId,
    required this.displayCategoryKey,
    required this.name,
    required this.description,
    required this.sortOrder,
  });
}

class BuilderSandwichModel {
  final String id;
  final String selectionType;
  final String name;
  final String description;
  final int sortOrder;

  BuilderSandwichModel({
    required this.id,
    required this.selectionType,
    required this.name,
    required this.description,
    required this.sortOrder,
  });
}

class BuilderRulesModel {
  final String version;
  final BeefRuleModel beef;
  final int maxCarbItemsPerMeal;
  final int maxCarbTotalGrams;

  BuilderRulesModel({
    required this.version,
    required this.beef,
    this.maxCarbItemsPerMeal = 2,
    this.maxCarbTotalGrams = 300,
  });
}

class BeefRuleModel {
  final String proteinFamilyKey;
  final int maxSlotsPerDay;

  BeefRuleModel({required this.proteinFamilyKey, required this.maxSlotsPerDay});
}

class PremiumLargeSaladModel {
  final String id;
  final String selectionType;
  final String premiumKey;
  final String presetKey;
  final String name;
  final int extraFeeHalala;
  final String currency;
  final PremiumLargeSaladPresetModel preset;
  final List<PremiumLargeSaladIngredientModel> ingredients;
  final List<PremiumLargeSaladGroupRuleModel> groups;

  PremiumLargeSaladModel({
    required this.id,
    required this.selectionType,
    required this.premiumKey,
    required this.presetKey,
    required this.name,
    required this.extraFeeHalala,
    required this.currency,
    required this.preset,
    required this.ingredients,
    required this.groups,
  });
}

class PremiumLargeSaladPresetModel {
  final String key;
  final String name;
  final String selectionType;
  final int fixedPriceHalala;
  final String currency;
  final List<PremiumLargeSaladGroupRuleModel> groups;

  PremiumLargeSaladPresetModel({
    required this.key,
    required this.name,
    required this.selectionType,
    required this.fixedPriceHalala,
    required this.currency,
    required this.groups,
  });
}

class PremiumLargeSaladGroupRuleModel {
  final String key;
  final int minSelect;
  final int maxSelect;

  PremiumLargeSaladGroupRuleModel({
    required this.key,
    required this.minSelect,
    required this.maxSelect,
  });
}

class PremiumLargeSaladIngredientModel {
  final String id;
  final String groupKey;
  final String name;
  final int calories;

  PremiumLargeSaladIngredientModel({
    required this.id,
    required this.groupKey,
    required this.name,
    required this.calories,
  });
}
