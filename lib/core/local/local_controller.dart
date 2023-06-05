import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medtrack/core/network/local/cache_helper.dart';

class LocalController extends GetxController {
  Locale? initialLang = const Locale('en');

  @override
  void onInit() async {
    super.onInit();
    String? lang = await CacheHelper.getData(key: 'lang');
    if (lang != null) {
      initialLang = Locale(lang);
      Get.updateLocale(initialLang!);
    }
  }

  void changeLocal(String codeLang) {
    initialLang = Locale(codeLang);
    CacheHelper.saveData(key: 'lang', value: codeLang);
    Get.updateLocale(initialLang!);
  }
}
