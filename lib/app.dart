import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medtrack/core/routes/routes.dart';
import 'package:medtrack/core/services/services.dart';

import 'authentication_module/controller/auth_controller.dart';
import 'core/Themes/themes.dart';

class MedTrack extends StatelessWidget {
  MedTrack({super.key,});
  final AuthController controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: ( controller) {
        print('this is get ${controller.user}');
        return
          GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'MedTrack',
            initialBinding: AppBindings(),
            theme: AppThemes.lightTheme,
            initialRoute: controller.user !=null ? '/home' : '/login',
            getPages: Routes.getPages,
          );
      }
    );}
  }

