import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:medtrack/authentication_module/controller/auth_controller.dart';
import 'package:medtrack/core/local/local_controller.dart';
import 'package:medtrack/core/network/local/cache_helper.dart';
import 'package:medtrack/medical_reports_module/controller/theme_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsService extends GetxService {
  Future<SettingsService> init() async {
    await Get.putAsync(() => SharedPreferences.getInstance());
    await Firebase.initializeApp();
    Get.put(AuthController().getUser());
    Get.put(ThemeController());
    Get.put(LocalController());
    await CacheHelper.init();
    return this;
  }
}
