import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/utils/app_color.dart';
import 'package:to_do_app/core/utils/app_string.dart';
import 'package:to_do_app/core/utils/navigate_helper.dart';
import 'package:to_do_app/features/task/presentation/views/add_task/add_task_view.dart';
import 'package:to_do_app/features/task/presentation/widgets/task_component.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        onPressed: () {
          context.navigateTo(const AddTaskView());
        },
        backgroundColor: AppColor.primaryColor,
        child: const Icon(
          Icons.add,
          color: AppColor.secondaryColor,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat.yMMMMd().format(DateTime.now()),
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 24.sp),
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(
              AppString.today,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 24.sp),
            ),
            SizedBox(
              height: 14.h,
            ),
            DatePicker(
              height: 94.h,
              DateTime.now(),
              initialSelectedDate: DateTime.now(),
              selectionColor: AppColor.primaryColor.withOpacity(0.7),
              selectedTextColor: Colors.white,
              dateTextStyle: Theme.of(context).textTheme.displaySmall!,
              dayTextStyle: Theme.of(context).textTheme.displaySmall!,
              monthTextStyle: Theme.of(context).textTheme.displaySmall!,
              onDateChange: (date) {
                // New date selected
                // setState(() {
                //   _selectedValue = date;
                // });
              },
            ),
            SizedBox(
              height: 24.h,
            ),
            const TaskComponent(),
          ],
        ),
      ),
    ));
  }
}
