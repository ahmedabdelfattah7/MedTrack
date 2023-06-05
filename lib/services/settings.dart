import 'package:get/get.dart';
import 'package:medtrack/authentication_module/services/auth_services.dart';
import 'package:medtrack/core/local/local_controller.dart';
import 'package:medtrack/core/Themes/theme_controller.dart';
import 'package:medtrack/medical_reports_module/view/pages/home/dynamics/services/dynamics_services.dart';
import 'package:medtrack/medical_reports_module/view/pages/home/medical_history/services/medical_history_service.dart';

void setupLocator()async {
  Get.lazyPut(() => LocalController());
  Get.lazyPut(() => ThemeController());
  Get.lazyPut(() => AuthServices());
  Get.lazyPut(() => DynamicsServices());

  Get.lazyPut(() => MedicalHistoryService());
}
