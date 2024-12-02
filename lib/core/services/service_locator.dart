import 'package:get_it/get_it.dart';
import 'package:to_do_app/core/database/cache/cached_helper.dart';
import 'package:to_do_app/core/database/sqflite_helper/sqflite_helper.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<CachedHelper>(() => CachedHelper());
  getIt.registerLazySingleton<SqfliteHelper>(() => SqfliteHelper());
}
