import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData get darkTheme => ThemeData.dark().copyWith(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.backgroundColor,
        primaryColor: AppColors.blue,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.blue,
        ),
        appBarTheme:
            const AppBarTheme(backgroundColor: AppColors.backgroundColor),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: AppColors.blue),
        snackBarTheme:
            const SnackBarThemeData(behavior: SnackBarBehavior.floating),
      );
}
