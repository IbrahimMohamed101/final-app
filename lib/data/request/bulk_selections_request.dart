import 'package:basic_diet/data/request/day_selection_request.dart'
    show MealSlotCarbRequest, SaladRequest;
import 'package:json_annotation/json_annotation.dart';

part 'bulk_selections_request.g.dart';

@JsonSerializable()
class BulkSelectionsRequest {
  @JsonKey(name: "days")
  List<BulkSelectionDayRequest> days;

  BulkSelectionsRequest({required this.days});

  factory BulkSelectionsRequest.fromJson(Map<String, dynamic> json) =>
      _$BulkSelectionsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$BulkSelectionsRequestToJson(this);
}

@JsonSerializable()
class BulkSelectionDayRequest {
  @JsonKey(name: "date")
  String date;

  @JsonKey(name: "mealSlots")
  List<MealSlotRequest> mealSlots;

  BulkSelectionDayRequest({required this.date, required this.mealSlots});

  factory BulkSelectionDayRequest.fromJson(Map<String, dynamic> json) =>
      _$BulkSelectionDayRequestFromJson(json);

  Map<String, dynamic> toJson() => _$BulkSelectionDayRequestToJson(this);
}

@JsonSerializable(includeIfNull: false)
class MealSlotRequest {
  @JsonKey(name: "slotIndex")
  int slotIndex;

  @JsonKey(name: "slotKey")
  String? slotKey;

  @JsonKey(name: "selectionType")
  String? selectionType;

  @JsonKey(name: "proteinId")
  String? proteinId;

  @JsonKey(name: "carbs")
  List<MealSlotCarbRequest>? carbs;

  @JsonKey(name: "sandwichId")
  String? sandwichId;

  @JsonKey(name: "salad")
  SaladRequest? salad;

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
