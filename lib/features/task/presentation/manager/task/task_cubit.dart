import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/database/cache/cached_helper.dart';
import 'package:to_do_app/core/database/sqflite_helper/sqflite_helper.dart';
import 'package:to_do_app/core/services/service_locator.dart';
import 'package:to_do_app/features/task/data/model/task_model.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());
  TextEditingController titleController = TextEditingController();

  TextEditingController noteController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey();

  DateTime curentDate = DateTime.now();
  DateTime selectedDate = DateTime.now();

  String startTime = DateFormat.jm().format(DateTime.now());

  String endTime =
      DateFormat.jm().format(DateTime.now().add(const Duration(hours: 1)));

  int selectedColor = 0;

  void getDate(context) async {
    emit(TaskDateLoading());
    try {
      DateTime? timePicked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2025),
      );

      curentDate = timePicked ?? curentDate;
      emit(TaskDateSuccess());
    } on Exception catch (e) {
      emit(TaskDateFaliur(e.toString()));
    }
  }

  void getStartTime(context) async {
    emit(TaskStartTimeLoading());
    try {
      TimeOfDay? startTimePicked = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(DateTime.now()),
      );

      startTime = startTimePicked?.format(context) ?? startTime;
      emit(TaskStartTimeSuccess());
    } on Exception catch (e) {
      emit(TaskStartTimeFaliur(e.toString()));
    }
  }

  void getEndTime(context) async {
    emit(TaskEndTimeLoading());
    try {
      TimeOfDay? endTimePicked = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(DateTime.now()),
      );
      endTime = endTimePicked?.format(context) ?? endTime;
      emit(TaskEndTimeSuccess());
    } on Exception catch (e) {
      emit(TaskEndTimeFaliur(e.toString()));
    }
  }

  void getSelectedColor({required int index}) {
    emit(TaskSelectedColorLoading());
    try {
      selectedColor = index;
      emit(TaskSelectedColorSuccess());
    } on Exception catch (e) {
      emit(TaskSelectedColorFaliur(e.toString()));
    }
  }

  List<TaskModel> tasklist = [];

  void insertTask() async {
    emit(TaskInsertLoading());
    try {
      await getIt<SqfliteHelper>().insertTask(TaskModel(
          title: titleController.text,
          note: noteController.text,
          starttime: startTime,
          endtime: endTime,
          isCompleted: 0,
          color: selectedColor,
          date: DateFormat.yMd().format(curentDate)));

      titleController.clear();
      noteController.clear();
      emit(TaskInsertSuccess());

      await getTasks();
    } on Exception catch (e) {
      emit(TaskInsertFaliur(e.toString()));
    }
  }

  Future getTasks() async {
    emit(TaskGetLoading());
    try {
      await getIt<SqfliteHelper>().getTasks().then(
        (value) {
          tasklist = value
              .map((e) => TaskModel.fromjson(e))
              .toList()
              .where((element) =>
                  element.date == DateFormat.yMd().format(selectedDate))
              .toList();
        },
      );

      emit(TaskGetSuccess());
    } on Exception catch (e) {
      emit(TaskGetFaliur(e.toString()));
    }
  }

  void updateTask({required int id}) async {
    emit(TaskUpdateLoading());
    try {
      await getIt<SqfliteHelper>().updateTask(id);
      await getTasks();
      emit(TaskUpdateSuccess());
    } on Exception catch (e) {
      emit(TaskUpdateFaliur(e.toString()));
    }
  }

  void deleteTask({required int id}) async {
    emit(TaskDeleteLoading());
    try {
      await getIt<SqfliteHelper>().deleteTask(id);
      await getTasks();
      emit(TaskDeleteSuccess());
    } on Exception catch (e) {
      emit(TaskDeleteFaliur(e.toString()));
    }
  }

  void getSelectedDate(date) async {
    emit(TaskSelectedDateLoading());
    selectedDate = date;

    emit(TaskSelectedDateSuccess());
    await getTasks();
  }

  bool isDark = false;
  void changeTheme() async {
    isDark = !isDark;
    await getIt<CachedHelper>().savedata(key: 'theme', value: isDark);

    emit(TaskThemeChange());
  }

  void getTheme() async {
    isDark = await getIt<CachedHelper>().getdata(key: 'theme') ?? false;
    emit(TaskThemeChange());
  }
}
