import 'package:get_it/get_it.dart';
import 'package:to_do_app/core/database/cached_helper.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<CachedHelper>(() => CachedHelper());
}
