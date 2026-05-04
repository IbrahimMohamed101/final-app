import 'package:basic_diet/domain/model/current_subscription_overview_model.dart';
import 'package:basic_diet/domain/model/subscription_day_model.dart';

class TimelineMealSlot {
  final int slotIndex;
  final String? slotKey;
  final String? selectionType;
  final String? proteinId;
  final List<MealSlotCarbModel> carbs;
  final String? sandwichId;
  final SaladSelectionModel? salad;
  final String? premiumKey;
  final String premiumSource;
  final int premiumExtraFeeHalala;

  const TimelineMealSlot({
    required this.slotIndex,
    this.slotKey,
    this.selectionType,
    this.proteinId,
    this.carbs = const [],
    this.sandwichId,
    this.salad,
    this.premiumKey,
    this.premiumSource = 'none',
    this.premiumExtraFeeHalala = 0,
  });

  String? get primaryCarbId => carbs.isEmpty ? null : carbs.first.carbId;
}

class TimelineDayModel {
  static const Set<String> terminalStatuses = {
    'fulfilled',
    'consumed_without_preparation',
    'no_show',
    'skipped',
    'frozen',
    'delivery_canceled',
    'canceled_at_branch',
  };

  final String date;
  final String day;
  final String month;
  final int dayNumber;
  final String status;
  final String statusLabel;
  final String commercialState;
  final String commercialStateLabel;
  final bool canBePrepared;
  final bool fulfillmentReady;
  final bool planningReady;
  final bool isFulfillable;
  final String fulfillmentMode;
  final String consumptionState;
  final int selectedMeals;
  final int requiredMeals;
  final int specifiedMealCount;
  final int unspecifiedMealCount;
  final bool hasCustomerSelections;
  final List<String> selections;
  final List<String> premiumSelections;
  final List<String> selectedMealIds;
  final List<TimelineMealSlot> mealSlots;
  final PaymentRequirementModel? paymentRequirement;
  final String deliveryMode;
  final AddressSummaryModel? deliveryAddress;
  final DeliveryWindowSummaryModel? deliveryWindow;
  final PickupLocationSummaryModel? pickupLocation;
  final FulfillmentSummaryModel? fulfillmentSummary;
  final String lockedReason;
  final String lockedMessage;
  final bool isPast;
  final bool autoSettled;
  final String settledAt;
  final String settlementReason;
  final bool consumedByPolicy;

  TimelineDayModel({
    required this.date,
    required this.day,
    required this.month,
    required this.dayNumber,
    required this.status,
    this.statusLabel = '',
    this.commercialState = '',
    this.commercialStateLabel = '',
    required this.canBePrepared,
    required this.fulfillmentReady,
    this.planningReady = false,
    this.isFulfillable = false,
    this.fulfillmentMode = '',
    required this.consumptionState,
    required this.selectedMeals,
    required this.requiredMeals,
    this.specifiedMealCount = 0,
    this.unspecifiedMealCount = 0,
    this.hasCustomerSelections = false,
    required this.selections,
    required this.premiumSelections,
    this.selectedMealIds = const [],
    this.mealSlots = const [],
    this.paymentRequirement,
    this.deliveryMode = '',
    this.deliveryAddress,
    this.deliveryWindow,
    this.pickupLocation,
    this.fulfillmentSummary,
    this.lockedReason = '',
    this.lockedMessage = '',
    this.isPast = false,
    this.autoSettled = false,
    this.settledAt = '',
    this.settlementReason = '',
    this.consumedByPolicy = false,
  });

  String get normalizedStatus => status.toLowerCase();

  bool get isTerminalStatus => terminalStatuses.contains(normalizedStatus);

  bool get isHistoricalOnly =>
      isTerminalStatus || autoSettled || consumedByPolicy;
}

class TimelineDataModel {
  final String subscriptionId;
  final int dailyMealsRequired;
  final int premiumMealsRemaining;
  final List<TimelineDayModel> days;
  final List<AddonSubscriptionModel> addonSubscriptions;

  /// Additive meal balance from the backend (TOTAL_BALANCE_WITHIN_VALIDITY).
  /// Null when the backend payload predates the new policy.
  final MealBalanceModel? mealBalance;

  TimelineDataModel({
    required this.subscriptionId,
    required this.dailyMealsRequired,
    required this.premiumMealsRemaining,
    required this.days,
    this.addonSubscriptions = const [],
    this.mealBalance,
  });
}

class TimelineModel {
  final TimelineDataModel data;

  TimelineModel({required this.data});
}
