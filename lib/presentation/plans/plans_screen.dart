import 'package:basic_diet/app/dependency_injection.dart';
import 'package:basic_diet/presentation/plans/bloc/plans_bloc.dart';
import 'package:basic_diet/presentation/plans/bloc/plans_event.dart';
import 'package:basic_diet/presentation/plans/bloc/plans_state.dart';
import 'package:basic_diet/presentation/plans/timeline/meal_planner/meal_planner_screen.dart';
import 'package:basic_diet/presentation/plans/fulfillment_status/fulfillment_status_cubit.dart';
import 'package:basic_diet/presentation/plans/widgets/fulfillment/fulfillment_status_section.dart';
import 'package:basic_diet/presentation/plans/widgets/no_subscription_view.dart';
import 'package:basic_diet/presentation/plans/widgets/plans_action_buttons.dart';
import 'package:basic_diet/presentation/plans/widgets/plans_header.dart';
import 'package:basic_diet/presentation/plans/widgets/subscription_plan_card.dart';
import 'package:basic_diet/presentation/resources/color_manager.dart';
import 'package:basic_diet/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class PlansScreen extends StatefulWidget {
  const PlansScreen({super.key});

  @override
  State<PlansScreen> createState() => _PlansScreenState();
}

class _PlansScreenState extends State<PlansScreen> with WidgetsBindingObserver {
  late FulfillmentStatusCubit _fulfillmentStatusCubit;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    initPlansModule();
    _fulfillmentStatusCubit = instance<FulfillmentStatusCubit>();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _fulfillmentStatusCubit.close();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _fulfillmentStatusCubit.onAppResumed();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PlansBloc>(
          create: (context) => instance<PlansBloc>()
            ..add(FetchCurrentSubscriptionOverviewEvent()),
        ),
        BlocProvider<FulfillmentStatusCubit>.value(
          value: _fulfillmentStatusCubit,
        ),
      ],
      child: BlocListener<PlansBloc, PlansState>(
        listener: _onStateChanged,
        child: Scaffold(
          backgroundColor: ColorManager.backgroundApp,
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(
                AppPadding.p16,
                AppPadding.p16,
                AppPadding.p16,
                AppPadding.p24 + MediaQuery.of(context).padding.bottom,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: AppSize.s8),
                  const PlansHeader(),
                  const SizedBox(height: AppSize.s24),
                  BlocBuilder<PlansBloc, PlansState>(builder: _buildBody),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onStateChanged(BuildContext context, PlansState state) {
    if (state is NavigateToMealPlannerState) {
      initMealPlannerModule();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder:
              (_) => MealPlannerScreen(
                timelineDays: state.timelineDays,
                addonEntitlements:
                    state.data?.data?.addonSubscriptions ?? const [],
                initialDayIndex: state.initialDayIndex,
                premiumMealsRemaining: state.premiumMealsRemaining,
                premiumSummaries: state.premiumSummaries,
                subscriptionId: state.subscriptionId,
              ),
        ),
      ).then((_) {
        if (context.mounted) {
          context.read<PlansBloc>().add(
            FetchCurrentSubscriptionOverviewEvent(),
          );
        }
      });
    }
  }

  Widget _buildBody(BuildContext context, PlansState state) {
    if (state is PlansLoading || state is PlansInitial) {
      return Center(
        child: CircularProgressIndicator(color: ColorManager.brandPrimary),
      );
    }

    if (state is PlansError && state.data == null) {
      return Center(child: Text(state.message));
    }

    final data = state.data?.data;

    if (data == null) return const NoSubscriptionView();

    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubscriptionPlanCard(data: data),
            Gap(AppSize.s16.h),
            PlansActionButtons(data: data),
            FulfillmentStatusSection(
              data: data,
              fulfillmentDay: state.fulfillmentDay,
            ),
            Gap(AppSize.s24.h),
          ],
        ),
        if (state is OpenPlannerLoading || state is PreparePickupLoading)
          Positioned.fill(
            child: Container(
              color: ColorManager.backgroundSurface.withValues(alpha: 0.5),
              child: Center(
                child: CircularProgressIndicator(
                  color: ColorManager.brandPrimary,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
