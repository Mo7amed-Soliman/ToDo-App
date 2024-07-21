import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/onboarding/presentation/cubit/on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitialState());
  static int currentPage = 0;
  static PageController pageController = PageController(initialPage: 0);
  static OnBoardingCubit get(context) => BlocProvider.of(context);

  void onPageChanged(int page) {
    currentPage = page;
    emit(OnBoardingPageChangedState());
  }

  nextView() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 350),
      curve: Curves.fastOutSlowIn,
    );
  }

  previousView() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 350),
      curve: Curves.fastOutSlowIn,
    );
  }
}
