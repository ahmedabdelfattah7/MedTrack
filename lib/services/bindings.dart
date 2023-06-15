import 'package:get/get.dart';
import 'package:medtrack/authentication_module/controller/auth_controller.dart';
import 'package:medtrack/medical_reports_module/controllers/dynamics_controller.dart';
import 'package:medtrack/medical_reports_module/controllers/home_controller.dart';
import 'package:medtrack/medical_reports_module/controllers/medical_history_controller.dart';


class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>AuthController());
    Get.lazyPut(()=>HomeController());
    Get.lazyPut(()=>MedicalHistoryController());
    Get.lazyPut(()=>DynamicsController());
    Get.lazyPut(()=>MedicalHistoryController());

  }
}