import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
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
              const NoTaskWidget()
            ],
          ),
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
