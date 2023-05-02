import 'package:get/get.dart';
import 'package:medtrack/authentication_module/controller/auth_controller.dart';
import 'package:medtrack/core/local/local_controller.dart';
import 'package:medtrack/medical_reports_module/controller/home_controller.dart';
import 'package:medtrack/medical_reports_module/controller/medical_history_controller.dart';
import 'package:medtrack/medical_reports_module/controller/theme_controller.dart';


class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(ThemeController());
    Get.lazyPut(()=>MedicalHistoryController());
    Get.lazyPut(()=>HomeController());
    Get.put(LocalController());
  }
}