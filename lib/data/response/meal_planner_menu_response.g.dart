// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_planner_menu_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealPlannerMenuResponse _$MealPlannerMenuResponseFromJson(
  Map<String, dynamic> json,
) => MealPlannerMenuResponse(
  status: MealPlannerMenuResponse._readOkOrStatus(json, 'status') as bool?,
  message: json['message'] as String?,
  data:
      json['data'] == null
          ? null
          : MealPlannerMenuDataResponse.fromJson(
            json['data'] as Map<String, dynamic>,
          ),
);

Map<String, dynamic> _$MealPlannerMenuResponseToJson(
  MealPlannerMenuResponse instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};

MealPlannerMenuDataResponse _$MealPlannerMenuDataResponseFromJson(
  Map<String, dynamic> json,
) => MealPlannerMenuDataResponse(
  currency: json['currency'] as String?,
  builderCatalog:
      json['builderCatalog'] == null
          ? null
          : BuilderCatalogResponse.fromJson(
            json['builderCatalog'] as Map<String, dynamic>,
          ),
  addons: MealPlannerMenuDataResponse._addonsFromJson(
    MealPlannerMenuDataResponse._readAddonsOrCatalog(json, 'addons'),
  ),
);

Map<String, dynamic> _$MealPlannerMenuDataResponseToJson(
  MealPlannerMenuDataResponse instance,
) => <String, dynamic>{
  'currency': instance.currency,
  'builderCatalog': instance.builderCatalog,
  'addons': instance.addons,
};

