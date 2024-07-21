import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/core/helper/utils/app_assets.dart';
import 'package:todo_app/core/helper/utils/app_colors.dart';
import 'package:todo_app/core/helper/utils/app_strings.dart';
import 'package:todo_app/features/home/data/model/task_model.dart';
import 'package:todo_app/features/home/presentation/cubit/task_cubit.dart';
import 'package:todo_app/features/home/presentation/widgets/bottom_sheet_widget.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({
    super.key,
    required this.taskModel,
  });
  final TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: AppColors.deepGrey,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          builder: (context) {
            return BottomSheetWidget(
              taskModel: taskModel,
            );
          },
        );
      },
      child: Container(
        margin: const EdgeInsets.only(top: 15),
        decoration: BoxDecoration(
          color: TaskCubit.get(context).getColor(taskModel.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(11.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.sizeOf(context).width - 55 * 2,
                    ),
                    child: Text(
                      taskModel.title,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppAssets.iconsTimer,
                      ),
                      SizedBox(width: 8.h),
                      Text(
                        '${taskModel.startTime} - ${taskModel.endTime}',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),

                  //! note
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.sizeOf(context).width - 55 * 2,
                    ),
                    child: Text(
                      taskModel.note,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                height: 70.h,
                width: 1.4,
                color: AppColors.white,
              ),
              SizedBox(width: 9.h),
              RotatedBox(
                quarterTurns: 3,
                child: Text(
                  taskModel.isCompleted == 1
                      ? AppStrings.completed
                      : AppStrings.toDo,
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(fontSize: 16.sp),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
