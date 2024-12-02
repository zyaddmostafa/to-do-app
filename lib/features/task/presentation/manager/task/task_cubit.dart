import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:to_do_app/features/task/data/model/task_model.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());
  TextEditingController titleController = TextEditingController();

  TextEditingController noteController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey();

  DateTime curentDate = DateTime.now();

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

  void insertTask() {
    emit(TaskInsertLoading());
    try {
      tasklist.add(TaskModel(
          id: '1',
          title: titleController.text,
          note: noteController.text,
          starttime: startTime,
          endtime: endTime,
          isCompleted: false,
          color: selectedColor,
          date: DateFormat('yyyy-MM-dd').format(curentDate)));
      titleController.clear();
      noteController.clear();
      emit(TaskInsertSuccess());
      print(tasklist.length);
    } on Exception catch (e) {
      emit(TaskInsertFaliur(e.toString()));
    }
  }
}
