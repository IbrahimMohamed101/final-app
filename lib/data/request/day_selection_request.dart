import 'package:json_annotation/json_annotation.dart';

part 'day_selection_request.g.dart';

@JsonSerializable()
class DaySelectionRequest {
  @JsonKey(name: "mealSlots")
  final List<MealSlotRequest> mealSlots;

  @JsonKey(name: "addonsOneTime")
  final List<String> addonsOneTime;

  DaySelectionRequest(this.mealSlots, {this.addonsOneTime = const []});

  factory DaySelectionRequest.fromJson(Map<String, dynamic> json) =>
      _$DaySelectionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DaySelectionRequestToJson(this);
}

@JsonSerializable(includeIfNull: false)
class MealSlotRequest {
  @JsonKey(name: "slotIndex")
  final int slotIndex;

  @JsonKey(name: "slotKey")
  final String? slotKey;

  @JsonKey(name: "selectionType")
  final String? selectionType;

  @JsonKey(name: "proteinId")
  final String? proteinId;

  @JsonKey(name: "carbs")
  final List<MealSlotCarbRequest>? carbs;

  @JsonKey(name: "sandwichId")
  final String? sandwichId;

  @JsonKey(name: "salad")
  final SaladRequest? salad;

  MealSlotRequest({
    required this.slotIndex,
    this.slotKey,
    this.selectionType,
    this.proteinId,
    this.carbs,
    this.sandwichId,
    this.salad,
  });

  factory MealSlotRequest.fromJson(Map<String, dynamic> json) =>
      _$MealSlotRequestFromJson(json);

  Map<String, dynamic> toJson() => _$MealSlotRequestToJson(this);
}

@JsonSerializable()
class MealSlotCarbRequest {
  @JsonKey(name: "carbId")
  final String carbId;

  @JsonKey(name: "grams")
  final int grams;

  const MealSlotCarbRequest({required this.carbId, required this.grams});

  factory MealSlotCarbRequest.fromJson(Map<String, dynamic> json) =>
      _$MealSlotCarbRequestFromJson(json);

  Map<String, dynamic> toJson() => _$MealSlotCarbRequestToJson(this);
}

@JsonSerializable()
class SaladRequest {
  @JsonKey(name: 'presetKey')
  final String presetKey;

  @JsonKey(name: 'groups')
  final SaladGroupsRequest groups;

  const SaladRequest({required this.presetKey, required this.groups});

  factory SaladRequest.fromJson(Map<String, dynamic> json) =>
      _$SaladRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SaladRequestToJson(this);
}

@JsonSerializable()
class SaladGroupsRequest {
  @JsonKey(name: 'leafy_greens')
  final List<String> leafyGreens;

  @JsonKey(name: 'vegetables')
  final List<String> vegetables;

  @JsonKey(name: 'protein')
  final List<String> protein;

  @JsonKey(name: 'cheese_nuts')
  final List<String> cheeseNuts;

  @JsonKey(name: 'fruits')
  final List<String> fruits;

  @JsonKey(name: 'sauce')
  final List<String> sauce;

  const SaladGroupsRequest({
    this.leafyGreens = const [],
    this.vegetables = const [],
    this.protein = const [],
    this.cheeseNuts = const [],
    this.fruits = const [],
    this.sauce = const [],
  });

  factory SaladGroupsRequest.fromJson(Map<String, dynamic> json) =>
      _$SaladGroupsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SaladGroupsRequestToJson(this);
}
