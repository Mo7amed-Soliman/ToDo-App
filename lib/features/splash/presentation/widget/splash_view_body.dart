import 'package:flutter/material.dart';
import 'package:todo_app/core/helper/utils/app_assets.dart';
import 'package:todo_app/core/helper/utils/app_strings.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(image: AssetImage(AppAssets.iconsLogo)),
          const SizedBox(height: 8),
          Text(
            AppStrings.appName,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ],
      ),
    );
  }
}
