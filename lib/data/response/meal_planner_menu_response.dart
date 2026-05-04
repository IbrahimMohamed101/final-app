import 'package:basic_diet/data/response/addons_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meal_planner_menu_response.g.dart';

@JsonSerializable()
class MealPlannerMenuResponse {
  @JsonKey(name: 'status', readValue: _readOkOrStatus)
  final bool? status;

  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'data')
  final MealPlannerMenuDataResponse? data;

  const MealPlannerMenuResponse({this.status, this.message, this.data});

  static Object? _readOkOrStatus(Map json, String key) {
    final ok = json['ok'];
    if (ok is bool) return ok;
    final status = json[key];
    if (status is bool) return status;
    if (status is num) return status >= 200 && status < 300;
    return false;
  }

  factory MealPlannerMenuResponse.fromJson(Map<String, dynamic> json) =>
      _$MealPlannerMenuResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MealPlannerMenuResponseToJson(this);
}

@JsonSerializable()
class MealPlannerMenuDataResponse {
  @JsonKey(name: 'currency')
  final String? currency;

  @JsonKey(name: 'builderCatalog')
  final BuilderCatalogResponse? builderCatalog;

  @JsonKey(name: 'addons', readValue: _readAddonsOrCatalog, fromJson: _addonsFromJson)
  final MealPlannerAddonsResponse? addons;

  const MealPlannerMenuDataResponse({
    this.currency,
    this.builderCatalog,
    this.addons,
  });

  static Object? _readAddonsOrCatalog(Map json, String key) {
    return json[key] ?? json['addonCatalog'];
  }

  static MealPlannerAddonsResponse? _addonsFromJson(Object? json) {
    if (json is! Map<String, dynamic>) return null;
    return MealPlannerAddonsResponse.fromJson(json);
  }

  factory MealPlannerMenuDataResponse.fromJson(Map<String, dynamic> json) =>
      _$MealPlannerMenuDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MealPlannerMenuDataResponseToJson(this);
}

@JsonSerializable()
class MealPlannerAddonsResponse {
  @JsonKey(name: 'items')
  final List<AddOnResponse>? items;

  @JsonKey(name: 'byCategory')
  final Map<String, dynamic>? byCategory;

  @JsonKey(name: 'byType')
  final Map<String, dynamic>? byType;

  const MealPlannerAddonsResponse({this.items, this.byCategory, this.byType});

  factory MealPlannerAddonsResponse.fromJson(Map<String, dynamic> json) =>
      _$MealPlannerAddonsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MealPlannerAddonsResponseToJson(this);
}

@JsonSerializable()
class BuilderCatalogResponse {
  @JsonKey(name: 'categories')
  final List<BuilderCategoryResponse>? categories;

  @JsonKey(name: 'proteins')
  final List<BuilderProteinResponse>? proteins;

  @JsonKey(name: 'premiumProteins')
  final List<BuilderProteinResponse>? premiumProteins;

  @JsonKey(name: 'carbs')
  final List<BuilderCarbResponse>? carbs;

  @JsonKey(name: 'sandwiches')
  final List<BuilderSandwichResponse>? sandwiches;

  @JsonKey(name: 'rules')
  final BuilderRulesResponse? rules;

  @JsonKey(name: 'premiumLargeSalad', readValue: _readPremiumLargeSalad)
  final PremiumLargeSaladResponse? premiumLargeSalad;

  const BuilderCatalogResponse({
    this.categories,
    this.proteins,
    this.premiumProteins,
    this.carbs,
    this.sandwiches,
    this.rules,
    this.premiumLargeSalad,
  });

  static Object? _readPremiumLargeSalad(Map json, String key) {
    return json[key] ?? json['customPremiumSalad'];
  }

  factory BuilderCatalogResponse.fromJson(Map<String, dynamic> json) =>
      _$BuilderCatalogResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BuilderCatalogResponseToJson(this);
}

@JsonSerializable()
class PremiumLargeSaladResponse {
  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'selectionType')
  final String? selectionType;

  @JsonKey(name: 'premiumKey')
  final String? premiumKey;

  @JsonKey(name: 'presetKey')
  final String? presetKey;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'extraFeeHalala')
  final int? extraFeeHalala;

  @JsonKey(name: 'currency')
  final String? currency;

  @JsonKey(name: 'preset')
  final PremiumLargeSaladPresetResponse? preset;

  @JsonKey(name: 'ingredients')
  final List<PremiumLargeSaladIngredientResponse>? ingredients;

  @JsonKey(name: 'groups')
  final List<PremiumLargeSaladGroupRuleResponse>? groups;

  const PremiumLargeSaladResponse({
    this.id,
    this.selectionType,
    this.premiumKey,
    this.presetKey,
    this.name,
    this.extraFeeHalala,
    this.currency,
    this.preset,
    this.ingredients,
    this.groups,
  });

  factory PremiumLargeSaladResponse.fromJson(Map<String, dynamic> json) =>
      _$PremiumLargeSaladResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PremiumLargeSaladResponseToJson(this);
}

@JsonSerializable()
class PremiumLargeSaladPresetResponse {
  @JsonKey(name: 'key')
  final String? key;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'selectionType')
  final String? selectionType;

  @JsonKey(name: 'fixedPriceHalala')
  final int? fixedPriceHalala;

  @JsonKey(name: 'currency')
  final String? currency;

  @JsonKey(name: 'groups')
  final List<PremiumLargeSaladGroupRuleResponse>? groups;

  const PremiumLargeSaladPresetResponse({
    this.key,
    this.name,
    this.selectionType,
    this.fixedPriceHalala,
    this.currency,
    this.groups,
  });

  factory PremiumLargeSaladPresetResponse.fromJson(Map<String, dynamic> json) =>
      _$PremiumLargeSaladPresetResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PremiumLargeSaladPresetResponseToJson(this);
}

