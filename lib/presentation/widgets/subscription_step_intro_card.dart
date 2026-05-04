import 'package:basic_diet/presentation/resources/color_manager.dart';
import 'package:basic_diet/presentation/resources/font_manager.dart';
import 'package:basic_diet/presentation/resources/styles_manager.dart';
import 'package:basic_diet/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class SubscriptionStepIntroCard extends StatelessWidget {
  final String badge;
  final String title;
  final String description;
  final String hint;
  final IconData icon;
  final Color accentColor;
  final Color surfaceColor;
  final Color borderColor;

  const SubscriptionStepIntroCard({
    super.key,
    required this.badge,
    required this.title,
    required this.description,
    required this.hint,
    required this.icon,
    required this.accentColor,
    required this.surfaceColor,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsetsDirectional.all(AppPadding.p16.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: AlignmentDirectional.topStart,
          end: AlignmentDirectional.bottomEnd,
          colors: [surfaceColor, ColorManager.backgroundSurface],
        ),
        borderRadius: BorderRadius.circular(AppSize.s20.r),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: AppSize.s40.w,
                height: AppSize.s40.w,
                decoration: BoxDecoration(
                  color: accentColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: ColorManager.backgroundSurface,
                  size: AppSize.s22.sp,
                ),
              ),
              Gap(AppSize.s12.w),
              Expanded(
                child: Container(
                  padding: EdgeInsetsDirectional.symmetric(
                    horizontal: AppPadding.p10.w,
                    vertical: AppPadding.p6.h,
                  ),
                  decoration: BoxDecoration(
                    color: ColorManager.backgroundSurface.withValues(
                      alpha: 0.85,
                    ),
                    borderRadius: BorderRadius.circular(AppSize.s30.r),
                  ),
                  child: Text(
                    badge,
                    style: getBoldTextStyle(
                      color: accentColor,
                      fontSize: FontSizeManager.s12.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Gap(AppSize.s16.h),
          Text(
            title,
            style: getBoldTextStyle(
              color: ColorManager.textPrimary,
              fontSize: FontSizeManager.s20.sp,
            ),
          ),
          Gap(AppSize.s8.h),
          Text(
            description,
            style: getRegularTextStyle(
              color: ColorManager.textSecondary,
              fontSize: FontSizeManager.s14.sp,
            ),
          ),
          Gap(AppSize.s14.h),
          Container(
            width: double.infinity,
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: AppPadding.p12.w,
              vertical: AppPadding.p10.h,
            ),
            decoration: BoxDecoration(
              color: ColorManager.backgroundSurface.withValues(alpha: 0.92),
              borderRadius: BorderRadius.circular(AppSize.s14.r),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.only(top: AppSize.s2.h),
                  child: Icon(
                    Icons.info_outline_rounded,
                    color: accentColor,
                    size: AppSize.s18.sp,
                  ),
                ),
                Gap(AppSize.s8.w),
                Expanded(
                  child: Text(
                    hint,
                    style: getRegularTextStyle(
                      color: ColorManager.textPrimary,
                      fontSize: FontSizeManager.s14.sp,
                    ),
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
