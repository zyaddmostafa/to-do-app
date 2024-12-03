import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:to_do_app/core/utils/app_color.dart';
import 'package:to_do_app/core/utils/app_string.dart';
import 'package:to_do_app/features/task/data/model/task_model.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.taskModel,
  });
  final TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      color: AppColor.colorList[taskModel.color],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  taskModel.title,
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontSize: 24.sp,
                      ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    children: [
                      const Icon(
                        FontAwesomeIcons.clock,
                        color: AppColor.secondaryColor,
                        size: 24,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        "${taskModel.starttime} - ${taskModel.endtime}",
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(fontSize: 16.sp),
                      ),
                    ],
                  ),
                ),
                Text(
                  taskModel.note,
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontSize: 24.sp,
                      ),
                )
              ],
            ),
            SizedBox(
              width: 100.w,
            ),
            Container(
              height: 60.h,
              width: 0.6.w,
              color: AppColor.secondaryColor,
            ),
            RotatedBox(
              quarterTurns: 3,
              child: Text(
                taskModel.isCompleted == 1
                    ? AppString.completed
                    : AppString.toda,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(fontSize: 16.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
