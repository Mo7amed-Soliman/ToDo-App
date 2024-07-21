import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/helper/utils/app_assets.dart';
import 'package:todo_app/core/helper/utils/app_colors.dart';
import 'package:todo_app/features/home/presentation/cubit/task_cubit.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          DateFormat.yMMMd().format(DateTime.now()),
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: AppColors.grey,
              ),
        ),
        IconButton(
          onPressed: () async {
            await TaskCubit.get(context).changeTheme();
          },
          icon: TaskCubit.get(context).islight
              ? SvgPicture.asset(
                  colorFilter: const ColorFilter.mode(
                    AppColors.backgroundColor,
                    BlendMode.srcIn,
                  ),
                  AppAssets.light,
                  height: 25.h,
                )
              : SvgPicture.asset(
                  AppAssets.dark,
                  height: 25.h,
                ),
        ),
      ],
    );
  }
}
