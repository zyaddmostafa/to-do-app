import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/utils/app_color.dart';

class Custombutton extends StatelessWidget {
  const Custombutton({
    super.key,
    required this.onPressed,
    required this.text,
    this.color = AppColor.primaryColor,
    required this.isloading,
  });
  final bool isloading;
  final void Function() onPressed;
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: SizedBox(
        height: 48.h,
        width: 327.w,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: onPressed,
          child: isloading
              ? Center(
                  child: CircularProgressIndicator(
                  color: Theme.of(context).scaffoldBackgroundColor,
                ))
              : Text(
                  text,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
        ),
      ),
    );
  }
}
