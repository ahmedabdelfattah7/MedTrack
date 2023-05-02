import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medtrack/core/network/local/cache_helper.dart';
import 'package:medtrack/core/services/settings.dart';
import 'app.dart';
import 'core/utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  String initialRoute;
  uId = CacheHelper.getData(key: 'UserId');
  if (uId != null) {
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
