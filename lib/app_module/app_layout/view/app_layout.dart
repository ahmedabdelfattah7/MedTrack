import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medtrack/app_module/app_layout/controller/home_controller.dart';
import 'package:medtrack/app_module/app_layout/view/widgets/bottomNavigationBar.dart';
import 'package:medtrack/authentication_module/controller/auth_controller.dart';

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
