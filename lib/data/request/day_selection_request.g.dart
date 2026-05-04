// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_selection_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DaySelectionRequest _$DaySelectionRequestFromJson(Map<String, dynamic> json) =>
    DaySelectionRequest(
      (json['mealSlots'] as List<dynamic>)
          .map((e) => MealSlotRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      addonsOneTime:
          (json['addonsOneTime'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$DaySelectionRequestToJson(
  DaySelectionRequest instance,
) => <String, dynamic>{
  'mealSlots': instance.mealSlots,
  'addonsOneTime': instance.addonsOneTime,
};

MealSlotRequest _$MealSlotRequestFromJson(Map<String, dynamic> json) =>
    MealSlotRequest(
      slotIndex: (json['slotIndex'] as num).toInt(),
      slotKey: json['slotKey'] as String?,
      selectionType: json['selectionType'] as String?,
      proteinId: json['proteinId'] as String?,
      carbs:
          (json['carbs'] as List<dynamic>?)
              ?.map(
                (e) => MealSlotCarbRequest.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
      sandwichId: json['sandwichId'] as String?,
      salad:
          json['salad'] == null
              ? null
              : SaladRequest.fromJson(json['salad'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MealSlotRequestToJson(MealSlotRequest instance) =>
    <String, dynamic>{
      'slotIndex': instance.slotIndex,
      if (instance.slotKey case final value?) 'slotKey': value,
      if (instance.selectionType case final value?) 'selectionType': value,
      if (instance.proteinId case final value?) 'proteinId': value,
      if (instance.carbs case final value?) 'carbs': value,
      if (instance.sandwichId case final value?) 'sandwichId': value,
      if (instance.salad case final value?) 'salad': value,
    };

MealSlotCarbRequest _$MealSlotCarbRequestFromJson(Map<String, dynamic> json) =>
    MealSlotCarbRequest(
      carbId: json['carbId'] as String,
      grams: (json['grams'] as num).toInt(),
    );

Map<String, dynamic> _$MealSlotCarbRequestToJson(
  MealSlotCarbRequest instance,
) => <String, dynamic>{'carbId': instance.carbId, 'grams': instance.grams};

SaladRequest _$SaladRequestFromJson(Map<String, dynamic> json) => SaladRequest(
  presetKey: json['presetKey'] as String,
  groups: SaladGroupsRequest.fromJson(json['groups'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SaladRequestToJson(SaladRequest instance) =>
    <String, dynamic>{
      'presetKey': instance.presetKey,
      'groups': instance.groups,
    };

SaladGroupsRequest _$SaladGroupsRequestFromJson(
  Map<String, dynamic> json,
) => SaladGroupsRequest(
  leafyGreens:
      (json['leafy_greens'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  vegetables:
      (json['vegetables'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  protein:
      (json['protein'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  cheeseNuts:
      (json['cheese_nuts'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  fruits:
      (json['fruits'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  sauce:
      (json['sauce'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
);

Map<String, dynamic> _$SaladGroupsRequestToJson(SaladGroupsRequest instance) =>
    <String, dynamic>{
      'leafy_greens': instance.leafyGreens,
      'vegetables': instance.vegetables,
      'protein': instance.protein,
      'cheese_nuts': instance.cheeseNuts,
      'fruits': instance.fruits,
      'sauce': instance.sauce,
    };
