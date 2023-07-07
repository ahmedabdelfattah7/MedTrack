import 'package:get/get.dart';
import 'package:medtrack/app_module/app_layout/view/app_layout.dart';
import 'package:medtrack/app_module/dynamics/pages/analytics.dart';
import 'package:medtrack/app_module/dynamics/pages/dynamics.dart';
import 'package:medtrack/app_module/dynamics/pages/pressure_input.dart';
import 'package:medtrack/app_module/dynamics/pages/weight_input.dart';
import 'package:medtrack/app_module/dynamics/pages/weight_output.dart';
import 'package:medtrack/app_module/home/view/home.dart';
import 'package:medtrack/app_module/medical_history/pages/doctor_diagnosis.dart';
import 'package:medtrack/app_module/medical_history/pages/medical_history.dart';
import 'package:medtrack/app_module/medical_history/pages/medical_history_details.dart';
import 'package:medtrack/app_module/medical_images/view/medical_image_large_scale.dart';
import 'package:medtrack/app_module/medical_images/view/medical_images.dart';
import 'package:medtrack/app_module/prescription_module/view/prescriptions.dart';
import 'package:medtrack/app_module/profile/profile.dart';
import 'package:medtrack/authentication_module/view/pages/login.dart';
import 'package:medtrack/authentication_module/view/pages/signup.dart';
import 'package:medtrack/authentication_module/view/pages/welcome_screen.dart';
import 'package:medtrack/routes/routes_constants.dart';

class Routes {
  static List<GetPage<dynamic>>? getPages = [
    GetPage(name: RouteNames.login, page: () => LoginPage()),
    GetPage(name: RouteNames.signUp, page: () => SignUp()),
    GetPage(name: RouteNames.appLayout, page: () => AppLayout()),
    GetPage(name: RouteNames.welcome, page: () => WelcomeScreen()),
    GetPage(name: RouteNames.prescriptions, page: () =>  Prescriptions()),
    GetPage(name: RouteNames.analytics, page: () => Analytics()),
    GetPage(name: RouteNames.profile, page: () => Profile()),
    GetPage(name: RouteNames.home, page: () => Home()),
    GetPage(name: RouteNames.doctorDiagnosis, page: () => DoctorDiagnosis()),
    GetPage(name: RouteNames.medicalHistory, page: () => MedicalHistory()),
    GetPage(name: RouteNames.dynamics, page: () => Dynamics()),
    GetPage(name: RouteNames.medicalHistoryDetails,
        page: () =>  MedicalHistoryDetails()),
    GetPage(name: RouteNames.bodyVitals, page: () => VitalsInput()),
    GetPage(name: RouteNames.weightInput, page: () => WeightInput()),
    GetPage(name: RouteNames.weightResult, page: () => WeightResult()),
    GetPage(name: RouteNames.medicalImages, page: () => MedicalImages()),
    GetPage(name: RouteNames.medicalImagesLargeScale, page: () => MedicalImagesWithLargeScaleView()),
  ];
}
