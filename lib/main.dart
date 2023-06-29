import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medtrack/core/network/local/cache_helper.dart';
import 'package:medtrack/routes/routes_constants.dart';
import 'package:medtrack/services/settings.dart';
import 'app.dart';
import 'core/utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();
  setupLocator();
  String initialRoute;
  userUid = CacheHelper.getData(key: 'UserId');
  if (userUid != null) {
    initialRoute = RouteNames.appLayout;
  } else {
    initialRoute = RouteNames.welcome;
  }
  runApp(MedTrack(
    initialRoute: initialRoute,
  ));
}
