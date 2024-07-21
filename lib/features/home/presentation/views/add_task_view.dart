import 'package:flutter/material.dart';
import 'package:todo_app/core/helper/extension/navigation_extension.dart';
import 'package:todo_app/core/helper/utils/app_strings.dart';
import 'package:todo_app/features/home/presentation/widgets/add_task_view_bady.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.addTask),
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
      ),
      body: const AddTaskViewBody(),
    );
  }
}
