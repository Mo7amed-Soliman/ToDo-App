import 'package:flutter/material.dart';
import 'package:todo_app/core/database/cache/cache_helper.dart';
import 'package:todo_app/core/helper/extension/navigation_extension.dart';
import 'package:todo_app/core/services/dependency_injection.dart';
import 'package:todo_app/features/home/presentation/views/home_view.dart';
import 'package:todo_app/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:todo_app/features/splash/presentation/widget/splash_view_body.dart';

const String kIsOnBoardingVisisted = "getStartedVisisted";

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final bool _isOnBoardingVisisted =
      getIt<CacheHelper>().getData(key: kIsOnBoardingVisisted) ?? false;

  @override
  void initState() {
    super.initState();
    nextView();
  }

  //! delay 2 seconds and save on boarding key in sharedPreferences
  void nextView() async {
    //? for await 2 seconds goto nextView
    Future.delayed(
      const Duration(seconds: 2),
      () => context.pushReplacement(getView()),
    );
    //* Store the first time only once
    if (!_isOnBoardingVisisted) {
      //? this method to put data in local database using key
      await getIt<CacheHelper>().saveData(
        key: kIsOnBoardingVisisted,
        value: true,
      );
    }
  }

  //! this method to get next view
  Widget getView() {
    //? if the first time open the application is on boarding show else show home page
    if (_isOnBoardingVisisted) {
      return const HomeView();
    } else {
      return const OnboardingView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashViewBody(),
    );
  }
}
