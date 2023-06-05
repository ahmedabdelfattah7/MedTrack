import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medtrack/core/network/local/cache_helper.dart';


class ThemeController extends GetxController {
  final _isDarkMode = false.obs;

  bool get isDarkMode => _isDarkMode.value;

  @override
  void onInit() {
    super.onInit();
    _loadThemeFromCache();
  }

  void _loadThemeFromCache() async {
    _isDarkMode.value = await CacheHelper.getBoolData(key: 'isDarkMode') ?? false;
    Get.changeThemeMode(isDarkMode ? ThemeMode.dark : ThemeMode.light);
  }

  void _saveThemeToCache() {
    CacheHelper.saveData(key: 'isDarkMode', value: _isDarkMode.value);
  }

  void toggleTheme() {
    _isDarkMode.toggle();
    _saveThemeToCache();
    Get.changeThemeMode(isDarkMode ? ThemeMode.dark : ThemeMode.light);
  }
}
