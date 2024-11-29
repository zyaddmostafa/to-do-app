import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:to_do_app/core/utils/app_color.dart';
import 'package:to_do_app/features/task/presentation/manager/task/task_cubit.dart';
import 'package:to_do_app/features/task/presentation/widgets/add_task_component.dart';

import '../../../core/utils/app_string.dart';

timePickerComponent(
    {required String startTime,
    required String endTime,
    required BuildContext context}) {
  return Row(
    children: [
      Expanded(
        child: AddTaskComponent(
          title: AppString.starttime,
          titlehint: startTime,
          suffixIcon: IconButton(
            onPressed: () async {
              BlocProvider.of<TaskCubit>(context).getStartTime(context);
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
              BlocProvider.of<TaskCubit>(context).getEndTime(context);
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
}
