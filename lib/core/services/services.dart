import 'package:get/get.dart';
import 'package:medtrack/authentication_module/controller/auth_controller.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(), permanent: true);
  }
}