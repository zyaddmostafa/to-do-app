part of 'task_cubit.dart';

@immutable
sealed class TaskState {}

final class TaskInitial extends TaskState {}

final class TaskDateLoading extends TaskState {}

final class TaskDateSuccess extends TaskState {}

final class TaskDateFaliur extends TaskState {
  final String errormeasage;

  TaskDateFaliur(this.errormeasage);
}

final class TaskStartTimeLoading extends TaskState {}

final class TaskStartTimeSuccess extends TaskState {}

final class TaskStartTimeFaliur extends TaskState {
  final String errormeasage;

  TaskStartTimeFaliur(this.errormeasage);
}

final class TaskEndTimeLoading extends TaskState {}

final class TaskEndTimeSuccess extends TaskState {}

final class TaskEndTimeFaliur extends TaskState {
  final String errormeasage;

  TaskEndTimeFaliur(this.errormeasage);
}

final class TaskSelectedColorLoading extends TaskState {}

final class TaskSelectedColorSuccess extends TaskState {}

final class TaskSelectedColorFaliur extends TaskState {
  final String errormeasage;

  TaskSelectedColorFaliur(this.errormeasage);
}

final class TaskInsertLoading extends TaskState {}

final class TaskInsertSuccess extends TaskState {}

final class TaskInsertFaliur extends TaskState {
  final String errormeasage;

  TaskInsertFaliur(this.errormeasage);
}
