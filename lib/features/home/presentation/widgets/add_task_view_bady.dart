import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:iconly/iconly.dart';
import 'package:todo_app/core/helper/extension/navigation_extension.dart';
import 'package:todo_app/core/helper/extension/padding_extension.dart';
import 'package:todo_app/core/helper/function/show_toast.dart';
import 'package:todo_app/core/helper/utils/app_colors.dart';
import 'package:todo_app/core/helper/utils/app_strings.dart';
import 'package:todo_app/core/widgets/app_button_widget.dart';
import 'package:todo_app/features/home/presentation/cubit/task_cubit.dart';
import 'package:todo_app/features/home/presentation/cubit/task_state.dart';
import 'package:todo_app/features/home/presentation/widgets/custom_list_view_colors.dart';
import 'package:todo_app/features/home/presentation/widgets/custom_start_and_end_time.dart';
import 'package:todo_app/features/home/presentation/widgets/text_form_field_widget.dart';

class AddTaskViewBody extends StatelessWidget {
  const AddTaskViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocConsumer<TaskCubit, TaskState>(
        listener: (BuildContext context, TaskState state) {
          if (state is AddTaskSuccessState) {
            showToast(mes: AppStrings.createTaskMsg);
            context.pop();
          }
        },
        builder: (context, state) {
          return Form(
            key: TaskCubit.get(context).formKey,
            child: AnimationLimiter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 375),
                  childAnimationBuilder: (widget) => SlideAnimation(
                    horizontalOffset: 50.0,
                    child: FadeInAnimation(
                      child: widget,
                    ),
                  ),
                  children: [
                    SizedBox(height: 24.h),
                    TextFormFieldWidget(
                        controller: TaskCubit.get(context).titleController,
                        title: AppStrings.tilte,
                        hintText: AppStrings.tilteHint,
                        validator: (p0) {
                          if (p0!.isEmpty) {
                            return AppStrings.tilteErrorMsg;
                          }
                          return null;
                        }),
                    const SizedBox(height: 4),
                    TextFormFieldWidget(
                        controller: TaskCubit.get(context).noteController,
                        title: AppStrings.note,
                        hintText: AppStrings.notehint,
                        validator: (p0) {
                          if (p0!.isEmpty) {
                            return AppStrings.noteErrorMsg;
                          }
                          return null;
                        }),
                    const SizedBox(height: 4),
                    TextFormFieldWidget(
                      title: AppStrings.date,
                      hintText: TaskCubit.get(context).currentDate,
                      suffixIcon: IconButton(
                        onPressed: () {
                          TaskCubit.get(context).getDate(context);
                        },
                        icon: const Icon(
                          IconlyLight.calendar,
                        ),
                      ),
                      readOnly: true,
                    ),

                    //! start and end time
                    const CustomStartAndEndTime(),
                    const SizedBox(height: 4),
                    //! Color
                    const CustomListViewColors(),
                    SizedBox(height: 130.h),
                    //! Button
                    state is AddTaskLoadingState
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            ),
                          )
                        : AppButtonWidget(
                            width: double.infinity,
                            onPressed: () async {
                              //? validation data
                              if (TaskCubit.get(context)
                                  .formKey
                                  .currentState!
                                  .validate()) {
                                await TaskCubit.get(context).addTask();
                              }
                            },
                            text: AppStrings.createTask,
                          ),
                    SizedBox(height: 30.h),
                  ].paddingSymmetric(horizontal: 24),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}



/*
TextFormFieldWidget(
  title: 'Repeat',
  hintText: TaskCubit.get(context).repeat,
  suffixIcon: const RepeatWidget(),
  readOnly: true,
),
class RepeatWidget extends StatelessWidget {
  const RepeatWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      padding: const EdgeInsets.only(right: 12),
      elevation: 0,
      underline: const SizedBox(),
      icon: const RotatedBox(
        quarterTurns: 1,
        child: Icon(
          Icons.arrow_forward_ios,
        ),
      ),
      onChanged: (newValue) {
        TaskCubit.get(context).changeRepeat(newValue, context);
      },
      items: <String>['None', 'Daily', 'Weekly', 'Monthly']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
*/