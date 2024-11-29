import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/utils/app_color.dart';
import 'package:to_do_app/core/utils/app_string.dart';
import 'package:to_do_app/features/task/presentation/widgets/add_task_component.dart';

StatefulBuilder datePickerComponent({required DateTime curentDate}) {
  return StatefulBuilder(
    builder: (context, setState) {
      return AddTaskComponent(
        title: AppString.date,
        titlehint: DateFormat.yMd().format(curentDate),
        suffixIcon: IconButton(
          onPressed: () async {
            DateTime? timePicked = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(2025),
            );
            setState(() {
              curentDate = timePicked ?? curentDate;
            });
          },
          icon: const Icon(
            Icons.calendar_today,
            color: AppColor.secondaryColor,
          ),
        ),
      );
    },
  );
}
