import 'package:basic_diet/presentation/resources/color_manager.dart';
import 'package:basic_diet/presentation/resources/font_manager.dart';
import 'package:basic_diet/presentation/resources/styles_manager.dart';
import 'package:basic_diet/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

enum FulfillmentStatusTone { neutral, info, warning, success, error }

class FulfillmentStatusCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String statusText;
  final String? reasonText;
  final FulfillmentStatusTone tone;
  final IconData icon;
  final String? sectionTitle;
  final List<FulfillmentProgressStep> progressSteps;
  final Widget mainInfo;
  final Widget nextAction;
  final Widget? footer;

  const FulfillmentStatusCard({
    super.key,
    required this.title,
    this.subtitle,
    required this.statusText,
    this.reasonText,
    required this.tone,
    required this.icon,
    required this.mainInfo,
    required this.nextAction,
    this.sectionTitle,
    this.progressSteps = const [],
    this.footer,
  });

  @override
  Widget build(BuildContext context) {
    final palette = _tonePalette(tone);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppPadding.p20.w),
      decoration: BoxDecoration(
        color: ColorManager.backgroundSurface,
        borderRadius: BorderRadius.circular(AppSize.s24.r),
        border: Border.all(color: palette.border),
        boxShadow: [
          BoxShadow(
            color: palette.shadow,
            blurRadius: 22,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _FulfillmentHeader(
            title: title,
            subtitle: subtitle,
            statusText: statusText,
            reasonText: reasonText,
            icon: icon,
            palette: palette,
          ),
          if (progressSteps.isNotEmpty) ...[
            Gap(AppSize.s16.h),
            FulfillmentProgressSteps(steps: progressSteps),
          ],
          Gap(AppSize.s14.h),
          _SectionCard(
            palette: palette,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (sectionTitle?.trim().isNotEmpty == true) ...[
                  Text(
                    sectionTitle!,
                    style: getBoldTextStyle(
                      color: ColorManager.textPrimary,
                      fontSize: FontSizeManager.s14.sp,
                    ),
                  ),
                  Gap(AppSize.s12.h),
                ],
                mainInfo,
              ],
            ),
          ),
          if (nextAction is! SizedBox) ...[
            Gap(AppSize.s12.h),
            _SectionCard(
              palette: palette,
              accentBackground: palette.surface,
              child: nextAction,
            ),
          ],
          if (footer != null) ...[Gap(AppSize.s12.h), footer!],
        ],
      ),
    );
  }
}

class FulfillmentProgressStep {
  final String label;
  final bool isActive;
  final bool isCompleted;

  const FulfillmentProgressStep({
    required this.label,
    this.isActive = false,
    this.isCompleted = false,
  });
}

class FulfillmentProgressSteps extends StatelessWidget {
  final List<FulfillmentProgressStep> steps;

  const FulfillmentProgressSteps({super.key, required this.steps});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(steps.length, (index) {
        final step = steps[index];
        final isHighlighted = step.isActive || step.isCompleted;
        final backgroundColor =
            step.isCompleted
                ? ColorManager.brandPrimaryTint
                : step.isActive
                ? ColorManager.blueSurface
                : ColorManager.backgroundSurface;
        final borderColor =
            step.isCompleted
                ? ColorManager.brandPrimary
                : step.isActive
                ? ColorManager.blueBorder
                : ColorManager.borderDefault;
        final textColor =
            step.isCompleted
                ? ColorManager.stateSuccessEmphasis
                : step.isActive
                ? ColorManager.blueEmphasis
                : ColorManager.textSecondary;

        final child = Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: AppPadding.p6.h,
            ),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(AppSize.s12.r),
              border: Border.all(color: borderColor),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (step.isCompleted)
                  Icon(
                    Icons.check_circle_rounded,
                    size: AppSize.s14.sp,
                    color: ColorManager.brandPrimary,
                  )
                else
                  Container(
                    width: AppSize.s14.w,
                    height: AppSize.s14.w,
                    decoration: BoxDecoration(
                      color:
                          isHighlighted
                              ? borderColor
                              : ColorManager.backgroundSubtle,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '${index + 1}',
                      style: getBoldTextStyle(
                        color:
                            step.isActive
                                ? ColorManager.textInverse
                                : ColorManager.textSecondary,
                        fontSize: FontSizeManager.s10.sp,
                      ),
                    ),
                  ),
                Gap(AppSize.s4.w),
                Flexible(
                  child: Text(
                    step.label,
                    overflow: TextOverflow.ellipsis,
                    style: getBoldTextStyle(
                      color: textColor,
                      fontSize: FontSizeManager.s10.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );

        if (index < steps.length - 1) {
          return child;
        }
        return child;
      }).expand((widget) => [widget, Gap(AppSize.s4.w)]).toList()..removeLast(),
    );
  }
}

class FulfillmentInfoList extends StatelessWidget {
  final List<FulfillmentInfoItem> items;

