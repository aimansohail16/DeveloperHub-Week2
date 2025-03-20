import 'package:shared_preferences/shared_preferences.dart';

class CounterStorage {
  static const String _counterkey = 'counter';

  static Future<void> saveValue(int value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_counterkey, value);
  }

  static Future<int> getValue() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_counterkey) ?? 0;
  }
}
