import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medtrack/authentication_module/controller/auth_controller.dart';
import 'package:medtrack/medical_reports_module/controller/home_controller.dart';
import 'package:medtrack/medical_reports_module/view/widgets/bottomNavigationBar.dart';

class AppLayout extends StatelessWidget {
  AppLayout({Key? key}) : super(key: key);
  final HomeController homeController = Get.put(HomeController());
  final AuthController authController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: homeController.screens[homeController.currentIndex],
      bottomNavigationBar: MyTabView(),
    );
  }
}
