import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:todo_app/core/helper/utils/app_strings.dart';
import 'package:todo_app/features/home/presentation/cubit/task_cubit.dart';
import 'package:todo_app/features/home/presentation/cubit/task_state.dart';
import 'package:todo_app/features/home/presentation/widgets/custom_date_picker.dart';
import 'package:todo_app/features/home/presentation/widgets/custom_nav_bar.dart';
import 'package:todo_app/features/home/presentation/widgets/no_task_widget.dart';
import 'package:todo_app/features/home/presentation/widgets/task_widget.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: BlocBuilder<TaskCubit, TaskState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 6.h),
              const CustomNavBar(),

              Text(
                AppStrings.today,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 6.h),
              const CustomDatePicker(),
              SizedBox(height: 20.h),

              //! view tasks
              if (TaskCubit.get(context).tasksList.isNotEmpty)
                Expanded(
                  child: AnimationLimiter(
                    child: ListView.builder(
                      itemCount: TaskCubit.get(context).tasksList.length,
                      itemBuilder: (context, index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 500),
                          child: SlideAnimation(
                            verticalOffset: 50.0,
                            child: FadeInAnimation(
                              child: TaskWidget(
                                taskModel:
                                    TaskCubit.get(context).tasksList[index],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
              else
                const NoTasksWidget(),
            ],
          );
        },
      ),
    );
  }
}