  const FulfillmentInfoList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final visibleItems =
        items.where((item) => item.value.trim().isNotEmpty).toList();

    return Column(
      children: List.generate(visibleItems.length, (index) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: index == visibleItems.length - 1 ? 0 : AppPadding.p10.h,
          ),
          child: FulfillmentInfoTile(item: visibleItems[index]),
        );
      }),
    );
  }
}

class FulfillmentInfoItem {
  final String label;
  final String value;
  final IconData? icon;
  final Widget? customContent;

  const FulfillmentInfoItem({
    required this.label,
    required this.value,
    this.icon,
    this.customContent,
  });
}

class FulfillmentInfoTile extends StatelessWidget {
  final FulfillmentInfoItem item;

  const FulfillmentInfoTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    if (item.customContent != null) {
      return item.customContent!;
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (item.icon != null) ...[
          Icon(
            item.icon,
            color: ColorManager.iconSecondary,
            size: AppSize.s18.sp,
          ),
          Gap(AppSize.s12.w),
        ],
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.label,
                style: getRegularTextStyle(
                  color: ColorManager.textSecondary,
                  fontSize: FontSizeManager.s12.sp,
                ),
              ),
              Gap(AppSize.s2.h),
              Text(
                item.value,
                style: getBoldTextStyle(
                  color: ColorManager.textPrimary,
                  fontSize: FontSizeManager.s14.sp,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class FulfillmentNextActionPanel extends StatelessWidget {
  final String title;
  final String message;
  final String? buttonLabel;
  final VoidCallback? onPressed;
  final FulfillmentStatusTone tone;

  const FulfillmentNextActionPanel({
    super.key,
    required this.title,
    required this.message,
    required this.tone,
    this.buttonLabel,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final palette = _tonePalette(tone);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty) ...[
          Text(
            title,
            style: getBoldTextStyle(
              color: ColorManager.textPrimary,
              fontSize: FontSizeManager.s14.sp,
            ),
          ),
          Gap(AppSize.s6.h),
        ],
        if (message.isNotEmpty)
          Text(
            message,
            style: getRegularTextStyle(
              color: ColorManager.textSecondary,
              fontSize: FontSizeManager.s14.sp,
            ),
          ),
        if (buttonLabel?.trim().isNotEmpty == true) ...[
          Gap(AppSize.s12.h),
          SizedBox(
            width: double.infinity,
            height: AppSize.s40.h,
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: palette.button,
                foregroundColor: ColorManager.textInverse,
                disabledBackgroundColor: ColorManager.backgroundSubtle,
                disabledForegroundColor: ColorManager.textSecondary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s100.r),
                ),
              ),
              child: Text(
                buttonLabel!,
                style: getBoldTextStyle(
                  color: onPressed != null ? ColorManager.textInverse : ColorManager.textSecondary,
                  fontSize: FontSizeManager.s14.sp,
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class FulfillmentCodePanel extends StatelessWidget {
  final String label;
  final String code;

  const FulfillmentCodePanel({
    super.key,
    required this.label,
    required this.code,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppPadding.p12.w),
      decoration: BoxDecoration(
        color: ColorManager.brandPrimaryTint,
        borderRadius: BorderRadius.circular(AppSize.s16.r),
        border: Border.all(color: ColorManager.brandPrimary),
      ),
      child: Row(
        children: [
          Icon(Icons.qr_code_2_rounded, color: ColorManager.brandPrimary, size: AppSize.s32.sp),
          Gap(AppSize.s12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: getRegularTextStyle(
                    color: ColorManager.brandPrimaryPressed,
                    fontSize: FontSizeManager.s12.sp,
                  ),
                ),
                Text(
                  code,
                  style: getBoldTextStyle(
                    color: ColorManager.brandPrimary,
                    fontSize: FontSizeManager.s22.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final Widget child;
  final _TonePalette palette;
  final Color? accentBackground;

  const _SectionCard({
    required this.child,
    required this.palette,
    this.accentBackground,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppPadding.p16.w),
      decoration: BoxDecoration(
        color: accentBackground ?? ColorManager.backgroundApp,
        borderRadius: BorderRadius.circular(AppSize.s20.r),
        border: Border.all(color: palette.border.withValues(alpha: 0.75)),
      ),
      child: child,
    );
  }
}

class _TonePalette {
  final Color surface;
  final Color text;
  final Color border;
  final Color iconSurface;
  final Color icon;
  final Color shadow;
  final Color button;

  const _TonePalette({
    required this.surface,
    required this.text,
    required this.border,
    required this.iconSurface,
    required this.icon,
    required this.shadow,
    required this.button,
  });
}

_TonePalette _tonePalette(FulfillmentStatusTone tone) {
  return switch (tone) {
    FulfillmentStatusTone.success => const _TonePalette(
      surface: ColorManager.stateSuccessSurface,
      text: ColorManager.stateSuccessEmphasis,
      border: ColorManager.brandPrimaryTint,
      iconSurface: ColorManager.brandPrimaryTint,
      icon: ColorManager.stateSuccessEmphasis,
      shadow: ColorManager.brandPrimaryGlow,
      button: ColorManager.brandPrimary,
    ),
    FulfillmentStatusTone.warning => const _TonePalette(
      surface: ColorManager.stateWarningSurface,
      text: ColorManager.stateWarningEmphasis,
      border: ColorManager.stateWarningBorder,
      iconSurface: ColorManager.stateWarningSurface,
      icon: ColorManager.stateWarningEmphasis,
      shadow: ColorManager.brandAccentGlow,
      button: ColorManager.brandAccent,
    ),
    FulfillmentStatusTone.error => const _TonePalette(
      surface: ColorManager.stateErrorSurface,
      text: ColorManager.stateErrorEmphasis,
      border: ColorManager.stateErrorBorder,
      iconSurface: ColorManager.stateErrorSurface,
      icon: ColorManager.stateErrorEmphasis,
      shadow: Color(0x14ED1B24),
      button: ColorManager.stateError,
    ),
    FulfillmentStatusTone.info => const _TonePalette(
      surface: ColorManager.blueSurface,
      text: ColorManager.blueEmphasis,
      border: ColorManager.blueBorder,
      iconSurface: ColorManager.blueSurface,
      icon: ColorManager.blueEmphasis,
      shadow: Color(0x143B82F6),
      button: ColorManager.bluePrimary,
    ),
    FulfillmentStatusTone.neutral => const _TonePalette(
      surface: ColorManager.backgroundSubtle,
      text: ColorManager.textPrimary,
      border: ColorManager.borderDefault,
      iconSurface: ColorManager.backgroundSubtle,
      icon: ColorManager.iconPrimary,
      shadow: Color(0x12000000),
      button: ColorManager.brandPrimary,
    ),
  };
}

class _FulfillmentHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String statusText;
  final String? reasonText;
  final IconData icon;
  final _TonePalette palette;

  const _FulfillmentHeader({
    required this.title,
    this.subtitle,
    required this.statusText,
    this.reasonText,
    required this.icon,
    required this.palette,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: AppSize.s50.w,
          height: AppSize.s50.w,
          decoration: BoxDecoration(
            color: palette.iconSurface,
            borderRadius: BorderRadius.circular(AppSize.s18.r),
          ),
          alignment: Alignment.center,
          child: Icon(icon, color: palette.icon, size: AppSize.s24.sp),
        ),
        Gap(AppSize.s12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: getBoldTextStyle(
                  color: ColorManager.textPrimary,
                  fontSize: FontSizeManager.s20.sp,
                ),
              ),
              if (subtitle?.isNotEmpty == true) ...[
                Gap(AppSize.s4.h),
                Text(
                  subtitle!,
                  style: getRegularTextStyle(
                    color: ColorManager.textSecondary,
                    fontSize: FontSizeManager.s12.sp,
                  ),
                ),
              ],
              Gap(AppSize.s10.h),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: palette.surface,
                    borderRadius: BorderRadius.circular(AppSize.s100.r),
                    border: Border.all(color: palette.border),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppPadding.p12.w,
                      vertical: AppPadding.p6.h,
                    ),
                    child: Text(
                      statusText,
                      style: getBoldTextStyle(
                        color: palette.text,
                        fontSize: FontSizeManager.s12.sp,
                      ),
                    ),
                  ),
                ),
              ),
              if (reasonText?.isNotEmpty == true) ...[
                Gap(AppSize.s8.h),
                Text(
                  reasonText!,
                  style: getRegularTextStyle(
                    color: ColorManager.textSecondary,
                    fontSize: FontSizeManager.s12.sp,
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class FulfillmentAutoUpdateFooter extends StatelessWidget {
  final String message;

  const FulfillmentAutoUpdateFooter({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.sync_rounded,
          size: AppSize.s12.sp,
          color: ColorManager.textSecondary,
        ),
        Gap(AppSize.s6.w),
        Text(
          message,
          style: getRegularTextStyle(
            color: ColorManager.textSecondary,
            fontSize: FontSizeManager.s10.sp,
          ),
        ),
      ],
    );
  }
}

class FulfillmentWarningTile extends StatelessWidget {
  final String message;
  final String? subtext;

  const FulfillmentWarningTile({
    super.key,
    required this.message,
    this.subtext,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.info_outline_rounded,
          color: ColorManager.stateWarningEmphasis,
          size: AppSize.s16.sp,
        ),
        Gap(AppSize.s10.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message,
                style: getBoldTextStyle(
                  color: ColorManager.stateWarningEmphasis,
                  fontSize: FontSizeManager.s12.sp,
                ),
              ),
              if (subtext != null) ...[
                Gap(AppSize.s2.h),
                Text(
                  subtext!,
                  style: getRegularTextStyle(
                    color: ColorManager.textSecondary,
                    fontSize: FontSizeManager.s12.sp,
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
