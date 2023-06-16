import 'package:get/get.dart';
import 'package:medtrack/app_module/app_layout/controller/home_controller.dart';
import 'package:medtrack/app_module/dynamics/controller/dynamics_controller.dart';
import 'package:medtrack/app_module/medical_history/controller/medical_history_controller.dart';
import 'package:medtrack/authentication_module/controller/auth_controller.dart';


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