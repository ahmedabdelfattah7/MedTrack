
import 'package:get/get.dart';

class AuthController extends GetxController {
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    update();
  }
}
