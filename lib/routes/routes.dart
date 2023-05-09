import 'package:get/get.dart';
import 'package:medtrack/authentication_module/view/pages/login.dart';
import 'package:medtrack/authentication_module/view/pages/signup.dart';
import 'package:medtrack/authentication_module/view/pages/welcome_screen.dart';
import 'package:medtrack/medical_reports_module/view/pages/medical%20history/doctor_diagnosis.dart';
import 'package:medtrack/medical_reports_module/view/pages/medical%20history/medical_history.dart';
import 'package:medtrack/medical_reports_module/view/pages/prescriptions/Prescriptions.dart';
import 'package:medtrack/medical_reports_module/view/pages/analytics/analytics.dart';
import 'package:medtrack/medical_reports_module/view/pages/app_layout.dart';

import 'package:medtrack/medical_reports_module/view/pages/home.dart';

import 'package:medtrack/medical_reports_module/view/pages/profile/profile.dart';

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
    GetPage(name: '/medicalHistory', page: () => MedicalHistory()),
  ];
}
