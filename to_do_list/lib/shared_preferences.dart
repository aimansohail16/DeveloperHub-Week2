import 'package:shared_preferences/shared_preferences.dart';

class TaskStorage {
  static const String _taskKey = 'task';

  static Future<void> saveValue(List<String> value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_taskKey, value);
  }

  static Future<List<String>> getValue() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_taskKey) ?? [];
  }
}
