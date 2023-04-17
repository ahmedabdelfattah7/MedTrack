import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medtrack/core/local/local.dart';
import 'package:medtrack/core/routes/routes.dart';
import 'package:medtrack/core/services/services.dart';

import 'core/Themes/themes.dart';

class MedTrack extends StatelessWidget {
  const MedTrack({
    super.key,
    required this.initialRoute,
  });
  final String initialRoute;

  @override
  Widget build(BuildContext context) {

    return
           GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'MedTrack',
          locale: Get.deviceLocale,
          translations: AppLocal(),
          initialBinding: AppBindings(),
          theme: AppThemes.getThemeDataLight(),
          initialRoute: initialRoute,
          getPages: Routes.getPages,
        );
    }

  }

