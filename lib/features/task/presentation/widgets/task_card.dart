import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/utils/app_color.dart';
import 'package:to_do_app/core/utils/app_string.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      color: AppColor.red,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Task 1',
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontSize: 24,
                      ),
                ),
                const SizedBox(
                  height: 8,
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
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "${DateFormat.jm().format(DateTime.now())} - ${DateFormat.jm().format(DateTime.now().add(const Duration(hours: 2)))}",
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Learn Flutter',
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontSize: 24,
                      ),
                )
              ],
            ),
            const SizedBox(
              width: 100,
            ),
            Container(
              height: 60,
              width: 0.6,
              color: AppColor.secondaryColor,
            ),
            RotatedBox(
              quarterTurns: 3,
              child: Text(
                AppString.toda,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
