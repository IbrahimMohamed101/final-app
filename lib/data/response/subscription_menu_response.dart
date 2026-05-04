import 'package:basic_diet/data/response/addons_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subscription_menu_response.g.dart';

@JsonSerializable()
class SubscriptionMenuResponse {
  @JsonKey(name: "status", readValue: _readOkOrStatus)
  dynamic status;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "data")
  SubscriptionMenuDataResponse? data;

  SubscriptionMenuResponse({this.status, this.message, this.data});

  static Object? _readOkOrStatus(Map<dynamic, dynamic> json, String key) {
    final value = json['ok'] ?? json['status'];
    if (value is bool) return value;
    if (value is num) {
      if (value == 1) return true;
      if (value == 0) return false;
      return value;
    }
    if (value is String) {
      final normalized = value.trim().toLowerCase();
      if (normalized == 'true' || normalized == '1') return true;
      if (normalized == 'false' || normalized == '0') return false;
    }
    return value;
  }

  factory SubscriptionMenuResponse.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionMenuResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SubscriptionMenuResponseToJson(this);
}

@JsonSerializable()
class SubscriptionMenuDataResponse {
  @JsonKey(name: "addons")
  List<AddOnResponse>? addons;

  @JsonKey(name: "addonsByType")
  Map<String, dynamic>? addonsByType;

  @JsonKey(name: "mealPlanner")
  SubscriptionMenuMealPlannerResponse? mealPlanner;

  SubscriptionMenuDataResponse({
    this.addons,
    this.addonsByType,
    this.mealPlanner,
  });

  factory SubscriptionMenuDataResponse.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionMenuDataResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SubscriptionMenuDataResponseToJson(this);
}

@JsonSerializable()
class SubscriptionMenuMealPlannerResponse {
  @JsonKey(name: "addons")
  SubscriptionMenuMealPlannerAddonsResponse? addons;

  SubscriptionMenuMealPlannerResponse({this.addons});

  factory SubscriptionMenuMealPlannerResponse.fromJson(
          Map<String, dynamic> json) =>
      _$SubscriptionMenuMealPlannerResponseFromJson(json);
  Map<String, dynamic> toJson() =>
      _$SubscriptionMenuMealPlannerResponseToJson(this);
}

@JsonSerializable()
class SubscriptionMenuMealPlannerAddonsResponse {
  @JsonKey(name: "items")
  List<AddOnResponse>? items;

  @JsonKey(name: "byType")
  Map<String, dynamic>? byType;

  SubscriptionMenuMealPlannerAddonsResponse({this.items, this.byType});

  factory SubscriptionMenuMealPlannerAddonsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$SubscriptionMenuMealPlannerAddonsResponseFromJson(json);
  Map<String, dynamic> toJson() =>
      _$SubscriptionMenuMealPlannerAddonsResponseToJson(this);
}