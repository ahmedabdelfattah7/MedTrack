import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../utils/color_manger.dart';

class AppThemes {
  static const _latoFontFamily = 'Lato';
  static const _cairoFontFamily = 'Cairo';

  static ThemeData getThemeDataDark({String? fontFamily}) {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.backGroundDark,
      fontFamily: fontFamily ??
          (Get.locale?.languageCode == 'ar'
              ? _cairoFontFamily
              : _latoFontFamily),
      primaryColor: Colors.blueGrey,
      textTheme: TextTheme(
        displayLarge: const TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
        bodyLarge: TextStyle(
          color: Colors.grey[400],
          fontSize: 18,
        ),
        bodyMedium: const TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        suffixIconColor: Colors.white,
        prefixIconColor: Colors.white,
        errorStyle: const TextStyle(fontSize: 11),
        fillColor: AppColors.mainDark,
        filled: true,
        labelStyle: TextStyle(
          color: AppColors.white,
          fontSize: 18,
        ),
        contentPadding: const EdgeInsets.all(20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.white,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: AppColors.white,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: AppColors.white,
            width: 1.0,
          ),
        ),
      ),
      appBarTheme: AppBarTheme(
        titleSpacing: 20,
        backgroundColor: Colors.grey[900],
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.grey[900],
          statusBarIconBrightness: Brightness.light,
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      drawerTheme: DrawerThemeData(
        backgroundColor: Colors.grey[800],
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.orangeAccent,
        elevation: 8.0,
        backgroundColor: AppColors.mainDark,
      ),
    );
  }

  static ThemeData getThemeDataLight({String? fontFamily}) {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.blue,
      fontFamily: fontFamily ??
          (Get.locale?.languageCode == 'ar'
              ? _cairoFontFamily
              : _latoFontFamily),
      textTheme: TextTheme(
        displayLarge: const TextStyle(
          color: Colors.black,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: const TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
        bodyLarge: TextStyle(
          color: Colors.grey[400],
          fontSize: 18,
        ),
        bodyMedium: const TextStyle(
          color: Colors.black,
          fontSize: 14,
        ),
      ),
      appBarTheme: const AppBarTheme(
        titleSpacing: 20,
        backgroundColor: Colors.white,
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        errorStyle: const TextStyle(fontSize: 11),
        fillColor: Colors.white,
        filled: true,
        contentPadding: const EdgeInsets.all(20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.white,
            width: 1.0,
          ),
          // Add the box shadow here

        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: AppColors.border,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
            width: 1.0,
          ),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primarySwatch,
        elevation: 50.0,
        unselectedItemColor: Colors.blue,
        backgroundColor: Colors.grey.shade50,
      ),
    );
  }
}
