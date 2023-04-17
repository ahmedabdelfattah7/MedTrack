import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalController extends GetxController{
  Locale? locale;
  void changeLocal (String codeLang){
    locale= Locale(codeLang);
    Get.updateLocale(locale!);
  }
}