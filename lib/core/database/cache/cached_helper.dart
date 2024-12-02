import 'package:shared_preferences/shared_preferences.dart';

class CachedHelper {
  late final SharedPreferences sharedPreferences;

  init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<bool> savedata({required dynamic key, required dynamic value}) async {
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else {
      return await sharedPreferences.setString(key, value.toString());
    }
  }

  dynamic getdata({required dynamic key}) {
    return sharedPreferences.get(key);
  }
}
