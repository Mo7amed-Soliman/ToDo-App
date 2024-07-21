import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/helper/extension/navigation_extension.dart';
import 'package:todo_app/core/helper/utils/app_strings.dart';
import 'package:todo_app/core/widgets/app_button_widget.dart';
import 'package:todo_app/features/home/presentation/views/home_view.dart';
import 'package:todo_app/features/onboarding/data/models/on_boarding_model.dart';
import 'package:todo_app/features/onboarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:todo_app/features/onboarding/presentation/widget/smooth_page_indicator_widget.dart';
import 'package:todo_app/features/onboarding/presentation/widget/text_button_widget.dart';

class OnBoradingContent extends StatelessWidget {
  const OnBoradingContent({super.key, required this.data});
  final OnBoardingModel data;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 14.h),
        if (isLastpage)
          TextButtonWidget(
            text: AppStrings.skip,
            onPressed: () {
              context.pushReplacement(const HomeView());
            },
          )
        else
          SizedBox(
            height: 52.h,
          ),
        Image(image: AssetImage(data.image)),
        SizedBox(height: 18.h),
        SmoothPageIndicatorWidget(
          length: onboardingData.length,
          currentPage: OnBoardingCubit.currentPage,
        ),
        SizedBox(height: 50.h),
        Text(
          data.title,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        SizedBox(height: 30.h),
        Text(
          data.subTitle,
          style: Theme.of(context).textTheme.displaySmall,
          textAlign: TextAlign.center,
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (!isFristpage)
              TextButtonWidget(
                onPressed: () {
                  OnBoardingCubit.get(context).previousView();
                },
                text: AppStrings.back,
              )
            else
              const SizedBox(),

            //?
            if (isLastpage)
              AppButtonWidget(
                text: AppStrings.next,
                onPressed: () {
                  OnBoardingCubit.get(context).nextView();
                },
              )
            else
              AppButtonWidget(
                text: AppStrings.getStarted,
                onPressed: () {
                  context.pushReplacement(const HomeView());
                  OnBoardingCubit.pageController.dispose();
                },
              ),
          ],
        ),
        SizedBox(height: 50.h),
      ],
    );
  }

  get isLastpage {
    return OnBoardingCubit.currentPage != onboardingData.length - 1;
  }

  bool get isFristpage => OnBoardingCubit.currentPage == 0;
}
