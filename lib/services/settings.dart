import 'package:get/get.dart';
import 'package:medtrack/app_module/dynamics/services/dynamics_services.dart';
import 'package:medtrack/app_module/medical_history/services/medical_history_service.dart';
import 'package:medtrack/app_module/medical_images/services/medical_images_services.dart';
import 'package:medtrack/app_module/prescription_module/services/prescription_service.dart';
import 'package:medtrack/authentication_module/services/auth_services.dart';
import 'package:medtrack/core/local/local_controller.dart';
import 'package:medtrack/core/Themes/theme_controller.dart';

void setupLocator()async {
  Get.lazyPut(() => LocalController());
  Get.lazyPut(() => ThemeController());
  Get.lazyPut(() => AuthServices());
  Get.lazyPut(() => DynamicsServices());
  Get.lazyPut(() => MedicalHistoryService());
  Get.lazyPut(() => MedicalImagesServices());
  Get.lazyPut(() => PrescriptionServices());
}
