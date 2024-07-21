import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/helper/utils/app_strings.dart';
import 'package:todo_app/features/home/presentation/cubit/task_cubit.dart';

class CustomListViewColors extends StatelessWidget {
  const CustomListViewColors({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.color,
          style: Theme.of(context).textTheme.displaySmall,
        ),
        SizedBox(height: 12.h),
        SizedBox(
          height: 50,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  TaskCubit.get(context).changeCheckMarkIndex(index);
                },
                child: CircleAvatar(
                  maxRadius: 22.h,
                  backgroundColor: TaskCubit.get(context).getColor(index),
                  child: TaskCubit.get(context).currentIndex == index
                      ? const Icon(Icons.check)
                      : null,
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(width: 12.h),
            itemCount: 7,
          ),
        ),
      ],
    );
  }
}
