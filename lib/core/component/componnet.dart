import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showtoast({required String message, required ToastState state}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: getstatecolor(state),
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

enum ToastState { success, error, warning }

Color getstatecolor(ToastState state) {
  switch (state) {
    case ToastState.success:
      return Colors.green;
    case ToastState.error:
      return Colors.red;
    case ToastState.warning:
      return Colors.orange;
    default:
      return Colors.black;
  }
}
