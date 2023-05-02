import 'package:get/get.dart';
import 'package:medtrack/authentication_module/view/pages/login.dart';
import 'package:medtrack/authentication_module/view/pages/signup.dart';
import 'package:medtrack/authentication_module/view/pages/welcome_screen.dart';
import 'package:medtrack/medical_reports_module/view/pages/Prescriptions.dart';
import 'package:medtrack/medical_reports_module/view/pages/analytics.dart';
import 'package:medtrack/medical_reports_module/view/pages/app_layout.dart';
import 'package:medtrack/medical_reports_module/view/pages/home/doctor_diagnosis.dart';
import 'package:medtrack/medical_reports_module/view/pages/home/home.dart';
import 'package:medtrack/medical_reports_module/view/pages/home/medical_history.dart';
import 'package:medtrack/medical_reports_module/view/pages/profile.dart';

class Routes {
  static List<GetPage<dynamic>>? getPages = [
    GetPage(name: '/login', page: () => LoginPage()),
    GetPage(name: '/signUp', page: () => SignUp()),
    GetPage(name: '/AppLayout', page: () => AppLayout()),
    GetPage(name: '/welcome', page: () => const WelcomeScreen()),
    GetPage(name: '/prescriptions', page: () => const Prescriptions()),
    GetPage(name: '/analytics', page: () => const Analytics()),
    GetPage(name: '/profile', page: () => Profile()),
    GetPage(name: '/home', page: () => Home()),
    GetPage(name: '/doctorDiagnosis', page: () => DoctorDiagnosis()),
    GetPage(name: '/medicalHistory', page: () =>  MedicalHistory()),
  ];
}
