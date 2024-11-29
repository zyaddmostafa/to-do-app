import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/utils/app_color.dart';
import 'package:to_do_app/core/utils/app_string.dart';
import 'package:to_do_app/core/widgets/custom_button.dart';
import 'package:to_do_app/features/task/presentation/widgets/task_card.dart';

class TaskComponent extends StatelessWidget {
  const TaskComponent({
    super.key,
  });

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
                      text: AppString.taskcompleted,
                      onPressed: () {},
                    ),
                    Custombutton(
                      color: AppColor.red,
                      text: AppString.deletetask,
                      onPressed: () {},
                    ),
                    Custombutton(
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
      child: const TaskCard(),
    );
  }
}
