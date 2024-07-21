abstract class TaskState {}

final class TaskInitial extends TaskState {}

// ! color state
final class ChangeCheckMarkIndexState extends TaskState {}

//! date selected state
final class ChangeDateSelectedState extends TaskState {}

//! date state
final class GetDateLoadingState extends TaskState {}

final class GetDateSuccessState extends TaskState {}

final class GetDateErrorState extends TaskState {}

//! start time state
final class GetStartTimeLoadingState extends TaskState {}

final class GetStartTimeSuccessState extends TaskState {}

final class GetStartTimeErrorState extends TaskState {}

//! end time state
final class GetEndTimeLoadingState extends TaskState {}

final class GetEndTimeSuccessState extends TaskState {}

final class GetEndTimeErrorState extends TaskState {}

// ! add task state
final class AddTaskLoadingState extends TaskState {}

final class AddTaskSuccessState extends TaskState {}

final class AddTaskErrorState extends TaskState {
  final String error;

  AddTaskErrorState(this.error);
}

// ! get task state
final class GetDataLoadingState extends TaskState {}

final class GetDataSuccessState extends TaskState {}

final class GetDataErrorState extends TaskState {
  final String error;

  GetDataErrorState(this.error);
}

// ! update task state
final class UpdateTaskLoadingState extends TaskState {}

final class UpdateTaskSuccessState extends TaskState {}

final class UpdateTaskErrorState extends TaskState {
  final String error;

  UpdateTaskErrorState(this.error);
}

// ! delete task state
final class DeleteTaskLoadingState extends TaskState {}

final class DeleteTaskSuccessState extends TaskState {}

final class DeleteTaskErrorState extends TaskState {
  final String error;

  DeleteTaskErrorState(this.error);
}

//! theme mode state

final class ChangeThemeLoadingState extends TaskState {}

final class ChangeThemeSuccessState extends TaskState {}

//! getTheme
final class GetThemeState extends TaskState {}
