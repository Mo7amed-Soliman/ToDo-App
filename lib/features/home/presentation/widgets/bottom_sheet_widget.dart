import 'package:flutter/material.dart';
import 'package:todo_app/core/helper/extension/navigation_extension.dart';
import 'package:todo_app/core/helper/utils/app_colors.dart';
import 'package:todo_app/core/helper/utils/app_strings.dart';
import 'package:todo_app/core/widgets/app_button_widget.dart';
import 'package:todo_app/features/home/data/model/task_model.dart';
import 'package:todo_app/features/home/presentation/cubit/task_cubit.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({
    super.key,
    required this.taskModel,
  });

  final TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (taskModel.isCompleted == 0)
            Column(
              children: [
                AppButtonWidget(
                  onPressed: () {
                    TaskCubit.get(context).updateTask(taskModel.id!);

                    context.pop();
                  },
                  text: AppStrings.taskCompleted,
                  width: double.infinity,
                ),
                const SizedBox(height: 24),
              ],
            )
          else
            const SizedBox(),
          AppButtonWidget(
            onPressed: () {
              TaskCubit.get(context).deleteTask(taskModel.id!);
              context.pop();
            },
            text: AppStrings.deleteTask,
            width: double.infinity,
            color: AppColors.red,
          ),
          const SizedBox(height: 24),
          AppButtonWidget(
            onPressed: () {
              context.pop();
            },
            text: AppStrings.cancel,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
