import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medtrack/core/utils/color_manger.dart';

class AppTextStyles {
  static TextStyle? hint = TextStyle(
    color: AppColors.hint,
    fontSize: 18,
  );
  static TextStyle? bigText = TextStyle(
    color: AppColors.black,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );
  static TextStyle? textFormField = const TextStyle(
    fontSize: 18,
  );

  static TextStyle? button = TextStyle(
    color: AppColors.white,
    fontSize: 22,
  );
}
