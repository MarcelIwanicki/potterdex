import 'package:flutter/material.dart';
import 'package:potterdex/preferences/theme_preferences.dart';

class ThemeNotifier extends ChangeNotifier {
  PotterdexTheme _theme = PotterdexTheme.GRYFFINDOR;
  final ThemePreferences _preferences = ThemePreferences();

  PotterdexTheme get theme => _theme;

  ThemeNotifier() {
    getPreferences();
  }

  set theme(PotterdexTheme value) {
    _theme = value;
    _preferences.setTheme(value);
    notifyListeners();
  }

  getPreferences() async {
    _theme = await _preferences.getTheme();
    notifyListeners();
  }
}
