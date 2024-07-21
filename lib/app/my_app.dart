import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/helper/utils/app_strings.dart';
import 'package:todo_app/core/theme/app_theme.dart';
import 'package:todo_app/features/home/presentation/cubit/task_cubit.dart';
import 'package:todo_app/features/home/presentation/cubit/task_state.dart';
import 'package:todo_app/features/splash/presentation/views/splash_view.dart';

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => BlocBuilder<TaskCubit, TaskState>(
        builder: (context, state) {
          return MaterialApp(
            title: AppStrings.appName,
            theme: getAppLightTheme(),
            darkTheme: getAppDarkTheme(),
            themeMode: TaskCubit.get(context).islight
                ? ThemeMode.light
                : ThemeMode.dark,
            debugShowCheckedModeBanner: false,
            home: const SplashView(),
          );
        },
      ),
    );
  }
}

//
 