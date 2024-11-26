import 'package:flutter/material.dart';
import 'package:to_do_app/app/app.dart';
import 'package:to_do_app/core/database/cached_helper.dart';
import 'package:to_do_app/core/services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  await getIt<CachedHelper>().init();
  runApp(const App());
}
