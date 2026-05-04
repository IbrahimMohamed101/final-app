// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_menu_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscriptionMenuResponse _$SubscriptionMenuResponseFromJson(
  Map<String, dynamic> json,
) => SubscriptionMenuResponse(
  status: SubscriptionMenuResponse._readOkOrStatus(json, 'status'),
  message: json['message'] as String?,
  data:
      json['data'] == null
          ? null
          : SubscriptionMenuDataResponse.fromJson(
            json['data'] as Map<String, dynamic>,
          ),
);

Map<String, dynamic> _$SubscriptionMenuResponseToJson(
  SubscriptionMenuResponse instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};

SubscriptionMenuDataResponse _$SubscriptionMenuDataResponseFromJson(
  Map<String, dynamic> json,
) => SubscriptionMenuDataResponse(
  addons:
      (json['addons'] as List<dynamic>?)
          ?.map((e) => AddOnResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
  addonsByType: json['addonsByType'] as Map<String, dynamic>?,
  mealPlanner:
      json['mealPlanner'] == null
          ? null
          : SubscriptionMenuMealPlannerResponse.fromJson(
            json['mealPlanner'] as Map<String, dynamic>,
          ),
);

Map<String, dynamic> _$SubscriptionMenuDataResponseToJson(
  SubscriptionMenuDataResponse instance,
) => <String, dynamic>{
  'addons': instance.addons,
  'addonsByType': instance.addonsByType,
  'mealPlanner': instance.mealPlanner,
};

SubscriptionMenuMealPlannerResponse
_$SubscriptionMenuMealPlannerResponseFromJson(Map<String, dynamic> json) =>
    SubscriptionMenuMealPlannerResponse(
      addons:
          json['addons'] == null
              ? null
              : SubscriptionMenuMealPlannerAddonsResponse.fromJson(
                json['addons'] as Map<String, dynamic>,
              ),
    );

Map<String, dynamic> _$SubscriptionMenuMealPlannerResponseToJson(
  SubscriptionMenuMealPlannerResponse instance,
) => <String, dynamic>{'addons': instance.addons};

SubscriptionMenuMealPlannerAddonsResponse
_$SubscriptionMenuMealPlannerAddonsResponseFromJson(
  Map<String, dynamic> json,
) => SubscriptionMenuMealPlannerAddonsResponse(
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => AddOnResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
  byType: json['byType'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$SubscriptionMenuMealPlannerAddonsResponseToJson(
  SubscriptionMenuMealPlannerAddonsResponse instance,
) => <String, dynamic>{'items': instance.items, 'byType': instance.byType};
