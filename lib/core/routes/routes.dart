import 'package:get/get.dart';
import 'package:medtrack/authentication_module/model/user_model.dart';
import 'package:medtrack/authentication_module/view/pages/login.dart';
import 'package:medtrack/authentication_module/view/pages/signup.dart';
import 'package:medtrack/authentication_module/view/pages/welcome_screen.dart';
import 'package:medtrack/medical_reports_module/view/pages/home.dart';

class Routes {
  static List<GetPage<dynamic>>? getPages = [
    GetPage(name: '/login', page: () => LoginPage()),
    GetPage(name: '/signUp', page: () => SignUp()),
    GetPage(name: '/home', page: () => Home()),
    GetPage(name: '/welcome', page: () =>  WelcomeScreen()),
  ];
}
