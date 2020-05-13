import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceSetting {
  String language;

  Future<String> getLanguage() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final String value = pref.getString(language);
    return value;
  }

  Future<bool> setLanguage(String value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(language, value);
  }
}
