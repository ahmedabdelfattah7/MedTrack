import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medtrack/core/local/local.dart';
import 'package:medtrack/core/local/local_controller.dart';
import 'package:medtrack/core/Themes/theme_controller.dart';
import 'package:medtrack/services/bindings.dart';
import 'core/Themes/themes.dart';
import 'routes/routes.dart';

class MedTrack extends StatelessWidget {
  const MedTrack({
    super.key,
    required this.initialRoute,
  });

  final String initialRoute;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MedTrack',
      locale: Get.find<LocalController>().initialLang,
      translations: AppLocal(),
      initialBinding: AppBindings(),
      theme: AppThemes.getThemeDataLight(),
      darkTheme: AppThemes.getThemeDataDark(),
      themeMode: Get.find<ThemeController>().isDarkMode
          ? ThemeMode.dark
          : ThemeMode.light,
      initialRoute: initialRoute,
      getPages: Routes.getPages,
    );
  }
}
