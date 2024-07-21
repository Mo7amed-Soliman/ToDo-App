import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:todo_app/core/helper/utils/app_strings.dart';
import 'package:todo_app/features/home/presentation/cubit/task_cubit.dart';
import 'package:todo_app/features/home/presentation/widgets/text_form_field_widget.dart';

class CustomStartAndEndTime extends StatelessWidget {
  const CustomStartAndEndTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Expanded(
          child: TextFormFieldWidget(
            title: AppStrings.startTime,
            hintText: TaskCubit.get(context).startTime,
            readOnly: true,
            suffixIcon: IconButton(
              onPressed: () {
                TaskCubit.get(context).getStartTime(context);
              },
              icon: const Icon(
                IconlyLight.time_square,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: TextFormFieldWidget(
            title: AppStrings.endTime,
            readOnly: true,
            hintText: TaskCubit.get(context).endTime,
            suffixIcon: IconButton(
              onPressed: () {
                TaskCubit.get(context).getEndTime(context);
              },
              icon: const Icon(
                IconlyLight.time_square,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
