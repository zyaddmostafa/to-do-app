import 'package:flutter/material.dart';
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
                fontSize: 16,
                color: AppColor.secondaryColor,
              ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          readOnly: suffixIcon != null ? true : false,
          decoration: InputDecoration(
            hintText: titlehint,
            hintStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
