import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/utils/app_assets.dart';
import 'package:to_do_app/core/utils/app_string.dart';

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
                .copyWith(fontSize: 20.sp),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(AppString.notasksub,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(fontSize: 16.sp)),
        ],
      ),
    );
  }
}
