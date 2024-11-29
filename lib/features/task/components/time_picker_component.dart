import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:to_do_app/core/utils/app_color.dart';
import 'package:to_do_app/features/task/presentation/widgets/add_task_component.dart';

import '../../../core/utils/app_string.dart';

StatefulBuilder timePickerComponent(
    {required String startTime, required String endTime}) {
  return StatefulBuilder(
    builder: (context, setState) {
      return Row(
        children: [
          Expanded(
            child: AddTaskComponent(
              title: AppString.starttime,
              titlehint: startTime,
              suffixIcon: IconButton(
                onPressed: () async {
                  TimeOfDay? startTimePicked = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.fromDateTime(DateTime.now()),
                  );
                  setState(() {
                    startTime = startTimePicked?.format(context) ?? startTime;
                  });
                },
                icon: const Icon(
                  FontAwesomeIcons.clock,
                  color: AppColor.secondaryColor,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 24.w,
          ),
          Expanded(
            child: AddTaskComponent(
              title: AppString.endtime,
              titlehint: endTime,
              suffixIcon: IconButton(
                onPressed: () {
                  showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.fromDateTime(DateTime.now()),
                  ).then((value) {
                    setState(() {
                      endTime = value?.format(context) ?? endTime;
                    });
                  });
                },
                icon: const Icon(
                  FontAwesomeIcons.clock,
                  color: AppColor.secondaryColor,
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}
