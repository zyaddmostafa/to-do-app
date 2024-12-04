import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/utils/app_string.dart';
import 'package:to_do_app/features/task/presentation/manager/task/task_cubit.dart';
import 'package:to_do_app/features/task/presentation/widgets/add_task_component.dart';

datePickerComponent(
    {required DateTime curentDate, required BuildContext context}) {
  return AddTaskComponent(
    title: AppString.date,
    titlehint: DateFormat.yMd().format(curentDate),
    suffixIcon: IconButton(
      onPressed: () async {
        BlocProvider.of<TaskCubit>(context).getDate(context);
      },
      icon: Icon(
        Icons.calendar_today,
        color: Theme.of(context).iconTheme.color,
      ),
    ),
  );
}
