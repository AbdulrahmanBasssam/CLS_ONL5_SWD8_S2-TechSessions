import 'package:shared_preferences/shared_preferences.dart';

class CounterDb {
  SharedPreferences? prefs;
  static String key = 'counter';

  Future<SharedPreferences?> get prefsInstance async {
    if (prefs == null) {
      prefs = await SharedPreferences.getInstance();
      return prefs;
    } else {
      return prefs!;
    }
  }

  Future<void> setCounter(int counter) async {
    final prefs = await prefsInstance;
    if (prefs != null) {
      await prefs.setInt(key, counter);
    }
  }

  Future<int> getCounter() async {
    final prefs = await prefsInstance;
    if (prefs != null) {
      return prefs.getInt(key) ?? 0;
    } else {
      return 0;
    }
  }
}