MealPlannerAddonsResponse _$MealPlannerAddonsResponseFromJson(
  Map<String, dynamic> json,
) => MealPlannerAddonsResponse(
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => AddOnResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
  byCategory: json['byCategory'] as Map<String, dynamic>?,
  byType: json['byType'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$MealPlannerAddonsResponseToJson(
  MealPlannerAddonsResponse instance,
) => <String, dynamic>{
  'items': instance.items,
  'byCategory': instance.byCategory,
  'byType': instance.byType,
};

BuilderCatalogResponse _$BuilderCatalogResponseFromJson(
  Map<String, dynamic> json,
) => BuilderCatalogResponse(
  categories:
      (json['categories'] as List<dynamic>?)
          ?.map(
            (e) => BuilderCategoryResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
  proteins:
      (json['proteins'] as List<dynamic>?)
          ?.map(
            (e) => BuilderProteinResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
  premiumProteins:
      (json['premiumProteins'] as List<dynamic>?)
          ?.map(
            (e) => BuilderProteinResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
  carbs:
      (json['carbs'] as List<dynamic>?)
          ?.map((e) => BuilderCarbResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
  sandwiches:
      (json['sandwiches'] as List<dynamic>?)
          ?.map(
            (e) => BuilderSandwichResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
  rules:
      json['rules'] == null
          ? null
          : BuilderRulesResponse.fromJson(
            json['rules'] as Map<String, dynamic>,
          ),
  premiumLargeSalad:
      BuilderCatalogResponse._readPremiumLargeSalad(
                json,
                'premiumLargeSalad',
              ) ==
              null
          ? null
          : PremiumLargeSaladResponse.fromJson(
            BuilderCatalogResponse._readPremiumLargeSalad(
                  json,
                  'premiumLargeSalad',
                )
                as Map<String, dynamic>,
          ),
);

Map<String, dynamic> _$BuilderCatalogResponseToJson(
  BuilderCatalogResponse instance,
) => <String, dynamic>{
  'categories': instance.categories,
  'proteins': instance.proteins,
  'premiumProteins': instance.premiumProteins,
  'carbs': instance.carbs,
  'sandwiches': instance.sandwiches,
  'rules': instance.rules,
  'premiumLargeSalad': instance.premiumLargeSalad,
};

PremiumLargeSaladResponse _$PremiumLargeSaladResponseFromJson(
  Map<String, dynamic> json,
) => PremiumLargeSaladResponse(
  id: json['id'] as String?,
  selectionType: json['selectionType'] as String?,
  premiumKey: json['premiumKey'] as String?,
  presetKey: json['presetKey'] as String?,
  name: json['name'] as String?,
  extraFeeHalala: (json['extraFeeHalala'] as num?)?.toInt(),
  currency: json['currency'] as String?,
  preset:
      json['preset'] == null
          ? null
          : PremiumLargeSaladPresetResponse.fromJson(
            json['preset'] as Map<String, dynamic>,
          ),
  ingredients:
      (json['ingredients'] as List<dynamic>?)
          ?.map(
            (e) => PremiumLargeSaladIngredientResponse.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
  groups:
      (json['groups'] as List<dynamic>?)
          ?.map(
            (e) => PremiumLargeSaladGroupRuleResponse.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
);

Map<String, dynamic> _$PremiumLargeSaladResponseToJson(
  PremiumLargeSaladResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'selectionType': instance.selectionType,
  'premiumKey': instance.premiumKey,
  'presetKey': instance.presetKey,
  'name': instance.name,
  'extraFeeHalala': instance.extraFeeHalala,
  'currency': instance.currency,
  'preset': instance.preset,
  'ingredients': instance.ingredients,
  'groups': instance.groups,
};

PremiumLargeSaladPresetResponse _$PremiumLargeSaladPresetResponseFromJson(
  Map<String, dynamic> json,
) => PremiumLargeSaladPresetResponse(
  key: json['key'] as String?,
  name: json['name'] as String?,
  selectionType: json['selectionType'] as String?,
  fixedPriceHalala: (json['fixedPriceHalala'] as num?)?.toInt(),
  currency: json['currency'] as String?,
  groups:
      (json['groups'] as List<dynamic>?)
          ?.map(
            (e) => PremiumLargeSaladGroupRuleResponse.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
);

Map<String, dynamic> _$PremiumLargeSaladPresetResponseToJson(
  PremiumLargeSaladPresetResponse instance,
) => <String, dynamic>{
  'key': instance.key,
  'name': instance.name,
  'selectionType': instance.selectionType,
  'fixedPriceHalala': instance.fixedPriceHalala,
  'currency': instance.currency,
  'groups': instance.groups,
};

PremiumLargeSaladGroupRuleResponse _$PremiumLargeSaladGroupRuleResponseFromJson(
  Map<String, dynamic> json,
) => PremiumLargeSaladGroupRuleResponse(
  key: json['key'] as String?,
  minSelect: (json['minSelect'] as num?)?.toInt(),
  maxSelect: (json['maxSelect'] as num?)?.toInt(),
);

Map<String, dynamic> _$PremiumLargeSaladGroupRuleResponseToJson(
  PremiumLargeSaladGroupRuleResponse instance,
) => <String, dynamic>{
  'key': instance.key,
  'minSelect': instance.minSelect,
  'maxSelect': instance.maxSelect,
};

PremiumLargeSaladIngredientResponse
_$PremiumLargeSaladIngredientResponseFromJson(Map<String, dynamic> json) =>
    PremiumLargeSaladIngredientResponse(
      id: json['id'] as String?,
      groupKey: json['groupKey'] as String?,
      name: json['name'] as String?,
      calories: (json['calories'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PremiumLargeSaladIngredientResponseToJson(
  PremiumLargeSaladIngredientResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'groupKey': instance.groupKey,
  'name': instance.name,
  'calories': instance.calories,
};

BuilderCategoryResponse _$BuilderCategoryResponseFromJson(
  Map<String, dynamic> json,
) => BuilderCategoryResponse(
  json['id'] as String?,
  json['key'] as String?,
  json['dimension'] as String?,
  json['name'] as String?,
  json['description'] as String?,
  (json['sortOrder'] as num?)?.toInt(),
  json['rules'],
);

Map<String, dynamic> _$BuilderCategoryResponseToJson(
  BuilderCategoryResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'key': instance.key,
  'dimension': instance.dimension,
  'name': instance.name,
  'description': instance.description,
  'sortOrder': instance.sortOrder,
  'rules': instance.rules,
};

BuilderProteinResponse _$BuilderProteinResponseFromJson(
  Map<String, dynamic> json,
) => BuilderProteinResponse(
  json['id'] as String?,
  json['displayCategoryId'] as String?,
  json['displayCategoryKey'] as String?,
  json['name'] as String?,
  json['description'] as String?,
  json['proteinFamilyKey'] as String?,
  json['premiumKey'] as String?,
  (json['ruleTags'] as List<dynamic>?)?.map((e) => e as String).toList(),
  json['isPremium'] as bool?,
  (json['premiumCreditCost'] as num?)?.toInt(),
  (json['extraFeeHalala'] as num?)?.toInt(),
  json['currency'] as String?,
  (json['sortOrder'] as num?)?.toInt(),
);

Map<String, dynamic> _$BuilderProteinResponseToJson(
  BuilderProteinResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'displayCategoryId': instance.displayCategoryId,
  'displayCategoryKey': instance.displayCategoryKey,
  'name': instance.name,
  'description': instance.description,
  'proteinFamilyKey': instance.proteinFamilyKey,
  'premiumKey': instance.premiumKey,
  'ruleTags': instance.ruleTags,
  'isPremium': instance.isPremium,
  'premiumCreditCost': instance.premiumCreditCost,
  'extraFeeHalala': instance.extraFeeHalala,
  'currency': instance.currency,
  'sortOrder': instance.sortOrder,
};

BuilderCarbResponse _$BuilderCarbResponseFromJson(Map<String, dynamic> json) =>
    BuilderCarbResponse(
      json['id'] as String?,
      json['displayCategoryId'] as String?,
      json['displayCategoryKey'] as String?,
      json['name'] as String?,
      json['description'] as String?,
      (json['sortOrder'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BuilderCarbResponseToJson(
  BuilderCarbResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'displayCategoryId': instance.displayCategoryId,
  'displayCategoryKey': instance.displayCategoryKey,
  'name': instance.name,
  'description': instance.description,
  'sortOrder': instance.sortOrder,
};

BuilderSandwichResponse _$BuilderSandwichResponseFromJson(
  Map<String, dynamic> json,
) => BuilderSandwichResponse(
  id: json['id'] as String?,
  selectionType: json['selectionType'] as String?,
  name: json['name'] as String?,
  description: json['description'] as String?,
  sortOrder: (json['sortOrder'] as num?)?.toInt(),
);

Map<String, dynamic> _$BuilderSandwichResponseToJson(
  BuilderSandwichResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'selectionType': instance.selectionType,
  'name': instance.name,
  'description': instance.description,
  'sortOrder': instance.sortOrder,
};

BuilderRulesResponse _$BuilderRulesResponseFromJson(
  Map<String, dynamic> json,
) => BuilderRulesResponse(
  version: json['version'] as String?,
  beef:
      json['beef'] == null
          ? null
          : BeefRuleResponse.fromJson(json['beef'] as Map<String, dynamic>),
  maxCarbItemsPerMeal: (json['maxCarbItemsPerMeal'] as num?)?.toInt(),
  maxCarbTotalGrams: (json['maxCarbTotalGrams'] as num?)?.toInt(),
);

Map<String, dynamic> _$BuilderRulesResponseToJson(
  BuilderRulesResponse instance,
) => <String, dynamic>{
  'version': instance.version,
  'beef': instance.beef,
  'maxCarbItemsPerMeal': instance.maxCarbItemsPerMeal,
  'maxCarbTotalGrams': instance.maxCarbTotalGrams,
};

BeefRuleResponse _$BeefRuleResponseFromJson(Map<String, dynamic> json) =>
    BeefRuleResponse(
      proteinFamilyKey: json['proteinFamilyKey'] as String?,
      maxSlotsPerDay: (json['maxSlotsPerDay'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BeefRuleResponseToJson(BeefRuleResponse instance) =>
    <String, dynamic>{
      'proteinFamilyKey': instance.proteinFamilyKey,
      'maxSlotsPerDay': instance.maxSlotsPerDay,
    };
