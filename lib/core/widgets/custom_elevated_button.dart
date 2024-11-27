import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/app_string.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key, this.onPressed, required this.index});
  final void Function()? onPressed;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: Theme.of(context).elevatedButtonTheme.style!,
      onPressed: onPressed,
      child: Text(
        index != 2 ? AppString.next : AppString.getstarted,
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }
}
