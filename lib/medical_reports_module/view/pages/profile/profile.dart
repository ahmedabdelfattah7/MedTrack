import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medtrack/authentication_module/controller/auth_controller.dart';
import 'package:medtrack/authentication_module/services/auth_services.dart';

import 'package:medtrack/core/local/local_controller.dart';
import 'package:medtrack/medical_reports_module/controller/theme_controller.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);
  final AuthController authController = Get.find();
  final AuthServices authServices= Get.find();
  final ThemeController _themeController = Get.find<ThemeController>();
  LocalController localController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              GetBuilder<AuthController>(builder: (controller) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        authController.signOut();
                      },
                      child: Text('Log out from ${controller.userModel?.email}')),
                );
              }),
              Obx(() {
                return Switch(
                  value: _themeController.isDarkMode,
                  onChanged: (value) {
                    _themeController.toggleTheme();
                  },
                );
              }),
              TextButton(
                onPressed: () {
                  String currentLang = Get.locale?.languageCode ??
                      'en'; // Get the current language code, default to 'en' if null
                  String newLang = currentLang == 'ar'
                      ? 'en'
                      : 'ar'; // Toggle the language code
                  localController.changeLocal(newLang); // Change the language
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.transparent,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  padding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                ),
                child: const Text(
                  'en - عربي',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
