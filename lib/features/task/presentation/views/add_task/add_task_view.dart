import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/utils/app_color.dart';
import 'package:to_do_app/core/utils/app_string.dart';
import 'package:to_do_app/core/widgets/custom_button.dart';
import 'package:to_do_app/features/task/components/date_picker_component.dart';
import 'package:to_do_app/features/task/components/time_picker_component.dart';
import 'package:to_do_app/features/task/presentation/widgets/add_task_component.dart';

class AddTaskView extends StatelessWidget {
  AddTaskView({super.key});
  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  DateTime curentDate = DateTime.now();
  String startTime = DateFormat.jm().format(DateTime.now());
  String endTime =
      DateFormat.jm().format(DateTime.now().add(const Duration(hours: 1)));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context)
            .iconTheme
            .copyWith(color: AppColor.secondaryColor),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          AppString.addtask,
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AddTaskComponent(
                title: AppString.title,
                controller: titleController,
                titlehint: AppString.titlehint),
            AddTaskComponent(
                title: AppString.note,
                controller: noteController,
                titlehint: AppString.notehint),
            datePickerComponent(curentDate: curentDate),
            timePickerComponent(startTime: startTime, endTime: endTime),
            const SizedBox(
              height: 24,
            ),
            Custombutton(
              onPressed: () {},
              text: AppString.addtask,
            ),
          ],
        ),
      ),
    );
  }
}
