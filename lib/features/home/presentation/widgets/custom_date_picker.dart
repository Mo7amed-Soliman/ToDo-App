import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/helper/utils/app_colors.dart';
import 'package:todo_app/features/home/presentation/cubit/task_cubit.dart';

class CustomDatePicker extends StatelessWidget {
  const CustomDatePicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DatePicker(
      height: 115.h,
      width: 66,
      DateTime.now(),
      initialSelectedDate: DateTime.now(),
      selectionColor: AppColors.bgDatePicker,
      selectedTextColor: AppColors.white,
      dateTextStyle: Theme.of(context).textTheme.bodySmall!,
      dayTextStyle: Theme.of(context).textTheme.bodySmall!,
      monthTextStyle: Theme.of(context).textTheme.bodySmall!,
      onDateChange: (date) {
        //! New date selected
        TaskCubit.get(context).getSelectedDate(date);
      },
    );
  }
}
