import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/database/cache/cache_helper.dart';
import 'package:todo_app/core/database/sqflite_helper/sqflite_helper.dart';
import 'package:todo_app/core/helper/utils/app_colors.dart';
import 'package:todo_app/core/services/dependency_injection.dart';
import 'package:todo_app/features/home/data/model/task_model.dart';
import 'package:todo_app/features/home/presentation/cubit/task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());
  static TaskCubit get(context) => BlocProvider.of(context);

  //! title, note controllers
  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  // ! form key
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  //! on color changed

  Color getColor(int index) {
    switch (index) {
      case 0:
        return AppColors.red;
      case 1:
        return AppColors.blue;
      case 2:
        return AppColors.grey;
      case 3:
        return AppColors.orange;
      case 4:
        return AppColors.green;
      case 5:
        return AppColors.blueGrey;
      default:
        return AppColors.purple;
    }
  }

  int currentIndex = 0;
  void changeCheckMarkIndex(int index) {
    currentIndex = index;
    emit(ChangeCheckMarkIndexState());
  }

  //? add task view methods
  //! get date
  String currentDate = DateFormat.yMd().format(DateTime.now());
  Future<void> getDate(BuildContext context) async {
    emit(GetDateLoadingState());
    DateTime? selectedDateTime = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (selectedDateTime != null) {
      currentDate = DateFormat.yMd().format(selectedDateTime);
      emit(GetDateSuccessState());
    } else {
      emit(GetDateErrorState());
    }
  }

  //! time start and end
  String startTime = DateFormat('hh:mm a').format(DateTime.now());

  Future<void> getStartTime(context) async {
    emit(GetStartTimeLoadingState());
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (selectedTime != null) {
      startTime = selectedTime.format(context);
      emit(GetStartTimeSuccessState());
    } else {
      emit(GetStartTimeErrorState());
    }
  }

  String endTime = DateFormat('hh:mm a').format(
    DateTime.now().add(const Duration(hours: 1)),
  );

  Future<void> getEndTime(context) async {
    emit(GetEndTimeLoadingState());
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (selectedTime != null) {
      endTime = selectedTime.format(context);
      emit(GetEndTimeSuccessState());
    } else {
      emit(GetEndTimeErrorState());
    }
  }

  //! add task
  List<TaskModel> tasksList = [];
  Future<void> addTask() async {
    emit(AddTaskLoadingState());
    try {
      await getIt<SqfliteHelper>().insertToDB(
        TaskModel(
          title: titleController.text,
          note: noteController.text,
          date: currentDate,
          startTime: startTime,
          endTime: endTime,
          color: currentIndex,
          isCompleted: 0,
        ),
      );

      emit(AddTaskSuccessState());
      await getTasks();
    } on Exception catch (e) {
      emit(AddTaskErrorState(e.toString()));
    }
    //? clear data
    clearData();
  }

  void clearData() {
    titleController.clear();
    noteController.clear();
    currentDate = DateFormat.yMd().format(DateTime.now());
    startTime = DateFormat('hh:mm a').format(DateTime.now());
    endTime = DateFormat('hh:mm a').format(
      DateTime.now().add(const Duration(hours: 1)),
    );
    currentIndex = 0;
  }

  //? home view methods
  //! get all tasks
  Future<void> getTasks() async {
    emit(GetDataLoadingState());

    try {
      await getIt<SqfliteHelper>().getFromDB().then(
        (value) async {
          tasksList = value.map((e) => TaskModel.fromJson(e)).toList();

          // Filter tasks based on repeat settings
          tasksList = tasksList.where(
            (element) {
              return element.date == selectedDate;
            },
          ).toList();
        },
      );

      emit(GetDataSuccessState());
    } on Exception catch (e) {
      emit(GetDataErrorState(e.toString()));
    }
  }

  //! update task
  Future<void> updateTask(int id) async {
    emit(UpdateTaskLoadingState());
    try {
      await getIt<SqfliteHelper>().updatedDB(id);
      emit(UpdateTaskSuccessState());
      await getTasks();
    } on Exception catch (e) {
      emit(UpdateTaskErrorState(e.toString()));
    }
  }

  //! delete task
  Future<void> deleteTask(int id) async {
    emit(DeleteTaskLoadingState());
    try {
      await getIt<SqfliteHelper>().deleteFromDB(id);
      emit(DeleteTaskSuccessState());
      await getTasks();
    } on Exception catch (e) {
      emit(DeleteTaskErrorState(e.toString()));
    }
  }

  // !  get selected Date

  String selectedDate = DateFormat.yMd().format(DateTime.now());

  getSelectedDate(date) {
    selectedDate = DateFormat.yMd().format(date);
    emit(ChangeDateSelectedState());
    getTasks();
  }

  //! change theme => light, dark, system

  bool islight = true;
  Future<void> changeTheme() async {
    emit(ChangeThemeLoadingState());

    islight = !islight;
    emit(ChangeThemeSuccessState());
    await getIt<CacheHelper>().saveData(
      key: 'islight',
      value: islight,
    );
  }
  //! get theme

  Future<void> getTheme() async {
    bool? value = await getIt<CacheHelper>().getData(key: 'islight');

    if (value != null) {
      islight = value;
    } else {
      islight = true;
    }
    emit(GetThemeState());
  }
}
