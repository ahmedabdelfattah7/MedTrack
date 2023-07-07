import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:medtrack/app_module/dynamics/pages/analytics.dart';
import 'package:medtrack/app_module/home/view/home.dart';
import 'package:medtrack/app_module/prescription_module/view/prescriptions.dart';
import 'package:medtrack/app_module/profile/profile.dart';
import 'package:medtrack/authentication_module/controller/auth_controller.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomeController extends GetxController {
  int currentIndex = 0;
  AuthController authController = Get.put(AuthController());
  @override

  Future<void> onInit() async {
    super.onInit();
//    authController.getUser();
  }
  List<PersistentBottomNavBarItem> bottomItems = [
     PersistentBottomNavBarItem(
       activeColorPrimary: Colors.black,
       inactiveColorPrimary: Colors.black54,
      title: 'home',
      icon: const Icon(FontAwesomeIcons.house),
    ),
     PersistentBottomNavBarItem(
       activeColorPrimary: Colors.black,
       inactiveColorPrimary: Colors.black54,
      title: 'Analytics',
      icon: const Icon(FontAwesomeIcons.chartLine),
    ),
     PersistentBottomNavBarItem(
       activeColorPrimary: Colors.black,
       inactiveColorPrimary: Colors.black54,
      title: 'Prescriptions',
      icon: const Icon(FontAwesomeIcons.prescriptionBottleMedical),
    ),
     PersistentBottomNavBarItem(
       activeColorPrimary: Colors.black,
       inactiveColorPrimary: Colors.black54,
      title: 'Profile',
      icon: const Icon(FontAwesomeIcons.addressCard),
    ),
  ];
  List<Widget> screens = [
     Home(),
     Analytics(),
     Prescriptions(),
     Profile(),
  ];
  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 1) {
       Analytics();
    } else if (index == 2) {
       Prescriptions();
    } else if (index == 2) {
       Profile();
    }
    update();
  }
}
