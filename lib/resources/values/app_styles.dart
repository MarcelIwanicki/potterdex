import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppStyles {
  static final gryffindorTheme = ThemeData(
    primarySwatch: Colors.red,
    primaryColor: AppColors.GRYFFINDOR_PRIMARY_COLOR,
    accentColor: AppColors.GRYFFINDOR_ACCENT_COLOR,
    secondaryHeaderColor: AppColors.GRYFFINDOR_SECONDARY_COLOR,
    primaryColorLight: AppColors.GRYFFINDOR_LIGHT_COLOR,
    primaryColorDark: AppColors.GRYFFINDOR_DARK_COLOR,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static final slytherinTheme = ThemeData(
    primarySwatch: Colors.green,
    primaryColor: AppColors.SLYTHERIN_PRIMARY_COLOR,
    accentColor: AppColors.SLYTHERIN_ACCENT_COLOR,
    secondaryHeaderColor: AppColors.SLYTHERIN_SECONDARY_COLOR,
    primaryColorLight: AppColors.GRYFFINDOR_LIGHT_COLOR,
    primaryColorDark: AppColors.SLYTHERIN_DARK_COLOR,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static final hufflepuffTheme = ThemeData(
    primarySwatch: Colors.yellow,
    primaryColor: AppColors.HUFFLEPUFF_PRIMARY_COLOR,
    accentColor: AppColors.HUFFLEPUFF_ACCENT_COLOR,
    secondaryHeaderColor: AppColors.HUFFLEPUFF_SECONDARY_COLOR,
    primaryColorLight: AppColors.GRYFFINDOR_LIGHT_COLOR,
    primaryColorDark: AppColors.HUFFLEPUFF_DARK_COLOR,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static final ravenclawTheme = ThemeData(
    primarySwatch: Colors.blue,
    primaryColor: AppColors.RAVENCLAW_PRIMARY_COLOR,
    accentColor: AppColors.RAVENCLAW_ACCENT_COLOR,
    secondaryHeaderColor: AppColors.RAVENCLAW_SECONDARY_COLOR,
    primaryColorLight: AppColors.GRYFFINDOR_LIGHT_COLOR,
    primaryColorDark: AppColors.RAVENCLAW_DARK_COLOR,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
