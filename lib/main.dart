import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/app/my_app.dart';
import 'package:todo_app/core/database/cache/cache_helper.dart';
import 'package:todo_app/core/database/sqflite_helper/sqflite_helper.dart';
import 'package:todo_app/core/helper/observer/my_bloc_observer.dart';
import 'package:todo_app/core/services/dependency_injection.dart';
import 'package:todo_app/features/home/presentation/cubit/task_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //! set up Bloc Observers
  Bloc.observer = AppBlocObservers();
  //! set up Get It
  setupGetIt();
  //! Here The Initialize of cache => sharedPreferences
  await getIt<CacheHelper>().init();
  //! Here The Initialize of local storage => SQFLite
  await getIt<SqfliteHelper>().initDB();
  //! To fix texts being hidden bug in flutter_screenutil in release mode.
  await ScreenUtil.ensureScreenSize();

  //! runApp
  runApp(
    BlocProvider(
      create: (context) => TaskCubit()
        ..getTheme()
        ..getTasks(),
      child: const ToDoApp(),
    ),
  );
}
