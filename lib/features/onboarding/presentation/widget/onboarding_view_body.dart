import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/onboarding/data/models/on_boarding_model.dart';
import 'package:todo_app/features/onboarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:todo_app/features/onboarding/presentation/cubit/on_boarding_state.dart';
import 'package:todo_app/features/onboarding/presentation/widget/onboarding_widget.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: PageView.builder(
            controller: OnBoardingCubit.pageController,
            onPageChanged: (value) {
              OnBoardingCubit.get(context).onPageChanged(value);
            },
            itemCount: onboardingData.length,
            itemBuilder: (context, index) {
              return OnBoradingContent(
                data: onboardingData[index],
              );
            },
          ),
        );
      },
    );
  }
}
