import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medtrack/authentication_module/controller/auth_controller.dart';
import 'package:medtrack/core/network/local/cache_helper.dart';
import 'app.dart';
import 'core/utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(AuthController());
  await CacheHelper.init();
  String initialRoute;
   uId = CacheHelper.getData(key: 'UserId');
  if (uId != null) {
    initialRoute = '/home';
  } else {
    initialRoute = '/welcome';
  }
  runApp(MedTrack(
    initialRoute: initialRoute,
  ));
}