@JsonSerializable()
class PremiumLargeSaladGroupRuleResponse {
  @JsonKey(name: 'key')
  final String? key;

  @JsonKey(name: 'minSelect')
  final int? minSelect;

  @JsonKey(name: 'maxSelect')
  final int? maxSelect;

  const PremiumLargeSaladGroupRuleResponse({
    this.key,
    this.minSelect,
    this.maxSelect,
  });

  factory PremiumLargeSaladGroupRuleResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$PremiumLargeSaladGroupRuleResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PremiumLargeSaladGroupRuleResponseToJson(this);
}

@JsonSerializable()
class PremiumLargeSaladIngredientResponse {
  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'groupKey')
  final String? groupKey;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'calories')
  final int? calories;

  const PremiumLargeSaladIngredientResponse({
    this.id,
    this.groupKey,
    this.name,
    this.calories,
  });

  factory PremiumLargeSaladIngredientResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$PremiumLargeSaladIngredientResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PremiumLargeSaladIngredientResponseToJson(this);
}

@JsonSerializable()
class BuilderCategoryResponse {
  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'key')
  final String? key;

  @JsonKey(name: 'dimension')
  final String? dimension;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'sortOrder')
  final int? sortOrder;

  @JsonKey(name: 'rules')
  final dynamic rules;

  const BuilderCategoryResponse(
    this.id,
    this.key,
    this.dimension,
    this.name,
    this.description,
    this.sortOrder,
    this.rules,
  );

  factory BuilderCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$BuilderCategoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BuilderCategoryResponseToJson(this);
}

@JsonSerializable()
class BuilderProteinResponse {
  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'displayCategoryId')
  final String? displayCategoryId;

  @JsonKey(name: 'displayCategoryKey')
  final String? displayCategoryKey;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'proteinFamilyKey')
  final String? proteinFamilyKey;

  @JsonKey(name: 'premiumKey')
  final String? premiumKey;

  @JsonKey(name: 'ruleTags')
  final List<String>? ruleTags;

  @JsonKey(name: 'isPremium')
  final bool? isPremium;

  @JsonKey(name: 'premiumCreditCost')
  final int? premiumCreditCost;

  @JsonKey(name: 'extraFeeHalala')
  final int? extraFeeHalala;

  @JsonKey(name: 'currency')
  final String? currency;

  @JsonKey(name: 'sortOrder')
  final int? sortOrder;

  const BuilderProteinResponse(
    this.id,
    this.displayCategoryId,
    this.displayCategoryKey,
    this.name,
    this.description,
    this.proteinFamilyKey,
    this.premiumKey,
    this.ruleTags,
    this.isPremium,
    this.premiumCreditCost,
    this.extraFeeHalala,
    this.currency,
    this.sortOrder,
  );

  factory BuilderProteinResponse.fromJson(Map<String, dynamic> json) =>
      _$BuilderProteinResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BuilderProteinResponseToJson(this);
}

@JsonSerializable()
class BuilderCarbResponse {
  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'displayCategoryId')
  final String? displayCategoryId;

  @JsonKey(name: 'displayCategoryKey')
  final String? displayCategoryKey;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'sortOrder')
  final int? sortOrder;

  const BuilderCarbResponse(
    this.id,
    this.displayCategoryId,
    this.displayCategoryKey,
    this.name,
    this.description,
    this.sortOrder,
  );

  factory BuilderCarbResponse.fromJson(Map<String, dynamic> json) =>
      _$BuilderCarbResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BuilderCarbResponseToJson(this);
}

@JsonSerializable()
class BuilderSandwichResponse {
  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'selectionType')
  final String? selectionType;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'sortOrder')
  final int? sortOrder;

  const BuilderSandwichResponse({
    this.id,
    this.selectionType,
    this.name,
    this.description,
    this.sortOrder,
  });

  factory BuilderSandwichResponse.fromJson(Map<String, dynamic> json) =>
      _$BuilderSandwichResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BuilderSandwichResponseToJson(this);
}

@JsonSerializable()
class BuilderRulesResponse {
  @JsonKey(name: 'version')
  final String? version;

  @JsonKey(name: 'beef')
  final BeefRuleResponse? beef;

  @JsonKey(name: 'maxCarbItemsPerMeal')
  final int? maxCarbItemsPerMeal;

  @JsonKey(name: 'maxCarbTotalGrams')
  final int? maxCarbTotalGrams;

  const BuilderRulesResponse({
    this.version,
    this.beef,
    this.maxCarbItemsPerMeal,
    this.maxCarbTotalGrams,
  });

  factory BuilderRulesResponse.fromJson(Map<String, dynamic> json) =>
      _$BuilderRulesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BuilderRulesResponseToJson(this);
}

@JsonSerializable()
class BeefRuleResponse {
  @JsonKey(name: 'proteinFamilyKey')
  final String? proteinFamilyKey;

  @JsonKey(name: 'maxSlotsPerDay')
  final int? maxSlotsPerDay;

  const BeefRuleResponse({this.proteinFamilyKey, this.maxSlotsPerDay});

  factory BeefRuleResponse.fromJson(Map<String, dynamic> json) =>
      _$BeefRuleResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BeefRuleResponseToJson(this);
}
