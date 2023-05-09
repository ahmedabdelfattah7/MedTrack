import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:medtrack/authentication_module/services/auth_services.dart';
import 'package:medtrack/core/local/local_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../authentication_module/controller/auth_controller.dart';
import '../core/network/local/cache_helper.dart';
import '../medical_reports_module/controller/theme_controller.dart';


class SettingsService extends GetxService {
  Future<SettingsService> init() async {
    await Firebase.initializeApp();
    await Get.putAsync(() => SharedPreferences.getInstance());
    Get.lazyPut(()=>AuthController());
    Get.lazyPut(()=>AuthServices());
    Get.put(ThemeController());
    Get.put(LocalController());
    await CacheHelper.init();

    return this;
  }
}
