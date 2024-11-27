import 'package:flutter/material.dart';

extension NavigateHelper on BuildContext {
  void navigateTo(Widget page) {
    Navigator.of(this).push(MaterialPageRoute(builder: (context) => page));
  }

  void navigatereplace(Widget page) {
    Navigator.of(this)
        .pushReplacement(MaterialPageRoute(builder: (context) => page));
  }
}
