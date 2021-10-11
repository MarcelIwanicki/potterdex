import 'package:shared_preferences/shared_preferences.dart';

enum PotterdexTheme { GRYFFINDOR, SLYTHERIN, HUFFLEPUFF, RAVENCLAW }

class ThemePreferences {
  static const PREFERENCES_KEY =
      "com.iwanickimarcel.potterdex/theme_preferences";

  setTheme(PotterdexTheme value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt(PREFERENCES_KEY, value.index);
  }

  Future<PotterdexTheme> getTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return PotterdexTheme.values[sharedPreferences.getInt(PREFERENCES_KEY) ?? 0];
  }
}
