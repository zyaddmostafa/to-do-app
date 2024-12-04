import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddTaskComponent extends StatelessWidget {
  final String title;
  final String titlehint;
  final IconButton? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  const AddTaskComponent({
    super.key,
    required this.title,
    required this.titlehint,
    this.suffixIcon,
    this.controller,
    this.validator,
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
                color: Theme.of(context).inputDecorationTheme.hintStyle?.color,
              ),
        ),
        SizedBox(height: 8.h),
        TextFormField(
          validator: validator,
          controller: controller,
          readOnly: suffixIcon != null ? true : false,
          decoration: InputDecoration(
            hintText: titlehint,
            hintStyle: TextStyle(
              color: Theme.of(context).iconTheme.color,
              fontSize: 16.sp,
            ),
            suffixIcon: suffixIcon,
            suffixIconColor: Theme.of(context).iconTheme.color,
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
