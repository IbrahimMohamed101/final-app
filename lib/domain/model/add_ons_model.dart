import 'package:equatable/equatable.dart';

class AddOnsModel extends Equatable {
  final List<AddOnModel> addOns;

  const AddOnsModel({required this.addOns});

  @override
  List<Object?> get props => [addOns];
}

class AddOnModel extends Equatable {
  final String id;
  final String name;
  final String category;
  final String description;
  final String imageUrl;
  final String currency;
  final int priceHalala;
  final double priceSar;
  final String priceLabel;
  final String kind;
  final String billingMode;
  final String pricingModel;
  final String billingUnit;
  final AddOnUiModel ui;

  const AddOnModel({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.currency,
    required this.priceHalala,
    required this.priceSar,
    required this.priceLabel,
    required this.kind,
    required this.billingMode,
    required this.pricingModel,
    required this.billingUnit,
    required this.ui,
  });

  bool get isPlan => kind == 'plan';
  bool get isItem => kind == 'item';
  bool get isPerDay => billingMode == 'per_day';
  bool get isFlatOnce => billingMode == 'flat_once';

  @override
  List<Object?> get props => [
    id,
    name,
    category,
    description,
    imageUrl,
    currency,
    priceHalala,
    priceSar,
    priceLabel,
    kind,
    billingMode,
    pricingModel,
    billingUnit,
    ui,
  ];
}

class AddOnUiModel extends Equatable {
  final String title;
  final String subtitle;
  final String ctaLabel;
  final String badge;

  const AddOnUiModel({
    required this.title,
    required this.subtitle,
    required this.ctaLabel,
    required this.badge,
  });

  @override
  List<Object?> get props => [title, subtitle, ctaLabel, badge];
}
