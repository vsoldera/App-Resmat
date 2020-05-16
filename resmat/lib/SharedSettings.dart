import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceSetting {
  String language;

  Future<String> getLanguage() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final String value = pref.getString('ln');
    return value;
  }

  Future<void> setLanguage(String value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('ln', value);
    return;
  }
}
