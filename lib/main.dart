import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/app/app.dart';
import 'package:to_do_app/core/bloc/bloc_observer.dart';
import 'package:to_do_app/core/database/cache/cached_helper.dart';
import 'package:to_do_app/core/database/sqflite_helper/sqflite_helper.dart';
import 'package:to_do_app/core/services/service_locator.dart';
import 'package:to_do_app/features/task/presentation/manager/task/task_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  await getIt<CachedHelper>().init();
  await getIt<SqfliteHelper>().initDb();
  Bloc.observer = AppBlocObserver();
  runApp(BlocProvider(
    create: (context) => TaskCubit(),
    child: const App(),
  ));
}
