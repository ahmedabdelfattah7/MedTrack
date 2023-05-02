import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medtrack/core/network/local/cache_helper.dart';

class LocalController extends GetxController {
  Locale? initialLang = CacheHelper.getData(key: 'lang') == 'ar'
      ? const Locale('ar')
      : const Locale('en');
  Locale? locale;
  void changeLocal(String codeLang) {
    locale = Locale(codeLang);
    CacheHelper.saveData(key: 'lang', value: codeLang);
    Get.updateLocale(locale!);
  }
}
