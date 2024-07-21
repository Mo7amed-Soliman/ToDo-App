import 'package:flutter/material.dart';
import 'package:todo_app/core/helper/extension/navigation_extension.dart';
import 'package:todo_app/features/home/presentation/views/add_task_view.dart';
import 'package:todo_app/features/home/presentation/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: HomeViewBody(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(const AddTaskView());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
