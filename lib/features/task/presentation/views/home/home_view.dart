import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/utils/app_assets.dart';
import 'package:to_do_app/core/utils/app_color.dart';
import 'package:to_do_app/core/utils/app_string.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        onPressed: () {},
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
                  .copyWith(fontSize: 24),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              AppString.today,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 24),
            ),
            const SizedBox(
              height: 14,
            ),
            DatePicker(
              height: 94,
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
            const SizedBox(
              height: 11,
            ),
            taskComponent(context),
          ],
        ),
      ),
    ));
  }

  Card taskComponent(BuildContext context) {
    return Card(
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
                      const VerticalDivider(
                        color: AppColor.red,
                        thickness: 10,
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
              width: 95,
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

class NoTaskWidget extends StatelessWidget {
  const NoTaskWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Image.asset(AppAssets.notask),
          Text(
            AppString.notask,
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(AppString.notasksub,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(fontSize: 16)),
        ],
      ),
    );
  }
}
