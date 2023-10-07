import 'dart:ui';

import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';

//final sharedPreferences = await SharedPreferences.getInstance();
// final cachedThemeIndex = sharedPreferences.getBool("THEME_INDEX");
class ThemeHelper {
  Future<void> cacheThemeIndex(bool themeIndex) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("THEME_INDEX", themeIndex);
  }

  Future<bool> getCurrentTheme() async {
    Brightness brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
    switch (brightness) {
      case Brightness.dark:
        return true;
      case Brightness.light:
        return false;
    }
  }
}
