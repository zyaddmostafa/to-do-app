import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/utils/app_color.dart';

class AddTaskComponent extends StatelessWidget {
  final String title;
  final String titlehint;
  final IconButton? suffixIcon;
  final TextEditingController? controller;

  const AddTaskComponent({
    super.key,
    required this.title,
    required this.titlehint,
    this.suffixIcon,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: 16.sp,
                color: AppColor.secondaryColor,
              ),
        ),
        SizedBox(height: 8.h),
        TextFormField(
          controller: controller,
          readOnly: suffixIcon != null ? true : false,
          decoration: InputDecoration(
            hintText: titlehint,
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 16.sp,
            ),
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        SizedBox(height: 24.h),
      ],
    );
  }
}
