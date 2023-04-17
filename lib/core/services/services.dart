import 'package:get/get.dart';
import 'package:medtrack/authentication_module/controller/auth_controller.dart';
import 'package:medtrack/core/local/local_controller.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(LocalController());
  }
}