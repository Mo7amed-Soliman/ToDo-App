import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/onboarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:todo_app/features/onboarding/presentation/widget/onboarding_view_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => OnBoardingCubit(),
          child: const OnboardingViewBody(),
        ),
      ),
    );
  }
}
