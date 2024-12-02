import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/utils/app_color.dart';
import 'package:to_do_app/core/utils/app_string.dart';
import 'package:to_do_app/core/widgets/custom_button.dart';
import 'package:to_do_app/features/task/data/model/task_model.dart';
import 'package:to_do_app/features/task/presentation/widgets/task_card.dart';

class TaskComponent extends StatelessWidget {
  const TaskComponent({
    super.key,
    required this.taskModel,
  });
  final TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          backgroundColor: AppColor.deepgrey,
          context: context,
          builder: (context) {
            return SizedBox(
              height: 240.h,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    Custombutton(
                      isloading: false,
                      text: AppString.taskcompleted,
                      onPressed: () {},
                    ),
                    Custombutton(
                      isloading: false,
                      color: AppColor.red,
                      text: AppString.deletetask,
                      onPressed: () {},
                    ),
                    Custombutton(
                      isloading: false,
                      text: AppString.cancle,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: TaskCard(
        taskModel: taskModel,
      ),
    );
  }
}
