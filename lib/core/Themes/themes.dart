import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medtrack/core/utils/color_manger.dart';

class AppThemes {
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.backGroundDark,
    primaryColor: AppColors.primarySwatch,
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: AppColors.white,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      labelMedium: TextStyle(
        color: AppColors.white,
        fontSize: 18,
      ),
      bodySmall: TextStyle(
        color: AppColors.hint,
        fontSize: 18,
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
    appBarTheme: const AppBarTheme(
      titleSpacing: 20,
      backgroundColor: Color(0xff121212),
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Color(0xff121212),
        statusBarIconBrightness: Brightness.light,
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: Color(0xff333739),
    ),
  );

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    primaryColor: AppColors.primaryColor,
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: AppColors.black,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      labelMedium: TextStyle(
        color: AppColors.black,
        fontSize: 18,
      ),
      bodySmall: TextStyle(
        color: AppColors.hint,
        fontSize: 18,
      ),
    ),
    primarySwatch: Colors.blue,
    appBarTheme: const AppBarTheme(
      titleSpacing: 20,
     // backgroundColor: Color(0xfff1f3f6),
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Color(0xfff6f4f4ff),
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
      // suffixIconColor: Colors.grey,
      // prefixIconColor: Colors.grey,
      errorStyle: const TextStyle(fontSize: 11),
      fillColor: const Color(0xffF9F9F9),
      filled: true,
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
        borderSide:  BorderSide(
          color:AppColors.border,
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
  );
}
