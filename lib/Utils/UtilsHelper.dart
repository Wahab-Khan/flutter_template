import 'package:shared_preferences/shared_preferences.dart';

const String _localeKey = 'locale';

void saveLocale(String currentLocale) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(_localeKey, currentLocale);
}

Future<String> getCurrentLocale() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString("locale") ?? "en";
}
