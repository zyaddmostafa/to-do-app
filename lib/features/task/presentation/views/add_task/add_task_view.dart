import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/utils/app_color.dart';
import 'package:to_do_app/core/utils/app_string.dart';
import 'package:to_do_app/core/widgets/custom_button.dart';
import 'package:to_do_app/features/task/components/date_picker_component.dart';
import 'package:to_do_app/features/task/components/time_picker_component.dart';
import 'package:to_do_app/features/task/presentation/manager/task/task_cubit.dart';
import 'package:to_do_app/features/task/presentation/widgets/add_task_component.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
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
      body: BlocBuilder<TaskCubit, TaskState>(
        builder: (context, state) {
          return Form(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AddTaskComponent(
                        title: AppString.title,
                        controller:
                            BlocProvider.of<TaskCubit>(context).titleController,
                        titlehint: AppString.titlehint),
                    AddTaskComponent(
                        title: AppString.note,
                        controller:
                            BlocProvider.of<TaskCubit>(context).noteController,
                        titlehint: AppString.notehint),
                    datePickerComponent(
                        context: context,
                        curentDate:
                            BlocProvider.of<TaskCubit>(context).curentDate),
                    timePickerComponent(
                        context: context,
                        startTime:
                            BlocProvider.of<TaskCubit>(context).startTime,
                        endTime: BlocProvider.of<TaskCubit>(context).endTime),
                    SizedBox(
                      height: 24.h,
                    ),
                    SizedBox(
                      height: 68.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Color',
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontSize: 16.sp,
                                      color: AppColor.secondaryColor,
                                    ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: AppColor.colorList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: GestureDetector(
                                    onTap: () {
                                      BlocProvider.of<TaskCubit>(context)
                                          .getSelectedColor(index: index);
                                    },
                                    child: CircleAvatar(
                                      backgroundColor:
                                          AppColor.colorList[index],
                                      child: BlocProvider.of<TaskCubit>(context)
                                                  .selectedColor ==
                                              index
                                          ? const Icon(
                                              Icons.check,
                                              color: AppColor.secondaryColor,
                                            )
                                          : null,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 35.h,
                    ),
                    Custombutton(
                      onPressed: () {},
                      text: AppString.addtask,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
