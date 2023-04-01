import 'package:get/get.dart';
import 'package:medtrack/authentication_module/view/pages/login.dart';
import 'package:medtrack/authentication_module/view/pages/signup.dart';

class Routes {
  static List<GetPage<dynamic>>? getPages = [
    GetPage(name: '/login', page: () => const LoginPage()),
    GetPage(name: '/signUp', page: () => const SignUp()),
  ];
}
