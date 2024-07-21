import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/helper/utils/app_assets.dart';
import 'package:todo_app/core/helper/utils/app_strings.dart';

class NoTasksWidget extends StatelessWidget {
  const NoTasksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Image(image: AssetImage(AppAssets.imagesNoTask)),
          SizedBox(height: 10.h),
          Text(
            AppStrings.noTaskTitle,
            textAlign: TextAlign.center,
            style:
                Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 20),
          ),
          SizedBox(height: 10.h),
          Text(
            AppStrings.noTaskSubTitle,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
