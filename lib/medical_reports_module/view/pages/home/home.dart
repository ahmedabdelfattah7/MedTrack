import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medtrack/core/utils/asset_manger.dart';
import 'package:medtrack/medical_reports_module/view/widgets/home_item.dart';
import 'package:medtrack/routes/routes_constants.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String greeting = '';

    if (now.hour >= 6 && now.hour < 18) {
      greeting = 'Good Morning'.tr;
    } else {
      greeting = 'Good Evening'.tr;
    }
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.waving_hand,
                      color: Color(0xffE3BC9A),
                    ),
                    onPressed: () {},
                  ),
                  Row(
                    children: [
                      Text(
                        'hi'.tr,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        greeting,
                        style:
                            Theme.of(context).textTheme.displayMedium!.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100, right: 16, left: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: HomeItem(
                          onTap: () {
                            Get.toNamed(RouteNames.doctorDiagnosis);
                          },
                          label: 'Doctor meeting'.tr,
                          image: ImageManger.homeImages[0],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 1,
                        child: HomeItem(
                          onTap: () {
                            Get.toNamed(RouteNames.medicalHistory);
                          },
                          label: 'Medical History'.tr,
                          image: ImageManger.homeImages[1],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: HomeItem(
                          onTap: () {
                            Get.toNamed(RouteNames.dynamics);
                          },
                          label: 'Body Vitals'.tr,
                          image: ImageManger.homeImages[2],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 1,
                        child: HomeItem(
                          onTap: () {
                            Get.toNamed(RouteNames.medicalImages);
                          },
                          label: 'Medical Images'.tr,
                          image: ImageManger.homeImages[3],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
