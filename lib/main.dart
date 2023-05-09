import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medtrack/core/local/local_controller.dart';
import 'package:medtrack/core/network/local/cache_helper.dart';
import 'package:medtrack/medical_reports_module/controller/theme_controller.dart';
import 'package:medtrack/services/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app.dart';
import 'core/utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  String initialRoute;
  userUid = CacheHelper.getData(key: 'UserId');
  if (userUid != null) {
    initialRoute = '/AppLayout';
  } else {
    initialRoute = '/welcome';
  }
  runApp(MedTrack(
    initialRoute: initialRoute,
  ));
}


Future initServices() async {
  await Get.putAsync(() => SettingsService().init());
}
