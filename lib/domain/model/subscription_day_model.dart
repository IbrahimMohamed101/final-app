import 'package:basic_diet/domain/model/meal_planner_menu_model.dart';
import 'package:basic_diet/domain/model/current_subscription_overview_model.dart';

class SubscriptionDayModel {
  final String date;
  final String status;
  final String? plannerState;
  final String? commercialState;
  final String plannerRevisionHash;
  final List<MealSlotModel> mealSlots;
  final List<AddonSelectionModel> addonSelections;
  final PlannerMetaModel? plannerMeta;
  final PaymentRequirementModel? paymentRequirement;
  final PremiumExtraPaymentModel? premiumExtraPayment;
  final BuilderRulesModel? rules;
  final PickupLocationSummaryModel? pickupLocation;
  final AddressSummaryModel? deliveryAddress;
  final DeliveryWindowSummaryModel? deliveryWindow;
  final FulfillmentSummaryModel? fulfillmentSummary;
  final String lockedReason;
  final String lockedMessage;

  SubscriptionDayModel({
    required this.date,
    required this.status,
    this.plannerState,
    this.commercialState,
    this.plannerRevisionHash = '',
    required this.mealSlots,
    this.addonSelections = const [],
    this.plannerMeta,
    this.paymentRequirement,
    this.premiumExtraPayment,
    this.rules,
    this.pickupLocation,
    this.deliveryAddress,
    this.deliveryWindow,
    this.fulfillmentSummary,
    this.lockedReason = '',
    this.lockedMessage = '',
  });
}

class AddonSelectionModel {
  final String addonId;
  final String category;
  final String status;
  final String source;
  final String name;
  final int priceHalala;
  final String currency;

  const AddonSelectionModel({
    required this.addonId,
    required this.category,
    required this.status,
    this.source = '',
    this.name = '',
    this.priceHalala = 0,
    this.currency = 'SAR',
  });

  bool get isIncluded =>
      status == 'included' || source == 'subscription' || status == 'subscription';
  bool get isPendingPayment => status == 'pending_payment';
  bool get isPaid => status == 'paid';
}

class MealSlotCarbModel {
  final String carbId;
  final int grams;

  const MealSlotCarbModel({required this.carbId, required this.grams});
}

class SaladGroupsModel {
  final List<String> leafyGreens;
  final List<String> vegetables;
  final List<String> protein;
  final List<String> cheeseNuts;
  final List<String> fruits;
  final List<String> sauce;

  const SaladGroupsModel({
    this.leafyGreens = const [],
    this.vegetables = const [],
    this.protein = const [],
    this.cheeseNuts = const [],
    this.fruits = const [],
    this.sauce = const [],
  });
}

class SaladSelectionModel {
  final String? presetKey;
  final SaladGroupsModel groups;

  const SaladSelectionModel({this.presetKey, this.groups = const SaladGroupsModel()});
}

class MealSlotModel {
  final int slotIndex;
  final String slotKey;
  final String status;
  final String? selectionType;
  final String? proteinId;
  final List<MealSlotCarbModel> carbs;
  final String? sandwichId;
  final SaladSelectionModel? salad;
  final bool isPremium;
  final String premiumSource;
  final String? premiumKey;
  final int premiumExtraFeeHalala;
  final String? proteinFamilyKey;

  MealSlotModel({
    required this.slotIndex,
    required this.slotKey,
    required this.status,
    this.selectionType,
    this.proteinId,
    this.carbs = const [],
    this.sandwichId,
    this.salad,
    required this.isPremium,
    required this.premiumSource,
    this.premiumKey,
    this.premiumExtraFeeHalala = 0,
    this.proteinFamilyKey,
  });

  String? get primaryCarbId => carbs.isEmpty ? null : carbs.first.carbId;
}

class PlannerMetaModel {
  final int requiredSlotCount;
  final int emptySlotCount;
  final int partialSlotCount;
  final int completeSlotCount;
  final int premiumSlotCount;
  final int premiumPendingPaymentCount;
  final int premiumTotalHalala;
  final bool isDraftValid;
  final bool isConfirmable;

  PlannerMetaModel({
    required this.requiredSlotCount,
    required this.emptySlotCount,
    required this.partialSlotCount,
    required this.completeSlotCount,
    required this.premiumSlotCount,
    required this.premiumPendingPaymentCount,
    required this.premiumTotalHalala,
    required this.isDraftValid,
    required this.isConfirmable,
  });
}

class PaymentRequirementModel {
  final bool requiresPayment;
  final int premiumSelectedCount;
  final int premiumPendingPaymentCount;
  final int addonSelectedCount;
  final int addonPendingPaymentCount;
  final int amountHalala;
  final int pendingAmountHalala;
  final String currency;
  final String status;
  final String pricingStatus;
  final String pricingStatusLabel;
  final String? blockingReason;
  final String blockingReasonLabel;
  final bool canCreatePayment;

  PaymentRequirementModel({
    required this.requiresPayment,
    required this.premiumSelectedCount,
    required this.premiumPendingPaymentCount,
    this.addonSelectedCount = 0,
    this.addonPendingPaymentCount = 0,
    required this.amountHalala,
    this.pendingAmountHalala = 0,
    required this.currency,
    this.status = 'satisfied',
    this.pricingStatus = 'not_required',
    this.pricingStatusLabel = '',
    this.blockingReason,
    this.blockingReasonLabel = '',
    this.canCreatePayment = false,
  });
}

class PremiumExtraPaymentModel {
  final String paymentStatus;
  final int amountHalala;
  final String currency;

  const PremiumExtraPaymentModel({
    this.paymentStatus = '',
    this.amountHalala = 0,
    this.currency = 'SAR',
  });
}

class ValidationResultModel {
  final bool valid;
  final List<MealSlotModel>? mealSlots;
  final PlannerMetaModel? plannerMeta;
  final PaymentRequirementModel? paymentRequirement;
  final List<SlotErrorModel>? slotErrors;
  final List<AddonSelectionModel> addonSelections;
  final String plannerRevisionHash;
  final PremiumExtraPaymentModel? premiumExtraPayment;
  final String commercialState;
  final bool isFulfillable;
  final bool canBePrepared;
  final BuilderRulesModel? rules;

  ValidationResultModel({
    required this.valid,
    this.mealSlots,
    this.plannerMeta,
    this.paymentRequirement,
    this.slotErrors,
    this.addonSelections = const [],
    this.plannerRevisionHash = '',
    this.premiumExtraPayment,
    this.commercialState = '',
    this.isFulfillable = false,
    this.canBePrepared = false,
    this.rules,
  });
}

class SlotErrorModel {
  final int slotIndex;
  final String field;
  final String code;
  final String message;

  SlotErrorModel({
    required this.slotIndex,
    required this.field,
    required this.code,
    required this.message,
  });
}
