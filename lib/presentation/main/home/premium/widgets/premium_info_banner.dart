import 'package:easy_localization/easy_localization.dart';
import 'package:basic_diet/presentation/resources/color_manager.dart';
import 'package:basic_diet/presentation/resources/strings_manager.dart';
import 'package:basic_diet/presentation/widgets/subscription_step_intro_card.dart';
import 'package:flutter/material.dart';

class PremiumInfoBanner extends StatelessWidget {
  const PremiumInfoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return SubscriptionStepIntroCard(
      badge: Strings.optionalStepLabel.tr(),
      title: Strings.premiumStepTitle.tr(),
      description: Strings.premiumStepDescription.tr(),
      hint: Strings.premiumStepHint.tr(),
      icon: Icons.workspace_premium_rounded,
      accentColor: ColorManager.brandAccent,
      surfaceColor: ColorManager.brandAccentSoft,
      borderColor: ColorManager.brandAccentBorder,
    );
  }
}
