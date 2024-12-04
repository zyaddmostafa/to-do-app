import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/component/componnet.dart';
import 'package:to_do_app/core/utils/app_color.dart';
import 'package:to_do_app/core/utils/app_string.dart';
import 'package:to_do_app/core/widgets/custom_button.dart';
import 'package:to_do_app/features/task/data/model/task_model.dart';
import 'package:to_do_app/features/task/presentation/manager/task/task_cubit.dart';
import 'package:to_do_app/features/task/presentation/widgets/task_card.dart';

class TaskComponent extends StatelessWidget {
  const TaskComponent({
    super.key,
    required this.taskModel,
    required this.index,
  });
  final TaskModel taskModel;
  final int index;
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
                    taskModel.isCompleted != 1
                        ? Custombutton(
                            isloading: false,
                            text: AppString.taskcompleted,
                            onPressed: () {
                              BlocProvider.of<TaskCubit>(context).updateTask(
                                id: taskModel.id!,
                              );
                              showtoast(
                                  message:
                                      'task that title  "${taskModel.title}" is completed',
                                  state: ToastState.success);

                              Navigator.pop(context);
                            },
                          )
                        : Container(),
                    Custombutton(
                      isloading: false,
                      color: AppColor.red,
                      text: AppString.deletetask,
                      onPressed: () {
                        BlocProvider.of<TaskCubit>(context).deleteTask(
                          id: taskModel.id!,
                        );
                        showtoast(
                            message:
                                'task that title " ${taskModel.title}" is deleted',
                            state: ToastState.error);
                        Navigator.pop(context);
                      },
                    ),
                    Custombutton(
                      isloading: false,
                      text: AppString.cancle,
                      onPressed: () {
                        Navigator.pop(context);
                      },
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
