import 'package:get/get.dart';
import 'package:medtrack/authentication_module/view/pages/login.dart';
import 'package:medtrack/authentication_module/view/pages/signup.dart';
import 'package:medtrack/authentication_module/view/pages/welcome_screen.dart';
import 'package:medtrack/medical_reports_module/view/pages/analytics/weight.dart';
import 'package:medtrack/medical_reports_module/view/pages/home/dynamics/dynamics.dart';
import 'package:medtrack/medical_reports_module/view/pages/home/dynamics/widgets/pressure_input.dart';
import 'package:medtrack/medical_reports_module/view/pages/home/dynamics/widgets/weight.dart';
import 'package:medtrack/medical_reports_module/view/pages/home/medical_history/doctor_diagnosis.dart';
import 'package:medtrack/medical_reports_module/view/pages/home/medical_history/medical_history.dart';
import 'package:medtrack/medical_reports_module/view/pages/home/medical_history/medical_history_details.dart';
import 'package:medtrack/medical_reports_module/view/pages/prescriptions/Prescriptions.dart';
import 'package:medtrack/medical_reports_module/view/pages/analytics/analytics.dart';
import 'package:medtrack/medical_reports_module/view/pages/app_layout.dart';
import 'package:medtrack/medical_reports_module/view/pages/home/home.dart';
import 'package:medtrack/medical_reports_module/view/pages/profile/profile.dart';
import 'package:medtrack/routes/routes_constants.dart';

class Routes {
  static List<GetPage<dynamic>>? getPages = [
    GetPage(name: RouteNames.login, page: () => LoginPage()),
    GetPage(name: RouteNames.signUp, page: () => SignUp()),
    GetPage(name: RouteNames.appLayout, page: () => AppLayout()),
    GetPage(name: RouteNames.welcome, page: () => WelcomeScreen()),
    GetPage(name: RouteNames.prescriptions, page: () => const Prescriptions()),
    GetPage(name: RouteNames.analytics, page: () => const Analytics()),
    GetPage(name: RouteNames.profile, page: () => Profile()),
    GetPage(name: RouteNames.home, page: () => Home()),
    GetPage(name: RouteNames.doctorDiagnosis, page: () => DoctorDiagnosis()),
    GetPage(name: RouteNames.medicalHistory, page: () => MedicalHistory()),
    GetPage(name: RouteNames.dynamics, page: () => Dynamics()),
    GetPage(
        name: RouteNames.medicalHistoryDetails,
        page: () => const MedicalHistoryDetails()),
    GetPage(name: RouteNames.bodyVitals, page: () => VitalsInput()),
    GetPage(name: RouteNames.weightInput, page: () => WeightInput()),
    GetPage(name: RouteNames.weightResult, page: () => WeightResult()),
  ];
}
