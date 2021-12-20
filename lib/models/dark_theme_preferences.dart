import 'package:shared_preferences/shared_preferences.dart';

//we will are shared preference dependency to save the state(dark theme or light theme). It is the purpose of this class DarkThemePreferences
class DarkThemePreferences {
  static const THEME_STATUS = "THEMESTATUS";

  setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(THEME_STATUS, value);
  }

// ?? means if it is(get) null then return false
  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(
          THEME_STATUS,
        ) ??
        false;
  }
}
