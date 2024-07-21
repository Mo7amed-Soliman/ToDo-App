import 'package:todo_app/core/helper/utils/app_assets.dart';
import 'package:todo_app/core/helper/utils/app_strings.dart';

class OnBoardingModel {
  final String title;
  final String subTitle;
  final String image;

  OnBoardingModel({
    required this.title,
    required this.subTitle,
    required this.image,
  });
}

List<OnBoardingModel> onboardingData = [
  OnBoardingModel(
    title: AppStrings.onBoardingTitleOne,
    subTitle: AppStrings.onBoardingSubTitleOne,
    image: AppAssets.imagesOnBorading1,
  ),
  OnBoardingModel(
    title: AppStrings.onBoardingTitleTwo,
    subTitle: AppStrings.onBoardingSubTitleTwo,
    image: AppAssets.imagesOnBorading2,
  ),
  OnBoardingModel(
    title: AppStrings.onBoardingTitleThree,
    subTitle: AppStrings.onBoardingSubTitleThree,
    image: AppAssets.imagesOnBorading3,
  ),
];
