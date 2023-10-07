import 'package:astama/core/constants/app_color.dart';
import 'package:flutter/material.dart';

enum AppTheme {
  light("Light Mode", false),
  dark("Dark Mode", true);

  const AppTheme(this.name, this.value);

  final String name;
  final bool value;
}

Map appThemeData = {
  AppTheme.light: ThemeData(
    useMaterial3: true,
    appBarTheme:
        const AppBarTheme(color: Colors.white, surfaceTintColor: Colors.white),
    scaffoldBackgroundColor: Colors.white,
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFFF1F1F1),
    ),
    brightness: Brightness.light,
    primaryColor: AppColor.kPrimaryColor,
  ),
  AppTheme.dark: ThemeData(
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
          color: Color(0xff2e2e2e), surfaceTintColor: Color(0xff2e2e2e)),
      scaffoldBackgroundColor: const Color(0xff2e2e2e),
      brightness: Brightness.dark,
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: Color(0xFF434343),
      ),
      iconTheme: const IconThemeData(color: Colors.white),
      primaryColor: AppColor.kPrimaryColor),
};
