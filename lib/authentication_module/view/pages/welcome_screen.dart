import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:medtrack/core/local/local_controller.dart';
LocalController localController = Get.put(LocalController());
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            SvgPicture.asset(
              'assets/images/splash_bg.svg',
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    String currentLang = Get.locale?.languageCode ?? 'en'; // Get the current language code, default to 'en' if null
                    String newLang = currentLang == 'ar' ? 'en' : 'ar'; // Toggle the language code
                    localController.changeLocal(newLang); // Change the language
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.transparent,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  ),
                  child: const Text(
                    'en - عربي',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const Spacer(),
                    const Text(
                      'MedTrack',
                      style: TextStyle(
                        fontSize: 48,
                        color: Colors.white,
                        fontFamily: 'PermanentMarker',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed('/signUp');
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xff6cd8d1),
                        ),
                        child:  Text('signUp'.tr),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.toNamed('/login');
                          },
                          style: TextButton.styleFrom(
                              elevation: 0,
                              backgroundColor: Colors.transparent,
                              shape: const RoundedRectangleBorder(
                                side: BorderSide(color: Color(0xff6cd8d1)),
                              )),
                          child:  Text('login'.tr),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
