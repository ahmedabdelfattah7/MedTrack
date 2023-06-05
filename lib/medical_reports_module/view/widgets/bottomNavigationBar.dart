import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:medtrack/core/utils/color_manger.dart';
import 'package:medtrack/medical_reports_module/controller/home_controller.dart';
import 'package:medtrack/core/Themes/theme_controller.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class MyTabView extends StatelessWidget {
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => PersistentTabView(
          context,
          screens: homeController.screens,
          items: [
            PersistentBottomNavBarItem(
              activeColorPrimary: Get.find<ThemeController>().isDarkMode
                  ? Colors.white
                  : Colors.black,
              inactiveColorPrimary: Get.find<ThemeController>().isDarkMode
                  ?AppColors.whiteShade
                  : AppColors.mainDark,
              title: 'Home'.tr,
              icon: const Icon(FontAwesomeIcons.house),
            ),
            PersistentBottomNavBarItem(
              activeColorPrimary: Get.find<ThemeController>().isDarkMode
                  ? Colors.white
                  : Colors.black,
              inactiveColorPrimary: Get.find<ThemeController>().isDarkMode
                  ? AppColors.whiteShade
                  : AppColors.mainDark,
              title: 'Analytics'.tr,
              icon: const Icon(FontAwesomeIcons.chartLine),
            ),
            PersistentBottomNavBarItem(
              activeColorPrimary: Get.find<ThemeController>().isDarkMode
                  ? Colors.white
                  : Colors.black,
              inactiveColorPrimary: Get.find<ThemeController>().isDarkMode
                  ? AppColors.whiteShade
                  :AppColors.mainDark,
              title: 'Prescriptions'.tr,
              icon: const Icon(FontAwesomeIcons.prescriptionBottleMedical),
            ),
            PersistentBottomNavBarItem(
              activeColorPrimary: Get.find<ThemeController>().isDarkMode
                  ? Colors.white
                  : Colors.black,
              inactiveColorPrimary: Get.find<ThemeController>().isDarkMode
                  ? AppColors.whiteShade
                  : AppColors.mainDark,
              title: 'Profile'.tr,
              icon: const Icon(FontAwesomeIcons.userDoctor),
            ),
          ],
          confineInSafeArea: true,
          backgroundColor: Get.find<ThemeController>().isDarkMode
              ? AppColors.mainDark
              : Colors.white,
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: true,
          hideNavigationBarWhenKeyboardShows: true,
          decoration: NavBarDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(30.0)),
            colorBehindNavBar: Get.find<ThemeController>().isDarkMode
                ? Colors.white
                : Colors.black,
          ),
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          navBarStyle: NavBarStyle.style6,
        ));
  }
}
